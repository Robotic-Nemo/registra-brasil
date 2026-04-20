import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

/**
 * GET /api/estatisticas/por-dia.json — daily timeseries of all
 * non-removed statements, bucketed by `statement_date` (already
 * UTC YYYY-MM-DD). Gap-fills missing days. Suitable for 30/90/180
 * -day dashboard heatmaps / line charts.
 *
 *   ?dias=7..365 (default 90)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'estat-por-dia'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const dias = Math.max(7, Math.min(365, Number(request.nextUrl.searchParams.get('dias')) || 90))

  // Anchor at UTC midnight `dias-1` days ago so the series always
  // contains exactly `dias` day buckets ending at today (UTC).
  const now = new Date()
  const todayUtc = Date.UTC(now.getUTCFullYear(), now.getUTCMonth(), now.getUTCDate())
  const start = new Date(todayUtc - (dias - 1) * 86400_000)
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
    const k = r.statement_date.slice(0, 10)
    let b = buckets.get(k)
    if (!b) { b = { verified: 0, disputed: 0, unverified: 0, total: 0 }; buckets.set(k, b) }
    b.total += 1
    if (r.verification_status === 'verified') b.verified += 1
    else if (r.verification_status === 'disputed') b.disputed += 1
    else if (r.verification_status === 'unverified') b.unverified += 1
  }

  const series: Array<{ date: string; total: number; verified: number; disputed: number; unverified: number }> = []
  for (let i = 0; i < dias; i++) {
    const ts = todayUtc - (dias - 1 - i) * 86400_000
    const d = new Date(ts)
    const key = `${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}-${String(d.getUTCDate()).padStart(2, '0')}`
    const b = buckets.get(key) ?? { verified: 0, disputed: 0, unverified: 0, total: 0 }
    series.push({ date: key, ...b })
  }

  const total = series.reduce((s, x) => s + x.total, 0)
  const etag = `W/"estat-por-dia-${dias}-${total}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    dias, total, series,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
