import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import {
  HISTOGRAM_HEADERS, histogramEtag, renderHistogramSvg, SEVERITY_COLORS,
} from '@/lib/export/histogram-svg'

export const runtime = 'nodejs'
export const revalidate = 3600

const SLUG_RE = /^[a-z0-9%A-Z.-]{1,100}$/

/**
 * GET /api/partidos/:slug/severity.svg — 5-bucket severity
 * histogram for a party (all non-removed statements by active
 * politicians).
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const { slug } = await params
  if (!SLUG_RE.test(slug)) return new Response('invalid slug', { status: 400 })
  const party = decodeURIComponent(slug).toUpperCase()

  const q = request.nextUrl.searchParams
  const W = Math.max(60, Math.min(480, Number(q.get('w')) || 160))
  const H = Math.max(20, Math.min(120, Number(q.get('h')) || 40))
  const showLabels = q.get('labels') !== '0'

  const supabase = getSupabaseServiceClient()
  const { data: rows } = await (supabase.from('statements') as any)
    .select('severity_score, politicians!inner(party)')
    .eq('politicians.party', party)
    .neq('verification_status', 'removed')
    .limit(20000)

  const counts: Record<number, number> = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0 }
  for (const r of ((rows ?? []) as Array<{ severity_score: number | null }>)) {
    const sv = r.severity_score ?? 0
    if (sv >= 1 && sv <= 5) counts[sv]++
  }
  const buckets = [1, 2, 3, 4, 5].map((sv) => ({
    label: String(sv), count: counts[sv], color: SEVERITY_COLORS[sv],
  }))

  const etag = histogramEtag(`sev-pt-${party}-${W}x${H}-${showLabels ? 'L' : 'N'}`, buckets)
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  const svg = renderHistogramSvg({
    buckets, width: W, height: H, showLabels,
    ariaLabel: `Histograma de severidade: partido ${party}`,
  })
  return new Response(svg, { headers: { ...HISTOGRAM_HEADERS, ETag: etag } })
}
