import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildWeeklyStatusSeries } from '@/lib/stats/weekly-buckets'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/categorias/:slug/por-semana.json — weekly (ISO, UTC-Monday)
 * statement bucket counts for one category (primary tag only).
 * Split by verification status, gap-filled.
 *   ?semanas=4..104 (default 26)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'cat-por-semana'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const semanas = Math.max(4, Math.min(104, Number(request.nextUrl.searchParams.get('semanas')) || 26))

  const supabase = getSupabaseServiceClient()
  const { data: cat } = await (supabase.from('categories') as any)
    .select('id, slug, label_pt, color_hex')
    .eq('slug', slug)
    .maybeSingle()
  if (!cat) {
    return NextResponse.json({ error: 'categoria não encontrada' }, { status: 404 })
  }

  const today = new Date()
  const startMs = Date.UTC(today.getUTCFullYear(), today.getUTCMonth(), today.getUTCDate()) - semanas * 7 * 86400_000
  const startStr = new Date(startMs).toISOString().slice(0, 10)

  const { data, error } = await (supabase.from('statement_categories') as any)
    .select('is_primary, statements!inner(statement_date, verification_status)')
    .eq('category_id', cat.id)
    .eq('is_primary', true)
    .neq('statements.verification_status', 'removed')
    .gte('statements.statement_date', startStr)
    .limit(30000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type PivotRow = { statements: { statement_date: string; verification_status: string } | null }
  const rows = ((data ?? []) as PivotRow[])
    .map((r) => r.statements)
    .filter((s): s is NonNullable<typeof s> => s != null)

  const { series, total } = buildWeeklyStatusSeries(semanas, rows)

  const etag = `W/"cat-por-semana-${cat.id}-${semanas}-${total}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    category: {
      slug: cat.slug, label: cat.label_pt, color: cat.color_hex,
      url: `${SITE_URL}/categorias/${cat.slug}`,
    },
    semanas,
    total,
    series,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
