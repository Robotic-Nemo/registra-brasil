import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildSeverityWeeklyMatrix, weeklyStartStr } from '@/lib/stats/severity-weekly-matrix'

export const runtime = 'nodejs'
export const revalidate = 1800

/**
 * GET /api/estatisticas/severidade-por-semana.json — week × severity
 * level (1..5) matrix (ISO Monday, UTC) for the last N weeks. Gap-
 * filled. Completes the severity-matrix resolution set
 * {por-dia, por-semana, por-mes}.
 *   ?semanas=4..52 (default 12)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'estat-sev-por-semana'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const semanas = Math.max(4, Math.min(52, Number(request.nextUrl.searchParams.get('semanas')) || 12))

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, severity_score')
    .neq('verification_status', 'removed')
    .gte('statement_date', weeklyStartStr(semanas))
    .limit(50000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statement_date: string; severity_score: number | null }
  const { series, total } = buildSeverityWeeklyMatrix(semanas, (data ?? []) as Row[])

  const etag = `W/"estat-sev-sem-${semanas}-${total}"`
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
