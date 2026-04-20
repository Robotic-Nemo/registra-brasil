import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildSeverityWeeklyMatrix, weeklyStartStr } from '@/lib/stats/severity-weekly-matrix'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const UF_RE = /^[A-Z]{2}$/

/**
 * GET /api/estados/:uf/severidade-por-semana.json — ISO week × severity
 * level matrix scoped to one UF.
 *   ?semanas=4..52 (default 12)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ uf: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'estado-sev-sem'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { uf: rawUf } = await params
  const uf = rawUf.toUpperCase()
  if (!UF_RE.test(uf)) {
    return NextResponse.json({ error: 'UF inválida' }, { status: 400 })
  }
  const semanas = Math.max(4, Math.min(52, Number(request.nextUrl.searchParams.get('semanas')) || 12))

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, severity_score, politicians!inner(state)')
    .eq('politicians.state', uf)
    .neq('verification_status', 'removed')
    .gte('statement_date', weeklyStartStr(semanas))
    .limit(30000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statement_date: string; severity_score: number | null }
  const { series, total } = buildSeverityWeeklyMatrix(semanas, (data ?? []) as Row[])

  const etag = `W/"estado-sev-sem-${uf}-${semanas}-${total}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    uf,
    url: `${SITE_URL}/estados/${uf}`,
    semanas, total, series,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
