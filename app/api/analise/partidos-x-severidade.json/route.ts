import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildScopeSeverityMatrix } from '@/lib/stats/scope-severity-matrix'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/analise/partidos-x-severidade.json — dense matrix of
 * top-N parties (by statement volume) × severity level (1..5).
 * Includes avg severity per party. Window defaults to 24 months.
 *   ?partidos=5..30 (default 15)
 *   ?meses=6..60 (default 24)
 *   ?normalizar=1 for per-party pct of levels
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'analise-ps-json'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const partyLimit = Math.max(5, Math.min(30, Number(request.nextUrl.searchParams.get('partidos')) || 15))
  const meses = Math.max(6, Math.min(60, Number(request.nextUrl.searchParams.get('meses')) || 24))
  const normalize = request.nextUrl.searchParams.get('normalizar') === '1'

  const now = new Date()
  const startMs = Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (meses - 1), 1)
  const startStr = new Date(startMs).toISOString().slice(0, 10)

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('severity_score, politicians!inner(party)')
    .neq('verification_status', 'removed')
    .gte('statement_date', startStr)
    .limit(60000)
  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { severity_score: number | null; politicians: { party: string | null } | null }
  const { rows, total, max } = buildScopeSeverityMatrix(
    (data ?? []) as Row[],
    (r) => r.politicians?.party ?? null,
    (r) => r.severity_score,
    partyLimit,
  )

  const shaped = rows.map((r) => {
    const levels = r.levels
    const pct = normalize && r.total > 0
      ? {
          1: +(levels[1] / r.total * 100).toFixed(1),
          2: +(levels[2] / r.total * 100).toFixed(1),
          3: +(levels[3] / r.total * 100).toFixed(1),
          4: +(levels[4] / r.total * 100).toFixed(1),
          5: +(levels[5] / r.total * 100).toFixed(1),
        }
      : null
    return {
      party: r.key,
      total: r.total,
      levels,
      pct,
      avg_severity: r.avg_severity,
      url: `${SITE_URL}/partidos/${encodeURIComponent(r.key)}`,
    }
  })

  const etag = `W/"ps-${partyLimit}-${meses}-${total}-${normalize ? 1 : 0}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    partidos: partyLimit, meses, normalize, total, max, rows: shaped,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
