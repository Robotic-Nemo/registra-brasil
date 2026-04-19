import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import {
  bucketByMonthUtc, parseSparklineParams, renderSparklineSvg,
  SPARKLINE_HEADERS, sparklineEtag,
} from '@/lib/export/sparkline-svg'

export const runtime = 'nodejs'
export const revalidate = 3600

const SLUG_RE = /^[a-z0-9%A-Z.-]{1,100}$/

/**
 * GET /api/partidos/:slug/sparkline.svg — inline SVG of monthly
 * statement counts for all active politicians of a party.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const { slug } = await params
  if (!SLUG_RE.test(slug)) return new Response('invalid slug', { status: 400 })

  const party = decodeURIComponent(slug).toUpperCase()
  const { months, W, H, color } = parseSparklineParams(request.nextUrl.searchParams, { color: '#0369a1' })
  const supabase = getSupabaseServiceClient()

  const now = new Date()
  const startIso = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (months - 1), 1))
    .toISOString().slice(0, 10)

  const { data: rows } = await (supabase.from('statements') as any)
    .select('statement_date, politicians!inner(party)')
    .eq('politicians.party', party)
    .neq('verification_status', 'removed')
    .gte('statement_date', startIso)
    .limit(15000)

  const buckets = bucketByMonthUtc(
    months,
    ((rows ?? []) as Array<{ statement_date: string }>).map((r) => r.statement_date),
  )
  const etag = sparklineEtag(`spk-pt-${party}-${W}x${H}`, buckets)
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  const svg = renderSparklineSvg({
    buckets, width: W, height: H, color,
    ariaLabel: `Sparkline de declarações: partido ${party}, últimos ${months} meses`,
  })
  return new Response(svg, { headers: { ...SPARKLINE_HEADERS, ETag: etag } })
}
