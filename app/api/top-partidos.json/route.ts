import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { ageDaysFromStatementDate, decayScore } from '@/lib/utils/age-decay'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/top-partidos.json — party leaderboard by weighted score
 * (severity × exp(-ageDays/365)) across non-removed statements in
 * the last ~3 years. Also returns raw counts and average severity
 * for easy narrative use.
 *   ?limite=1..60 (default 30)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'top-partidos'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const limit = Math.max(1, Math.min(60, Number(request.nextUrl.searchParams.get('limite')) || 30))

  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('statements') as any)
    .select('statement_date, severity_score, politicians!inner(party)')
    .in('verification_status', ['verified', 'disputed'])
    .order('statement_date', { ascending: false })
    .limit(15000)

  type Row = { statement_date: string; severity_score: number | null; politicians: { party: string | null } }
  const agg = new Map<string, { count: number; score: number; severitySum: number; severityN: number }>()
  const now = Date.now()
  for (const r of ((data ?? []) as Row[])) {
    const party = r.politicians?.party
    if (!party) continue
    const sev = r.severity_score ?? 1
    const ageDays = ageDaysFromStatementDate(now, r.statement_date)
    const score = decayScore(sev, ageDays)
    const e = agg.get(party) ?? { count: 0, score: 0, severitySum: 0, severityN: 0 }
    e.count++
    e.score += score
    if (r.severity_score != null) { e.severitySum += sev; e.severityN++ }
    agg.set(party, e)
  }

  const ranked = [...agg.entries()]
    .sort((a, b) => b[1].score - a[1].score)
    .slice(0, limit)
    .map(([party, e], i) => ({
      rank: i + 1,
      party,
      statement_count: e.count,
      weighted_score: +e.score.toFixed(2),
      avg_severity: e.severityN > 0 ? +(e.severitySum / e.severityN).toFixed(2) : null,
      url: `${SITE_URL}/partidos/${encodeURIComponent(party)}`,
    }))

  const etag = `W/"top-pt-${ranked.length}-${ranked[0]?.weighted_score ?? 0}"`
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
