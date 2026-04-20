import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

/**
 * GET /api/estatisticas/por-mes.json — monthly timeseries of all
 * non-removed statements, bucketed by `statement_date` UTC month.
 * Gap-fills missing months so clients don't need to post-process.
 *
 *   ?meses=1..48 (default 24)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'estat-por-mes'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const meses = Math.max(1, Math.min(48, Number(request.nextUrl.searchParams.get('meses')) || 24))

  const now = new Date()
  const start = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (meses - 1), 1))
  const startStr = start.toISOString().slice(0, 10)

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, verification_status')
    .neq('verification_status', 'removed')
    .gte('statement_date', startStr)
    .limit(50000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statement_date: string; verification_status: string }
  const rows = (data ?? []) as Row[]

  const buckets = new Map<string, { verified: number; disputed: number; unverified: number; total: number }>()
  for (const r of rows) {
    const k = r.statement_date.slice(0, 7)
    let b = buckets.get(k)
    if (!b) { b = { verified: 0, disputed: 0, unverified: 0, total: 0 }; buckets.set(k, b) }
    b.total += 1
    if (r.verification_status === 'verified') b.verified += 1
    else if (r.verification_status === 'disputed') b.disputed += 1
    else if (r.verification_status === 'unverified') b.unverified += 1
  }

  const series: { month: string; total: number; verified: number; disputed: number; unverified: number }[] = []
  const cur = new Date(start)
  while (cur.getUTCFullYear() * 12 + cur.getUTCMonth() <= now.getUTCFullYear() * 12 + now.getUTCMonth()) {
    const key = `${cur.getUTCFullYear()}-${String(cur.getUTCMonth() + 1).padStart(2, '0')}`
    const b = buckets.get(key) ?? { verified: 0, disputed: 0, unverified: 0, total: 0 }
    series.push({ month: key, ...b })
    cur.setUTCMonth(cur.getUTCMonth() + 1)
  }

  const total = series.reduce((s, x) => s + x.total, 0)
  const etag = `W/"estat-por-mes-${meses}-${total}"`
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
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
