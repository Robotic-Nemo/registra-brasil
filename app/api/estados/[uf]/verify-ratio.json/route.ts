import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildVerifyRatio, verifyRatioStartStr, type VerifyRatioInput } from '@/lib/stats/verify-ratio'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const UF_RE = /^[A-Za-z]{2}$/

/**
 * GET /api/estados/:uf/verify-ratio.json — verify-ratio trend scoped
 * to a single UF (joined via `politicians.state`).
 *   ?meses=3..24 (default 12)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ uf: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'estado-verify-ratio'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { uf: ufRaw } = await params
  if (!UF_RE.test(ufRaw)) {
    return NextResponse.json({ error: 'UF inválida' }, { status: 400 })
  }
  const uf = ufRaw.toUpperCase()
  const meses = Math.max(3, Math.min(24, Number(request.nextUrl.searchParams.get('meses')) || 12))

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, verification_status, politicians!inner(state)')
    .eq('politicians.state', uf)
    .neq('verification_status', 'removed')
    .gte('statement_date', verifyRatioStartStr(meses))
    .limit(20000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  const { trend, summary } = buildVerifyRatio(meses, (data ?? []) as VerifyRatioInput[])

  const etag = `W/"estado-verify-ratio-${uf}-${meses}-${summary.verified}-${summary.disputed}-${summary.unverified}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    uf,
    url: `${SITE_URL}/estados/${uf}`,
    meses,
    summary,
    trend,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
