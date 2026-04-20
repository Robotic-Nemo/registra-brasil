import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import {
  HISTOGRAM_HEADERS, histogramEtag, renderHistogramSvg, SEVERITY_COLORS,
} from '@/lib/export/histogram-svg'

export const runtime = 'nodejs'
export const revalidate = 3600

const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/categorias/:slug/severity.svg — 5-bucket severity
 * histogram for a category (all non-removed statements).
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
  const { data: cat } = await (supabase.from('categories') as any)
    .select('id, label_pt')
    .eq('slug', slug)
    .maybeSingle()

  const emptyBuckets = [1, 2, 3, 4, 5].map((sv) => ({
    label: String(sv), count: 0, color: SEVERITY_COLORS[sv],
  }))
  if (!cat) {
    return new Response(renderHistogramSvg({
      buckets: emptyBuckets, width: W, height: H, ariaLabel: 'sem dados', showLabels,
    }), { headers: HISTOGRAM_HEADERS })
  }

  const { data: rows } = await (supabase.from('statement_categories') as any)
    .select('statements!inner(severity_score, verification_status)')
    .eq('category_id', cat.id)
    .limit(20000)

  const counts: Record<number, number> = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0 }
  for (const r of ((rows ?? []) as Array<{ statements: { severity_score: number | null; verification_status: string } | null }>)) {
    const s = r.statements
    if (!s || s.verification_status === 'removed') continue
    const sv = s.severity_score ?? 0
    if (sv >= 1 && sv <= 5) counts[sv]++
  }
  const buckets = [1, 2, 3, 4, 5].map((sv) => ({
    label: String(sv), count: counts[sv], color: SEVERITY_COLORS[sv],
  }))

  const etag = histogramEtag(`sev-c-${slug}-${W}x${H}-${showLabels ? 'L' : 'N'}`, buckets)
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  const svg = renderHistogramSvg({
    buckets, width: W, height: H, showLabels,
    ariaLabel: `Histograma de severidade: categoria ${cat.label_pt}`,
  })
  return new Response(svg, { headers: { ...HISTOGRAM_HEADERS, ETag: etag } })
}
