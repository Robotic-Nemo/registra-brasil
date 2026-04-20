import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

/**
 * GET /api/contradicoes/por-mes.json — monthly timeseries of published
 * contradiction pairs. Buckets by `created_at` month (UTC). Fills
 * missing months with 0 so clients can plot without gap-handling.
 *
 *   ?meses=1..36 (default 12)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'contra-por-mes'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const meses = Math.max(1, Math.min(36, Number(request.nextUrl.searchParams.get('meses')) || 12))

  // Anchor start at first-of-month N months ago (UTC).
  const now = new Date()
  const start = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (meses - 1), 1))
  const startIso = start.toISOString()

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('contradiction_pairs') as any)
    .select('created_at')
    .eq('is_published', true)
    .gte('created_at', startIso)
    .limit(20000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { created_at: string }
  const rows = (data ?? []) as Row[]

  const counts = new Map<string, number>()
  for (const r of rows) {
    const key = r.created_at.slice(0, 7) // YYYY-MM
    counts.set(key, (counts.get(key) ?? 0) + 1)
  }

  const series: { month: string; count: number }[] = []
  const cur = new Date(start)
  while (cur.getUTCFullYear() * 12 + cur.getUTCMonth() <= now.getUTCFullYear() * 12 + now.getUTCMonth()) {
    const key = `${cur.getUTCFullYear()}-${String(cur.getUTCMonth() + 1).padStart(2, '0')}`
    series.push({ month: key, count: counts.get(key) ?? 0 })
    cur.setUTCMonth(cur.getUTCMonth() + 1)
  }

  const total = series.reduce((s, x) => s + x.count, 0)
  const etag = `W/"contra-por-mes-${meses}-${total}-${rows.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    meses,
    total,
    series,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
