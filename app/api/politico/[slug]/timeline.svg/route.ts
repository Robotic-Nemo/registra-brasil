import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import {
  HISTOGRAM_HEADERS, histogramEtag, renderHistogramSvg,
} from '@/lib/export/histogram-svg'
import { bucketByMonthUtc } from '@/lib/export/sparkline-svg'

export const runtime = 'nodejs'
export const revalidate = 3600

const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/politico/:slug/timeline.svg — bar-chart variant of the
 * sparkline (monthly counts as discrete bars). Better for print /
 * screenshot scenarios where the line chart reads poorly.
 *   ?meses=3..24    number of buckets (default 12)
 *   ?w=60..480      width px (default 240)
 *   ?h=20..120      height px (default 48)
 *   ?cor=#hex       fill color (default #d97706)
 *   ?labels=0|1     show year labels (default 0 for compactness)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const { slug } = await params
  if (!SLUG_RE.test(slug)) return new Response('invalid slug', { status: 400 })
  const q = request.nextUrl.searchParams
  const months = Math.max(3, Math.min(24, Number(q.get('meses')) || 12))
  const W = Math.max(60, Math.min(480, Number(q.get('w')) || 240))
  const H = Math.max(20, Math.min(120, Number(q.get('h')) || 48))
  const rawColor = q.get('cor') ?? '#d97706'
  const color = /^#[0-9a-fA-F]{3,8}$/.test(rawColor) ? rawColor : '#d97706'
  const showLabels = q.get('labels') === '1'

  const supabase = getSupabaseServiceClient()
  const { data: p } = await (supabase.from('politicians') as any)
    .select('id, common_name')
    .eq('slug', slug)
    .maybeSingle()

  if (!p) {
    return new Response(renderHistogramSvg({
      buckets: [], width: W, height: H, ariaLabel: 'sem dados', showLabels, defaultColor: color,
    }), { headers: HISTOGRAM_HEADERS })
  }

  const now = new Date()
  const startIso = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (months - 1), 1))
    .toISOString().slice(0, 10)

  const { data: rows } = await (supabase.from('statements') as any)
    .select('statement_date')
    .eq('politician_id', p.id)
    .neq('verification_status', 'removed')
    .gte('statement_date', startIso)
    .limit(5000)

  const mb = bucketByMonthUtc(
    months,
    ((rows ?? []) as Array<{ statement_date: string }>).map((r) => r.statement_date),
  )
  // Only show year labels at year-boundary months to avoid clutter.
  const buckets = mb.map((b) => {
    const shortLabel = showLabels && b.label.endsWith('-01')
      ? b.label.slice(2, 4)
      : ''
    return { label: shortLabel, count: b.count, color }
  })

  const etag = histogramEtag(`tml-${slug}-${W}x${H}-${months}-${showLabels ? 'L' : 'N'}`, buckets)
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  const svg = renderHistogramSvg({
    buckets, width: W, height: H, showLabels,
    ariaLabel: `Timeline mensal: ${p.common_name}, últimos ${months} meses`,
    defaultColor: color,
  })
  return new Response(svg, { headers: { ...HISTOGRAM_HEADERS, ETag: etag } })
}
