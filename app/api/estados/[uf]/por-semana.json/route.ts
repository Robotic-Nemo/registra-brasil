import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildWeeklyStatusSeries } from '@/lib/stats/weekly-buckets'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const UF_RE = /^[A-Z]{2}$/

/**
 * GET /api/estados/:uf/por-semana.json — weekly (ISO, UTC-Monday)
 * statement bucket counts for one UF. Split by verification status,
 * gap-filled.
 *   ?semanas=4..104 (default 26)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ uf: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'estado-por-semana'), {
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
  const semanas = Math.max(4, Math.min(104, Number(request.nextUrl.searchParams.get('semanas')) || 26))

  const supabase = getSupabaseServiceClient()
  const today = new Date()
  const startMs = Date.UTC(today.getUTCFullYear(), today.getUTCMonth(), today.getUTCDate()) - semanas * 7 * 86400_000
  const startStr = new Date(startMs).toISOString().slice(0, 10)

  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, verification_status, politicians!inner(state)')
    .eq('politicians.state', uf)
    .neq('verification_status', 'removed')
    .gte('statement_date', startStr)
    .limit(30000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statement_date: string; verification_status: string }
  const rows = (data ?? []) as Row[]
  const { series, total } = buildWeeklyStatusSeries(semanas, rows)

  const etag = `W/"estado-por-semana-${uf}-${semanas}-${total}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    uf,
    url: `${SITE_URL}/estados/${uf}`,
    semanas,
    total,
    series,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
