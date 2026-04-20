import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

/**
 * GET /api/verify-ratio/por-estado.json — UF-level verify ratios
 * (verified / disputed / unverified) over the window. Sibling of
 * /api/verify-ratio/por-partido.json.
 *
 *   ?meses=1..24 (default 6)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'vr-estado'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const monthsRaw = Number(request.nextUrl.searchParams.get('meses'))
  const months = Number.isFinite(monthsRaw) && monthsRaw >= 1 && monthsRaw <= 24
    ? Math.floor(monthsRaw) : 6

  const now = new Date()
  const start = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (months - 1), 1))
  const startIso = start.toISOString().slice(0, 10)

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('verification_status, politicians!inner(state)')
    .neq('verification_status', 'removed')
    .gte('statement_date', startIso)
    .limit(50000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = {
    verification_status: string
    politicians: { state: string | null }
  }
  const rows = (data ?? []) as Row[]

  type Bucket = { state: string; verified: number; disputed: number; unverified: number; total: number }
  const buckets = new Map<string, Bucket>()
  for (const r of rows) {
    const uf = r.politicians?.state
    if (!uf) continue
    const b = buckets.get(uf) ?? { state: uf, verified: 0, disputed: 0, unverified: 0, total: 0 }
    b.total++
    if (r.verification_status === 'verified') b.verified++
    else if (r.verification_status === 'disputed') b.disputed++
    else if (r.verification_status === 'unverified') b.unverified++
    buckets.set(uf, b)
  }

  const results = Array.from(buckets.values())
    .map((b) => ({
      state: b.state,
      verified: b.verified,
      disputed: b.disputed,
      unverified: b.unverified,
      total: b.total,
      verified_ratio: b.total > 0 ? Number((b.verified / b.total).toFixed(4)) : null,
    }))
    .sort((a, b) => b.total - a.total)

  const etag = `W/"vr-uf-${months}-${rows.length}-${results.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    months,
    samples: rows.length,
    count: results.length,
    results,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
      ETag: etag,
    },
  })
}
