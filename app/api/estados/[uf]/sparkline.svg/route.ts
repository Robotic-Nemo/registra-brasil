import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import {
  bucketByMonthUtc, parseSparklineParams, renderSparklineSvg,
  SPARKLINE_HEADERS, sparklineEtag,
} from '@/lib/export/sparkline-svg'

export const runtime = 'nodejs'
export const revalidate = 3600

const UF_RE = /^[a-zA-Z]{2}$/

/**
 * GET /api/estados/:uf/sparkline.svg — inline SVG of monthly
 * statement counts for politicians of a Brazilian state.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ uf: string }> },
) {
  const { uf: rawUf } = await params
  if (!UF_RE.test(rawUf)) return new Response('invalid uf', { status: 400 })
  const uf = rawUf.toUpperCase()

  const { months, W, H, color } = parseSparklineParams(
    request.nextUrl.searchParams,
    { color: '#15803d' },
  )
  const supabase = getSupabaseServiceClient()

  const now = new Date()
  const startIso = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (months - 1), 1))
    .toISOString().slice(0, 10)

  const { data: rows } = await (supabase.from('statements') as any)
    .select('statement_date, politicians!inner(state)')
    .eq('politicians.state', uf)
    .neq('verification_status', 'removed')
    .gte('statement_date', startIso)
    .limit(15000)

  const buckets = bucketByMonthUtc(
    months,
    ((rows ?? []) as Array<{ statement_date: string }>).map((r) => r.statement_date),
  )
  const etag = sparklineEtag(`spk-uf-${uf}-${W}x${H}`, buckets)
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  const svg = renderSparklineSvg({
    buckets, width: W, height: H, color,
    ariaLabel: `Sparkline de declarações: UF ${uf}, últimos ${months} meses`,
  })
  return new Response(svg, { headers: { ...SPARKLINE_HEADERS, ETag: etag } })
}
