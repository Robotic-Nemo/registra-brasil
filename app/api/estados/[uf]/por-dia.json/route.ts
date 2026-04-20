import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildDailyStatusSeries } from '@/lib/stats/daily-buckets'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const UF_RE = /^[A-Z]{2}$/

/**
 * GET /api/estados/:uf/por-dia.json — daily (UTC) bucket counts for
 * one UF. Status-split, gap-filled.
 *   ?dias=7..180 (default 60)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ uf: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'estado-por-dia'), {
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
  const dias = Math.max(7, Math.min(180, Number(request.nextUrl.searchParams.get('dias')) || 60))

  const today = new Date()
  const startMs = Date.UTC(today.getUTCFullYear(), today.getUTCMonth(), today.getUTCDate()) - (dias - 1) * 86400_000
  const startStr = new Date(startMs).toISOString().slice(0, 10)

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, verification_status, politicians!inner(state)')
    .eq('politicians.state', uf)
    .neq('verification_status', 'removed')
    .gte('statement_date', startStr)
    .limit(20000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statement_date: string; verification_status: string }
  const { series, total } = buildDailyStatusSeries(dias, (data ?? []) as Row[])

  const etag = `W/"estado-por-dia-${uf}-${dias}-${total}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    uf,
    url: `${SITE_URL}/estados/${uf}`,
    dias, total, series,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
