import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/top-estados.json — UF leaderboard by weighted severity
 * score (same decay formula as /api/ranking.json and
 * /api/top-partidos.json). Useful for national overview dashboards.
 *   ?limite=1..27 (default 27)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'top-estados'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const limit = Math.max(1, Math.min(27, Number(request.nextUrl.searchParams.get('limite')) || 27))

  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('statements') as any)
    .select('statement_date, severity_score, politicians!inner(state)')
    .in('verification_status', ['verified', 'disputed'])
    .order('statement_date', { ascending: false })
    .limit(15000)

  type Row = { statement_date: string; severity_score: number | null; politicians: { state: string | null } }
  const agg = new Map<string, { count: number; score: number; severitySum: number; severityN: number }>()
  const now = Date.now()
  for (const r of ((data ?? []) as Row[])) {
    const uf = r.politicians?.state
    if (!uf) continue
    const sev = r.severity_score ?? 1
    const ageDays = (now - new Date(r.statement_date + 'T12:00:00Z').getTime()) / 86400_000
    const score = sev * Math.exp(-ageDays / 365)
    const e = agg.get(uf) ?? { count: 0, score: 0, severitySum: 0, severityN: 0 }
    e.count++
    e.score += score
    if (r.severity_score != null) { e.severitySum += sev; e.severityN++ }
    agg.set(uf, e)
  }

  const ranked = [...agg.entries()]
    .sort((a, b) => b[1].score - a[1].score)
    .slice(0, limit)
    .map(([uf, e], i) => ({
      rank: i + 1,
      uf,
      statement_count: e.count,
      weighted_score: +e.score.toFixed(2),
      avg_severity: e.severityN > 0 ? +(e.severitySum / e.severityN).toFixed(2) : null,
      url: `${SITE_URL}/estados/${uf.toLowerCase()}`,
    }))

  const etag = `W/"top-uf-${ranked.length}-${ranked[0]?.weighted_score ?? 0}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    method: 'severity × exp(-age_days / 365)',
    count: ranked.length,
    ranking: ranked,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
      ETag: etag,
    },
  })
}
