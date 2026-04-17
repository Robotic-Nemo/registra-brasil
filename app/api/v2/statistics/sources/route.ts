import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { createLogger } from '@/lib/utils/logger'

export const runtime = 'edge'

const log = createLogger('api/v2/statistics/sources')

/**
 * GET /api/v2/statistics/sources — Counts verified statements grouped by
 * primary source type (youtube_video, news_article, etc).
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'api-v2-stats-sources'), {
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
      .from('statements')
      .select('primary_source_type')
      .eq('verification_status', 'verified')
      .limit(20_000)

    if (error) {
      log.error('query failed', { err: error.message })
      return NextResponse.json(
        { error: { code: 'INTERNAL_ERROR', message: 'Failed to compute stats' } },
        { status: 500 }
      )
    }

    const rows = (data ?? []) as { primary_source_type: string | null }[]
    const byType = new Map<string, number>()
    for (const r of rows) {
      const key = r.primary_source_type ?? 'unknown'
      byType.set(key, (byType.get(key) ?? 0) + 1)
    }

    const result = Array.from(byType.entries())
      .map(([source_type, count]) => ({ source_type, count }))
      .sort((a, b) => b.count - a.count)

    const total = result.reduce((acc, r) => acc + r.count, 0)

    return NextResponse.json(
      {
        data: result,
        meta: { total, types: result.length, generated_at: new Date().toISOString() },
      },
      {
        headers: {
          'Cache-Control': 'public, s-maxage=1800, stale-while-revalidate=600',
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
