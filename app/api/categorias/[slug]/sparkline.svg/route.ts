import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import {
  bucketByMonthUtc, parseSparklineParams, renderSparklineSvg,
  SPARKLINE_HEADERS, sparklineEtag,
} from '@/lib/export/sparkline-svg'

export const runtime = 'nodejs'
export const revalidate = 3600

const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/categorias/:slug/sparkline.svg — inline SVG of monthly
 * statement counts for a category. Uses the category's color_hex
 * as default stroke.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const { slug } = await params
  if (!SLUG_RE.test(slug)) return new Response('invalid slug', { status: 400 })

  const supabase = getSupabaseServiceClient()
  const { data: cat } = await (supabase.from('categories') as any)
    .select('id, label_pt, color_hex')
    .eq('slug', slug)
    .maybeSingle()

  const { months, W, H, color } = parseSparklineParams(
    request.nextUrl.searchParams,
    { color: cat?.color_hex ?? '#d97706' },
  )

  if (!cat) {
    return new Response(renderSparklineSvg({ buckets: [], width: W, height: H, color, ariaLabel: 'sem dados' }), {
      headers: SPARKLINE_HEADERS,
    })
  }

  const now = new Date()
  const startIso = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (months - 1), 1))
    .toISOString().slice(0, 10)

  // Join via statement_categories so we hit only this category.
  const { data: rows } = await (supabase.from('statement_categories') as any)
    .select('statements!inner(statement_date, verification_status)')
    .eq('category_id', cat.id)
    .gte('statements.statement_date', startIso)
    .limit(10000)

  type Row = { statements: { statement_date: string; verification_status: string } | null }
  const dates = ((rows ?? []) as Row[])
    .map((r) => r.statements)
    .filter((s): s is NonNullable<Row['statements']> => s !== null && s.verification_status !== 'removed')
    .map((s) => s.statement_date)

  const buckets = bucketByMonthUtc(months, dates)
  const etag = sparklineEtag(`spk-c-${slug}-${W}x${H}`, buckets)
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  const svg = renderSparklineSvg({
    buckets, width: W, height: H, color,
    ariaLabel: `Sparkline de declarações: categoria ${cat.label_pt}, últimos ${months} meses`,
  })
  return new Response(svg, { headers: { ...SPARKLINE_HEADERS, ETag: etag } })
}
