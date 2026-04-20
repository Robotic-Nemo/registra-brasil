import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildSeverityDailyMatrix, dailyStartStr } from '@/lib/stats/severity-daily-matrix'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/politico/:slug/severidade-por-dia.json — day × severity
 * level matrix scoped to one politician.
 *   ?dias=7..180 (default 60)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'pol-sev-dia'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const dias = Math.max(7, Math.min(180, Number(request.nextUrl.searchParams.get('dias')) || 60))

  const supabase = getSupabaseServiceClient()
  const { data: pol } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name, party, state')
    .eq('slug', slug)
    .maybeSingle()
  if (!pol) {
    return NextResponse.json({ error: 'Político não encontrado' }, { status: 404 })
  }

  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, severity_score')
    .eq('politician_id', pol.id)
    .neq('verification_status', 'removed')
    .gte('statement_date', dailyStartStr(dias))
    .limit(20000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statement_date: string; severity_score: number | null }
  const { series, total } = buildSeverityDailyMatrix(dias, (data ?? []) as Row[])

  const etag = `W/"pol-sev-dia-${pol.id.slice(0, 8)}-${dias}-${total}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    politician: {
      slug: pol.slug, common_name: pol.common_name,
      party: pol.party, state: pol.state,
      url: `${SITE_URL}/politico/${pol.slug}`,
    },
    dias, total, series,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
