import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

/**
 * GET /api/verify-ratio.json — monthly timeseries of statements by
 * verification status over the last N months (default 12, max 36).
 * Each bucket reports verified / disputed / unverified counts and a
 * normalized verified_ratio so dashboards can chart editorial
 * throughput without re-aggregating the dump.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'verify-ratio'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const monthsRaw = Number(request.nextUrl.searchParams.get('meses'))
  const months = Number.isFinite(monthsRaw) && monthsRaw >= 1 && monthsRaw <= 36
    ? Math.floor(monthsRaw) : 12

  // Build bucket keys in UTC so month boundaries don't drift on BRT.
  const now = new Date()
  const start = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (months - 1), 1))
  const startIso = start.toISOString().slice(0, 10)

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, verification_status')
    .neq('verification_status', 'removed')
    .gte('statement_date', startIso)
    .limit(50000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statement_date: string; verification_status: string }
  const rows = (data ?? []) as Row[]

  type Bucket = { ym: string; verified: number; disputed: number; unverified: number; total: number }
  const buckets = new Map<string, Bucket>()
  for (let i = 0; i < months; i++) {
    const d = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (months - 1 - i), 1))
    const ym = `${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}`
    buckets.set(ym, { ym, verified: 0, disputed: 0, unverified: 0, total: 0 })
  }
  for (const r of rows) {
    const ym = r.statement_date.slice(0, 7)
    const b = buckets.get(ym)
    if (!b) continue
    b.total++
    if (r.verification_status === 'verified') b.verified++
    else if (r.verification_status === 'disputed') b.disputed++
    else if (r.verification_status === 'unverified') b.unverified++
  }

  const series = Array.from(buckets.values()).map((b) => ({
    month: b.ym,
    verified: b.verified,
    disputed: b.disputed,
    unverified: b.unverified,
    total: b.total,
    verified_ratio: b.total > 0 ? Number((b.verified / b.total).toFixed(4)) : null,
  }))

  const etag = `W/"vr-${months}-${rows.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    months,
    samples: rows.length,
    series,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
      ETag: etag,
    },
  })
}
