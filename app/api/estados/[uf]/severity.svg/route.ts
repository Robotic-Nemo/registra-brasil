import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import {
  HISTOGRAM_HEADERS, histogramEtag, renderHistogramSvg, SEVERITY_COLORS,
} from '@/lib/export/histogram-svg'

export const runtime = 'nodejs'
export const revalidate = 3600

const UF_RE = /^[a-zA-Z]{2}$/

/**
 * GET /api/estados/:uf/severity.svg — 5-bucket severity histogram
 * for a Brazilian state.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ uf: string }> },
) {
  const { uf: rawUf } = await params
  if (!UF_RE.test(rawUf)) return new Response('invalid uf', { status: 400 })
  const uf = rawUf.toUpperCase()

  const q = request.nextUrl.searchParams
  const W = Math.max(60, Math.min(480, Number(q.get('w')) || 160))
  const H = Math.max(20, Math.min(120, Number(q.get('h')) || 40))
  const showLabels = q.get('labels') !== '0'

  const supabase = getSupabaseServiceClient()
  const { data: rows } = await (supabase.from('statements') as any)
    .select('severity_score, politicians!inner(state)')
    .eq('politicians.state', uf)
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

  const etag = histogramEtag(`sev-uf-${uf}-${W}x${H}-${showLabels ? 'L' : 'N'}`, buckets)
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  const svg = renderHistogramSvg({
    buckets, width: W, height: H, showLabels,
    ariaLabel: `Histograma de severidade: UF ${uf}`,
  })
  return new Response(svg, { headers: { ...HISTOGRAM_HEADERS, ETag: etag } })
}
