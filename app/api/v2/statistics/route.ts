import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'edge'

/**
 * GET /api/v2/statistics — Public statistics API with counts, trends, and top entities.
 */
export async function GET(request: NextRequest) {
  const rateLimitKey = getRateLimitKey(request, 'api-v2-statistics')
  const { allowed, remaining, resetAt } = checkRateLimit(rateLimitKey, { limit: 30, windowMs: 60_000 })
  if (!allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Rate limit exceeded' } },
      { status: 429, headers: { 'Retry-After': String(Math.ceil((resetAt - Date.now()) / 1000)) } }
    )
  }

  const supabase = getSupabaseServiceClient()
  const now = new Date()
  const d30 = new Date(now.getTime() - 30 * 86_400_000).toISOString().slice(0, 10)
  const d7 = new Date(now.getTime() - 7 * 86_400_000).toISOString().slice(0, 10)

  const [
    totalStmts,
    verifiedStmts,
    disputedStmts,
    totalPols,
    totalCats,
    stmts30d,
    stmts7d,
    verif30d,
    topPartiesRes,
    topStatesRes,
  ] = await Promise.all([
    supabase.from('statements').select('id', { count: 'exact', head: true }),
    supabase.from('statements').select('id', { count: 'exact', head: true }).eq('verification_status', 'verified'),
    supabase.from('statements').select('id', { count: 'exact', head: true }).eq('verification_status', 'disputed'),
    supabase.from('politicians').select('id', { count: 'exact', head: true }).eq('is_active', true),
    supabase.from('categories').select('id', { count: 'exact', head: true }),
    supabase.from('statements').select('id', { count: 'exact', head: true }).gte('created_at', d30),
    supabase.from('statements').select('id', { count: 'exact', head: true }).gte('created_at', d7),
    supabase.from('statements').select('id', { count: 'exact', head: true })
      .eq('verification_status', 'verified').gte('reviewed_at', d30),
    // Top parties: get politicians with statement counts
    supabase.from('politicians').select('party').eq('is_active', true),
    supabase.from('politicians').select('state').eq('is_active', true).not('state', 'is', null),
  ])

  // Aggregate top parties
  const partyCount = new Map<string, number>()
  if (topPartiesRes.data) {
    for (const row of topPartiesRes.data as unknown as { party: string }[]) {
      partyCount.set(row.party, (partyCount.get(row.party) ?? 0) + 1)
    }
  }
  const topParties = Array.from(partyCount.entries())
    .map(([party, count]) => ({ party, count }))
    .sort((a, b) => b.count - a.count)
    .slice(0, 10)

  // Aggregate top states
  const stateCount = new Map<string, number>()
  if (topStatesRes.data) {
    for (const row of topStatesRes.data as unknown as { state: string }[]) {
      if (row.state) stateCount.set(row.state, (stateCount.get(row.state) ?? 0) + 1)
    }
  }
  const topStates = Array.from(stateCount.entries())
    .map(([state, count]) => ({ state, count }))
    .sort((a, b) => b.count - a.count)
    .slice(0, 10)

  const response = {
    data: {
      counts: {
        statements: totalStmts.count ?? 0,
        verified: verifiedStmts.count ?? 0,
        disputed: disputedStmts.count ?? 0,
        politicians: totalPols.count ?? 0,
        categories: totalCats.count ?? 0,
      },
      trends: {
        statementsLast30d: stmts30d.count ?? 0,
        statementsLast7d: stmts7d.count ?? 0,
        verificationsLast30d: verif30d.count ?? 0,
      },
      topParties,
      topStates,
    },
  }

  return NextResponse.json(response, {
    headers: {
      'Cache-Control': 'public, s-maxage=1800, stale-while-revalidate=86400',
      'Vary': 'Accept-Encoding',
      'X-RateLimit-Remaining': String(remaining),
      'X-API-Version': 'v2',
    },
  })
}
