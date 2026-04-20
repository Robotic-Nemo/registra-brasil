import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import {
  HISTOGRAM_HEADERS, histogramEtag, renderHistogramSvg, SEVERITY_COLORS,
} from '@/lib/export/histogram-svg'
import { sourceUrlOrFilter, DOMAIN_RE_STRICT } from '@/lib/sources/domain-filter'

export const runtime = 'nodejs'
export const revalidate = 3600

const DOMAIN_RE = /^[a-z0-9%.-]{3,253}$/i

/**
 * GET /api/fontes/:domain/severity.svg — 5-bucket severity histogram
 * for statements citing this source domain.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ domain: string }> },
) {
  const { domain: raw } = await params
  if (!DOMAIN_RE.test(raw)) return new Response('invalid domain', { status: 400 })
  const domain = decodeURIComponent(raw).toLowerCase().replace(/^www\./, '')
  if (!DOMAIN_RE_STRICT.test(domain)) return new Response('invalid domain', { status: 400 })

  const q = request.nextUrl.searchParams
  const W = Math.max(60, Math.min(480, Number(q.get('w')) || 160))
  const H = Math.max(20, Math.min(120, Number(q.get('h')) || 40))
  const showLabels = q.get('labels') !== '0'

  const supabase = getSupabaseServiceClient()
  const { data: rows } = await (supabase.from('statements') as any)
    .select('severity_score')
    .neq('verification_status', 'removed')
    .or(sourceUrlOrFilter(domain))
    .limit(20000)

  const counts: Record<number, number> = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0 }
  for (const r of ((rows ?? []) as Array<{ severity_score: number | null }>)) {
    const sv = r.severity_score ?? 0
    if (sv >= 1 && sv <= 5) counts[sv]++
  }
  const buckets = [1, 2, 3, 4, 5].map((sv) => ({
    label: String(sv), count: counts[sv], color: SEVERITY_COLORS[sv],
  }))

  const etag = histogramEtag(`sev-fn-${domain}-${W}x${H}-${showLabels ? 'L' : 'N'}`, buckets)
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  const svg = renderHistogramSvg({
    buckets, width: W, height: H, showLabels,
    ariaLabel: `Histograma de severidade: ${domain}`,
  })
  return new Response(svg, { headers: { ...HISTOGRAM_HEADERS, ETag: etag } })
}
