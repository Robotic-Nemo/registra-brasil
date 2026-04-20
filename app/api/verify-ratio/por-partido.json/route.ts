import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

/**
 * GET /api/verify-ratio/por-partido.json — party-level verify
 * ratios (verified / disputed / unverified) over the window, so
 * dashboards can compare editorial coverage across parties.
 *
 *   ?meses=1..24 (default 6)
 *   ?limite=1..50 (default 30)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'vr-partido'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const sp = request.nextUrl.searchParams
  const monthsRaw = Number(sp.get('meses'))
  const months = Number.isFinite(monthsRaw) && monthsRaw >= 1 && monthsRaw <= 24
    ? Math.floor(monthsRaw) : 6
  const lim = Math.max(1, Math.min(50, Number(sp.get('limite')) || 30))

  const now = new Date()
  const start = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (months - 1), 1))
  const startIso = start.toISOString().slice(0, 10)

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('verification_status, politicians!inner(party, is_active)')
    .neq('verification_status', 'removed')
    .gte('statement_date', startIso)
    .eq('politicians.is_active', true)
    .limit(50000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = {
    verification_status: string
    politicians: { party: string | null; is_active: boolean }
  }
  const rows = (data ?? []) as Row[]

  type Bucket = { party: string; verified: number; disputed: number; unverified: number; total: number }
  const buckets = new Map<string, Bucket>()
  for (const r of rows) {
    const p = r.politicians?.party
    if (!p) continue
    const b = buckets.get(p) ?? { party: p, verified: 0, disputed: 0, unverified: 0, total: 0 }
    b.total++
    if (r.verification_status === 'verified') b.verified++
    else if (r.verification_status === 'disputed') b.disputed++
    else if (r.verification_status === 'unverified') b.unverified++
    buckets.set(p, b)
  }

  const results = Array.from(buckets.values())
    .map((b) => ({
      party: b.party,
      verified: b.verified,
      disputed: b.disputed,
      unverified: b.unverified,
      total: b.total,
      verified_ratio: b.total > 0 ? Number((b.verified / b.total).toFixed(4)) : null,
    }))
    .sort((a, b) => b.total - a.total)
    .slice(0, lim)

  const etag = `W/"vr-party-${months}-${lim}-${rows.length}-${results.length}"`
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
