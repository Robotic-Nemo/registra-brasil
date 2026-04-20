import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { createLogger } from '@/lib/utils/logger'

export const runtime = 'edge'

const log = createLogger('api/v2/statistics/by-party')

/**
 * GET /api/v2/statistics/by-party — Counts verified statements grouped by
 * politician party.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'api-v2-stats-party'), {
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
    const { data, error } = await supabase
      .from('politicians')
      .select('party, statements!inner(count)')
      .eq('is_active', true)
      .eq('statements.verification_status', 'verified')
      .limit(2000)

    if (error) {
      log.error('query failed', { err: error.message })
      return NextResponse.json(
        { error: { code: 'INTERNAL_ERROR', message: 'Failed to compute stats' } },
        { status: 500 }
      )
    }

    const rows = (data ?? []) as unknown as { party: string; statements: { count: number }[] }[]
    const byParty = new Map<string, number>()
    for (const row of rows) {
      const count = row.statements[0]?.count ?? 0
      byParty.set(row.party, (byParty.get(row.party) ?? 0) + count)
    }

    const result = Array.from(byParty.entries())
      .map(([party, count]) => ({ party, count }))
      .sort((a, b) => b.count - a.count)

    const total = result.reduce((acc, r) => acc + r.count, 0)

    return NextResponse.json(
      {
        data: result,
        meta: { total, parties: result.length, generated_at: new Date().toISOString() },
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
