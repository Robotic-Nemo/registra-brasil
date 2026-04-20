import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { BRAZIL_TILES } from '@/lib/maps/brazil-tile'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/ranking/por-estado.json — UF-level weighted ranking.
 * Aggregates the `severity × exp(-ageDays/365)` score across all
 * verified+disputed statements by politicians in each UF. Output
 * covers every UF in BRAZIL_TILES (zero-filled) so clients can
 * render a complete choropleth without post-merge.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'ranking-por-estado'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, severity_score, politicians!inner(state)')
    .in('verification_status', ['verified', 'disputed'])
    .order('statement_date', { ascending: false })
    .limit(10000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statement_date: string; severity_score: number | null; politicians: { state: string | null } }
  const now = Date.now()
  const agg = new Map<string, { count: number; score: number; sevSum: number; sevN: number }>()
  for (const r of ((data ?? []) as Row[])) {
    const uf = r.politicians?.state?.toUpperCase()
    if (!uf) continue
    const sev = r.severity_score ?? 1
    const ageDays = (now - new Date(r.statement_date + 'T12:00:00Z').getTime()) / 86400_000
    const score = sev * Math.exp(-ageDays / 365)
    const e = agg.get(uf) ?? { count: 0, score: 0, sevSum: 0, sevN: 0 }
    e.count++
    e.score += score
    if (r.severity_score != null) { e.sevSum += sev; e.sevN++ }
    agg.set(uf, e)
  }

  const results = BRAZIL_TILES.map((t) => {
    const e = agg.get(t.uf)
    return {
      uf: t.uf,
      name: t.name,
      region: t.region,
      statement_count: e?.count ?? 0,
      weighted_score: e ? +e.score.toFixed(2) : 0,
      avg_severity: e && e.sevN > 0 ? +(e.sevSum / e.sevN).toFixed(2) : null,
      url: `${SITE_URL}/estados/${t.uf}`,
    }
  }).sort((a, b) => b.weighted_score - a.weighted_score)
    .map((r, i) => ({ rank: i + 1, ...r }))

  const etag = `W/"rank-por-estado-${results.reduce((s, r) => s + r.statement_count, 0)}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
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
