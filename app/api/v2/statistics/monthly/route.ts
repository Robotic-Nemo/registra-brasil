import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { createLogger } from '@/lib/utils/logger'

export const runtime = 'edge'

const log = createLogger('api/v2/statistics/monthly')
const DEFAULT_MONTHS = 12
const MAX_MONTHS = 60

/**
 * GET /api/v2/statistics/monthly?months=12 — Counts verified statements per
 * year-month, descending. Useful for time-series charts.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'api-v2-stats-monthly'), {
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

  const monthsParam = Number(request.nextUrl.searchParams.get('months'))
  const months = Number.isFinite(monthsParam) && monthsParam > 0
    ? Math.min(Math.floor(monthsParam), MAX_MONTHS)
    : DEFAULT_MONTHS

  const supabase = getSupabaseServiceClient()

  // Cut-off date: first day of month N-1 months ago.
  const now = new Date()
  const cutoff = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - months + 1, 1))
  const cutoffStr = cutoff.toISOString().slice(0, 10)

  try {
    const { data, error } = await supabase
      .from('statements')
      .select('statement_date')
      .eq('verification_status', 'verified')
      .gte('statement_date', cutoffStr)
      .limit(20_000)

    if (error) {
      log.error('query failed', { err: error.message })
      return NextResponse.json(
        { error: { code: 'INTERNAL_ERROR', message: 'Failed to compute stats' } },
        { status: 500 }
      )
    }

    const rows = (data ?? []) as { statement_date: string }[]
    const byMonth = new Map<string, number>()
    for (const r of rows) {
      const key = r.statement_date?.slice(0, 7)
      if (!key) continue
      byMonth.set(key, (byMonth.get(key) ?? 0) + 1)
    }

    const result = Array.from(byMonth.entries())
      .map(([month, count]) => ({ month, count }))
      .sort((a, b) => a.month.localeCompare(b.month))

    const total = result.reduce((acc, r) => acc + r.count, 0)

    return NextResponse.json(
      {
        data: result,
        meta: {
          months,
          total,
          since: cutoffStr,
          generated_at: new Date().toISOString(),
        },
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
