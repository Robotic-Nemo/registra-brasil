import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildWeeklyStatusSeries, utcMondayOfMs, todayUtcMs } from '@/lib/stats/weekly-buckets'

export const runtime = 'nodejs'
export const revalidate = 1800

/**
 * GET /api/estatisticas/por-semana.json — weekly (ISO Monday, UTC)
 * bucket counts for all non-removed statements. Status-split,
 * gap-filled. Completes the global timeseries matrix alongside
 * por-dia and por-mes.
 *   ?semanas=4..104 (default 26)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'estat-por-semana'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const semanas = Math.max(4, Math.min(104, Number(request.nextUrl.searchParams.get('semanas')) || 26))

  const thisMonday = utcMondayOfMs(todayUtcMs())
  const startMs = thisMonday - (semanas - 1) * 7 * 86400_000
  const startStr = new Date(startMs).toISOString().slice(0, 10)

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, verification_status')
    .neq('verification_status', 'removed')
    .gte('statement_date', startStr)
    .limit(50000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statement_date: string; verification_status: string }
  const { series, total } = buildWeeklyStatusSeries(semanas, (data ?? []) as Row[])

  const etag = `W/"estat-por-semana-${semanas}-${total}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    semanas, total, series,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
