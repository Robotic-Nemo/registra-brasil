import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { ageDaysFromStatementDate, decayScore } from '@/lib/utils/age-decay'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/ranking.json — weighted politician ranking.
 *
 * Score: severity × exp(-ageDays/365), computed client-side over the
 * first 5k verified+disputed statements (reverse chron) — enough to
 * capture the last 2–3 years at typical ingest. Fast path: no extra
 * schema needed.
 *
 * ?limite=N (1..100, default 50).
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'ranking-json'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const lim = Math.max(1, Math.min(100, Number(request.nextUrl.searchParams.get('limite')) || 50))

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, severity_score, politician_id, politicians!inner(slug, common_name, party, state)')
    .in('verification_status', ['verified', 'disputed'])
    .order('statement_date', { ascending: false })
    .limit(5000)
  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 })
  }

  type Row = {
    statement_date: string; severity_score: number | null; politician_id: string
    politicians: { slug: string; common_name: string; party: string | null; state: string | null }
  }

  interface Agg { pol: Row['politicians']; count: number; score: number }
  const agg = new Map<string, Agg>()
  const now = Date.now()
  for (const r of ((data ?? []) as Row[])) {
    const severity = r.severity_score ?? 1
    const ageDays = ageDaysFromStatementDate(now, r.statement_date)
    const scoreContribution = decayScore(severity, ageDays)
    const e = agg.get(r.politician_id)
    if (e) {
      e.count++
      e.score += scoreContribution
    } else {
      agg.set(r.politician_id, { pol: r.politicians, count: 1, score: scoreContribution })
    }
  }

  const ranked = [...agg.values()]
    .sort((a, b) => b.score - a.score)
    .slice(0, lim)
    .map((e, i) => ({
      rank: i + 1,
      slug: e.pol.slug,
      common_name: e.pol.common_name,
      party: e.pol.party,
      state: e.pol.state,
      statement_count: e.count,
      weighted_score: +e.score.toFixed(2),
      url: `${SITE_URL}/politico/${e.pol.slug}`,
    }))

  return NextResponse.json({
    method: 'severity × exp(-age_days / 365)',
    count: ranked.length,
    ranking: ranked,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
    },
  })
}
