import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/declaracao/[id]/context.json — chronological neighbours
 * from the same politician: N before + N after by statement_date.
 * Useful for "what else was this person saying that week" UIs and
 * the /contexto/ explorer.
 *   ?n=1..10  neighbours per side (default 3)
 */
interface Params { params: Promise<{ id: string }> }

export async function GET(request: NextRequest, { params }: Params) {
  const rl = checkRateLimit(getRateLimitKey(request, 'stmt-ctx'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { id: raw } = await params
  const n = Math.max(1, Math.min(10, Number(request.nextUrl.searchParams.get('n')) || 3))
  const isUuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(raw)

  const supabase = getSupabaseServiceClient()
  const { data: seed } = isUuid
    ? await (supabase.from('statements') as any)
        .select('id, slug, summary, statement_date, politician_id, politicians!inner(slug, common_name, party, state)')
        .eq('id', raw)
        .maybeSingle()
    : await (supabase.from('statements') as any)
        .select('id, slug, summary, statement_date, politician_id, politicians!inner(slug, common_name, party, state)')
        .eq('slug', raw)
        .maybeSingle()
  if (!seed) {
    return NextResponse.json({ error: 'not_found', id: raw }, { status: 404 })
  }
  type Seed = {
    id: string; slug: string | null; summary: string; statement_date: string; politician_id: string
    politicians: { slug: string; common_name: string; party: string | null; state: string | null }
  }
  const s = seed as Seed

  const build = () => (supabase.from('statements') as any)
    .select('id, slug, summary, statement_date, severity_score')
    .eq('politician_id', s.politician_id)
    .neq('id', s.id)
    .neq('verification_status', 'removed')

  const [beforeRes, afterRes] = await Promise.all([
    build().lte('statement_date', s.statement_date).order('statement_date', { ascending: false }).limit(n),
    build().gte('statement_date', s.statement_date).order('statement_date', { ascending: true }).limit(n),
  ])

  const shape = (r: any) => ({
    id: r.id, slug: r.slug, summary: r.summary,
    statement_date: r.statement_date, severity_score: r.severity_score,
    url: `${SITE_URL}/declaracao/${r.slug ?? r.id}`,
  })

  return NextResponse.json({
    seed: {
      id: s.id, slug: s.slug, summary: s.summary,
      statement_date: s.statement_date,
      url: `${SITE_URL}/declaracao/${s.slug ?? s.id}`,
      politician: {
        slug: s.politicians.slug,
        common_name: s.politicians.common_name,
        party: s.politicians.party,
        state: s.politicians.state,
      },
    },
    before: ((beforeRes.data ?? []) as any[]).map(shape),
    after: ((afterRes.data ?? []) as any[]).map(shape),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
    },
  })
}
