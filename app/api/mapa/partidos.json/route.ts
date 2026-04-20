import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildScopeSeverityMatrix } from '@/lib/stats/scope-severity-matrix'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/mapa/partidos.json — dense per-party stats sibling to
 * `/api/mapa/estados.json`. Drops the zero-fill (parties ≠ a fixed
 * set) but ships status split + severity levels + avg per party so
 * frontends can paint comparison charts in one round-trip.
 *   ?meses=3..60 (default 24)
 *   ?limite=5..200 (default 100)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'mapa-pt'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const meses = Math.max(3, Math.min(60, Number(request.nextUrl.searchParams.get('meses')) || 24))
  const limit = Math.max(5, Math.min(200, Number(request.nextUrl.searchParams.get('limite')) || 100))
  const now = new Date()
  const startMs = Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (meses - 1), 1)
  const startStr = new Date(startMs).toISOString().slice(0, 10)

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('severity_score, verification_status, politicians!inner(party)')
    .neq('verification_status', 'removed')
    .gte('statement_date', startStr)
    .limit(60000)
  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { severity_score: number | null; verification_status: string; politicians: { party: string | null } | null }
  const rows = (data ?? []) as Row[]

  const { rows: matrix } = buildScopeSeverityMatrix(
    rows,
    (r) => r.politicians?.party ?? null,
    (r) => r.severity_score,
    limit,
  )

  const statusByKey = new Map<string, { verified: number; disputed: number; unverified: number }>()
  for (const r of rows) {
    const k = r.politicians?.party
    if (!k) continue
    let s = statusByKey.get(k)
    if (!s) { s = { verified: 0, disputed: 0, unverified: 0 }; statusByKey.set(k, s) }
    if (r.verification_status === 'verified') s.verified++
    else if (r.verification_status === 'disputed') s.disputed++
    else if (r.verification_status === 'unverified') s.unverified++
  }

  const features = matrix.map((m) => {
    const s = statusByKey.get(m.key) ?? { verified: 0, disputed: 0, unverified: 0 }
    return {
      party: m.key,
      total: m.total,
      verified: s.verified,
      disputed: s.disputed,
      unverified: s.unverified,
      levels: m.levels,
      avg_severity: m.avg_severity,
      url: `${SITE_URL}/partidos/${encodeURIComponent(m.key)}`,
    }
  })

  const maxTotal = features.reduce((m, f) => Math.max(m, f.total), 0)
  const grandTotal = features.reduce((s, f) => s + f.total, 0)
  const etag = `W/"mapa-pt-${meses}-${limit}-${grandTotal}-${maxTotal}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    meses, count: features.length,
    total: grandTotal, max_total: maxTotal,
    features,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
