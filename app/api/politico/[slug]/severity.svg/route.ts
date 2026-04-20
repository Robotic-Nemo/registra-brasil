import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import {
  HISTOGRAM_HEADERS, histogramEtag, renderHistogramSvg, SEVERITY_COLORS,
} from '@/lib/export/histogram-svg'

export const runtime = 'nodejs'
export const revalidate = 3600

const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/politico/:slug/severity.svg — tiny 5-bucket severity
 * histogram for a politician. Usable in any <img>. Config:
 *   ?w=60..480   width (default 160)
 *   ?h=20..120   height (default 40)
 *   ?labels=0|1  show 1..5 axis labels (default 1)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const { slug } = await params
  if (!SLUG_RE.test(slug)) return new Response('invalid slug', { status: 400 })

  const q = request.nextUrl.searchParams
  const W = Math.max(60, Math.min(480, Number(q.get('w')) || 160))
  const H = Math.max(20, Math.min(120, Number(q.get('h')) || 40))
  const showLabels = q.get('labels') !== '0'

  const supabase = getSupabaseServiceClient()
  const { data: p } = await (supabase.from('politicians') as any)
    .select('id, common_name')
    .eq('slug', slug)
    .maybeSingle()

  const emptyBuckets = [1, 2, 3, 4, 5].map((sv) => ({
    label: String(sv), count: 0, color: SEVERITY_COLORS[sv],
  }))
  if (!p) {
    return new Response(renderHistogramSvg({
      buckets: emptyBuckets, width: W, height: H, ariaLabel: 'sem dados', showLabels,
    }), { headers: HISTOGRAM_HEADERS })
  }

  const { data: rows } = await (supabase.from('statements') as any)
    .select('severity_score')
    .eq('politician_id', p.id)
    .neq('verification_status', 'removed')
    .limit(20000)

  const counts: Record<number, number> = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0 }
  for (const r of ((rows ?? []) as Array<{ severity_score: number | null }>)) {
    const sv = r.severity_score ?? 0
    if (sv >= 1 && sv <= 5) counts[sv]++
  }
  const buckets = [1, 2, 3, 4, 5].map((sv) => ({
    label: String(sv),
    count: counts[sv],
    color: SEVERITY_COLORS[sv],
  }))

  const etag = histogramEtag(`sev-${slug}-${W}x${H}-${showLabels ? 'L' : 'N'}`, buckets)
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  const svg = renderHistogramSvg({
    buckets, width: W, height: H, showLabels,
    ariaLabel: `Histograma de severidade: ${p.common_name}`,
  })
  return new Response(svg, { headers: { ...HISTOGRAM_HEADERS, ETag: etag } })
}
