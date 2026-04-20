import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { createLogger } from '@/lib/utils/logger'

export const runtime = 'edge'

const log = createLogger('api/v2/statistics/by-state')

/**
 * GET /api/v2/statistics/by-state — Counts verified statements grouped by
 * politician state. Useful for generating heatmaps and geographic breakdowns.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'api-v2-stats-state'), {
    limit: 60,
    windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Rate limit exceeded' } },
      {
        status: 429,
        headers: { 'Retry-After': String(Math.ceil((rl.resetAt - Date.now()) / 1000)) },
      }
    )
  }

  const supabase = getSupabaseServiceClient()

  try {
    // Fetch politicians with their verified-statement counts, then aggregate by state.
    // We pull a capped set and aggregate in memory — Supabase PostgREST cannot
    // group across nested relations easily without a SQL view.
    const { data, error } = await supabase
      .from('politicians')
      .select('state, statements!inner(count)')
      .eq('is_active', true)
      .eq('statements.verification_status', 'verified')
      .not('state', 'is', null)
      .limit(2000)

    if (error) {
      log.error('query failed', { err: error.message })
      return NextResponse.json(
        { error: { code: 'INTERNAL_ERROR', message: 'Failed to compute stats' } },
        { status: 500 }
      )
    }

    const rows = (data ?? []) as unknown as { state: string | null; statements: { count: number }[] }[]
    const byState = new Map<string, number>()
    for (const row of rows) {
      if (!row.state) continue
      const uf = row.state.toUpperCase()
      const count = row.statements[0]?.count ?? 0
      byState.set(uf, (byState.get(uf) ?? 0) + count)
    }

    const result = Array.from(byState.entries())
      .map(([state, count]) => ({ state, count }))
      .sort((a, b) => b.count - a.count)

    const total = result.reduce((acc, r) => acc + r.count, 0)

    return NextResponse.json(
      {
        data: result,
        meta: { total, states: result.length, generated_at: new Date().toISOString() },
      },
      {
        headers: {
          'Cache-Control': 'public, s-maxage=1800, stale-while-revalidate=86400',
          Vary: 'Accept-Encoding',
          'X-Content-Type-Options': 'nosniff',
          'X-API-Version': 'v2',
        },
      }
    )
  } catch (err) {
    log.error('unexpected error', { err: err instanceof Error ? err.message : String(err) })
    return NextResponse.json(
      { error: { code: 'INTERNAL_ERROR', message: 'Internal server error' } },
      { status: 500 }
    )
  }
}
