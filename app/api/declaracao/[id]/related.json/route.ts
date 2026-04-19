import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

interface Params { params: Promise<{ id: string }> }

/**
 * GET /api/declaracao/[id]/related.json — related statements for one
 * declaration. Two buckets:
 *   same_politician: most recent non-removed by the same person.
 *   same_category: statements sharing at least one primary category.
 * Lookup by UUID or slug (via ilike prefix to match /s/[id] behaviour).
 * ?limite=N (1..30, default 10) per bucket.
 */
export async function GET(request: NextRequest, { params }: Params) {
  const rl = checkRateLimit(getRateLimitKey(request, 'related-json'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { id: raw } = await params
  const limit = Math.max(1, Math.min(30,
    Number(request.nextUrl.searchParams.get('limite')) || 10))

  const supabase = getSupabaseServiceClient()

  // Resolve id or slug → canonical statement row.
  const isUuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(raw)
  const selector = (supabase.from('statements') as any)
    .select('id, slug, summary, politician_id, politicians!inner(slug, common_name, party, state), statement_categories(is_primary, category_id)')
    .neq('verification_status', 'removed')

  const { data: seedRow } = isUuid
    ? await selector.eq('id', raw).maybeSingle()
    : await selector.eq('slug', raw).maybeSingle()

  if (!seedRow) {
    return NextResponse.json({ error: 'not_found', id: raw }, { status: 404 })
  }
  type Seed = {
    id: string; slug: string | null; summary: string; politician_id: string
    politicians: { slug: string; common_name: string; party: string | null; state: string | null }
    statement_categories: Array<{ is_primary: boolean; category_id: string }>
  }
  const seed = seedRow as Seed

  const primaryCatIds = seed.statement_categories.filter((sc) => sc.is_primary).map((sc) => sc.category_id)

  const [samePolRes, sameCatRes] = await Promise.all([
    (supabase.from('statements') as any)
      .select('id, slug, summary, statement_date, severity_score')
      .eq('politician_id', seed.politician_id)
      .neq('id', seed.id)
      .neq('verification_status', 'removed')
      .order('statement_date', { ascending: false })
      .limit(limit),
    primaryCatIds.length === 0 ? Promise.resolve({ data: [] as Array<{ statement_id: string }> }) :
      (supabase.from('statement_categories') as any)
        .select('statement_id')
        .in('category_id', primaryCatIds)
        .neq('statement_id', seed.id)
        .limit(limit * 4),
  ])

  const sameCatIds = [...new Set(((sameCatRes.data ?? []) as Array<{ statement_id: string }>).map((r) => r.statement_id))].slice(0, limit * 2)
  const { data: sameCatRows } = sameCatIds.length === 0
    ? { data: [] as any[] }
    : await (supabase.from('statements') as any)
        .select('id, slug, summary, statement_date, severity_score, politicians!inner(slug, common_name, party, state)')
        .in('id', sameCatIds)
        .neq('verification_status', 'removed')
        .order('statement_date', { ascending: false })
        .limit(limit)

  const toPublic = (r: any) => ({
    id: r.id,
    slug: r.slug,
    summary: r.summary,
    statement_date: r.statement_date,
    severity_score: r.severity_score,
    permalink: `${SITE_URL}/declaracao/${r.slug ?? r.id}`,
    politician: r.politicians ?? null,
  })

  return NextResponse.json({
    seed: {
      id: seed.id,
      slug: seed.slug,
      permalink: `${SITE_URL}/declaracao/${seed.slug ?? seed.id}`,
      politician: seed.politicians,
    },
    same_politician: ((samePolRes.data ?? []) as any[]).map((r) => ({
      ...toPublic(r),
      politician: seed.politicians,
    })),
    same_category: (sameCatRows ?? []).map(toPublic),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=7200',
    },
  })
}
