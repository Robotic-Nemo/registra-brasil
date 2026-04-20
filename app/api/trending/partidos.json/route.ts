import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildTrending, resolveTrendingWindow } from '@/lib/stats/trending-window'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/trending/partidos.json — momentum ranking by party.
 *   ?janela=7..60 (default 30)
 *   ?limite=5..50 (default 20)
 *   ?min_recent=1..20 (default 5)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'trend-pt'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const janela = Math.max(7, Math.min(60, Number(request.nextUrl.searchParams.get('janela')) || 30))
  const limit = Math.max(5, Math.min(50, Number(request.nextUrl.searchParams.get('limite')) || 20))
  const minRecent = Math.max(1, Math.min(20, Number(request.nextUrl.searchParams.get('min_recent')) || 5))
  const { startStr, midStr } = resolveTrendingWindow(janela)

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, severity_score, politicians!inner(party)')
    .neq('verification_status', 'removed')
    .gte('statement_date', startStr)
    .limit(60000)
  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statement_date: string; severity_score: number | null; politicians: { party: string | null } | null }
  const rows = (data ?? []) as Row[]

  const ranked = buildTrending(rows, (r) => r.politicians?.party ?? null, midStr, limit, minRecent)
  const results = ranked.map((r) => ({
    party: r.key,
    recent: r.recent,
    prior: r.prior,
    delta: r.delta,
    delta_pct: r.delta_pct,
    avg_severity_recent: r.avg_severity_recent,
    url: `${SITE_URL}/partidos/${encodeURIComponent(r.key)}`,
  }))

  const etag = `W/"trend-pt-${janela}-${limit}-${minRecent}-${rows.length}-${results.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    janela, min_recent: minRecent, count: results.length, results,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
