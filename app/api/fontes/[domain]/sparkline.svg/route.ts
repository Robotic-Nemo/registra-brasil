import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import {
  bucketByMonthUtc, parseSparklineParams, renderSparklineSvg,
  SPARKLINE_HEADERS, sparklineEtag,
} from '@/lib/export/sparkline-svg'
import { sourceUrlOrFilter, DOMAIN_RE_STRICT } from '@/lib/sources/domain-filter'

export const runtime = 'nodejs'
export const revalidate = 3600

const DOMAIN_RE = /^[a-z0-9%.-]{3,253}$/i

/**
 * GET /api/fontes/:domain/sparkline.svg — inline SVG of monthly
 * citation counts for a source domain. Matches the partido/estado/
 * categoria sparkline shape so frontends can swap scopes freely.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ domain: string }> },
) {
  const { domain: raw } = await params
  if (!DOMAIN_RE.test(raw)) return new Response('invalid domain', { status: 400 })
  const domain = decodeURIComponent(raw).toLowerCase().replace(/^www\./, '')
  if (!DOMAIN_RE_STRICT.test(domain)) return new Response('invalid domain', { status: 400 })

  const { months, W, H, color } = parseSparklineParams(request.nextUrl.searchParams, { color: '#0369a1' })
  const supabase = getSupabaseServiceClient()

  const now = new Date()
  const startIso = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (months - 1), 1))
    .toISOString().slice(0, 10)

  const { data: rows } = await (supabase.from('statements') as any)
    .select('statement_date')
    .neq('verification_status', 'removed')
    .gte('statement_date', startIso)
    .or(sourceUrlOrFilter(domain))
    .limit(15000)

  const buckets = bucketByMonthUtc(
    months,
    ((rows ?? []) as Array<{ statement_date: string }>).map((r) => r.statement_date),
  )
  const etag = sparklineEtag(`spk-fn-${domain}-${W}x${H}`, buckets)
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  const svg = renderSparklineSvg({
    buckets, width: W, height: H, color,
    ariaLabel: `Sparkline de citações: ${domain}, últimos ${months} meses`,
  })
  return new Response(svg, { headers: { ...SPARKLINE_HEADERS, ETag: etag } })
}
