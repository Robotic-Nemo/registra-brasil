import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildTrending, resolveTrendingWindow } from '@/lib/stats/trending-window'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/trending/politicos.json — momentum ranking. Compares recent
 * window (last `janela` days) vs prior window of same length. Ships
 * delta count + delta pct + avg severity recent, sorted by delta.
 *   ?janela=7..60 (default 30)
 *   ?limite=5..100 (default 25)
 *   ?min_recent=1..20 (default 3)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'trend-pol'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const janela = Math.max(7, Math.min(60, Number(request.nextUrl.searchParams.get('janela')) || 30))
  const limit = Math.max(5, Math.min(100, Number(request.nextUrl.searchParams.get('limite')) || 25))
  const minRecent = Math.max(1, Math.min(20, Number(request.nextUrl.searchParams.get('min_recent')) || 3))
  const { startStr, midStr } = resolveTrendingWindow(janela)

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('politician_id, statement_date, severity_score')
    .neq('verification_status', 'removed')
    .gte('statement_date', startStr)
    .limit(60000)
  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { politician_id: string | null; statement_date: string; severity_score: number | null }
  const rows = (data ?? []) as Row[]

  const ranked = buildTrending(rows, (r) => r.politician_id, midStr, limit, minRecent)
  const ids = ranked.map((r) => r.key)

  const { data: pols } = ids.length
    ? await (supabase.from('politicians') as any)
        .select('id, slug, full_name, party, uf, photo_url')
        .in('id', ids)
    : { data: [] }
  type Pol = { id: string; slug: string; full_name: string; party: string | null; uf: string | null; photo_url: string | null }
  const byId = new Map<string, Pol>(((pols ?? []) as Pol[]).map((p) => [p.id, p]))

  const results = ranked
    .map((r) => {
      const p = byId.get(r.key)
      if (!p) return null
      return {
        politician_id: r.key,
        slug: p.slug,
        full_name: p.full_name,
        party: p.party,
        uf: p.uf,
        photo_url: p.photo_url,
        recent: r.recent,
        prior: r.prior,
        delta: r.delta,
        delta_pct: r.delta_pct,
        avg_severity_recent: r.avg_severity_recent,
        url: `${SITE_URL}/politicos/${p.slug}`,
      }
    })
    .filter(Boolean)

  const etag = `W/"trend-pol-${janela}-${limit}-${minRecent}-${rows.length}-${results.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    janela,
    min_recent: minRecent,
    count: results.length,
    results,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
