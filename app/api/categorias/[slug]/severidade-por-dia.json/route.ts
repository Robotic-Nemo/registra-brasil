import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildSeverityDailyMatrix, dailyStartStr } from '@/lib/stats/severity-daily-matrix'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/categorias/:slug/severidade-por-dia.json — day × severity
 * level matrix scoped to one category (primary tag only).
 *   ?dias=7..180 (default 60)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'cat-sev-dia'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const dias = Math.max(7, Math.min(180, Number(request.nextUrl.searchParams.get('dias')) || 60))

  const supabase = getSupabaseServiceClient()
  const { data: cat } = await (supabase.from('categories') as any)
    .select('id, slug, label_pt, color_hex')
    .eq('slug', slug)
    .maybeSingle()
  if (!cat) {
    return NextResponse.json({ error: 'categoria não encontrada' }, { status: 404 })
  }

  const { data, error } = await (supabase.from('statement_categories') as any)
    .select('is_primary, statements!inner(statement_date, severity_score, verification_status)')
    .eq('category_id', cat.id)
    .eq('is_primary', true)
    .neq('statements.verification_status', 'removed')
    .gte('statements.statement_date', dailyStartStr(dias))
    .limit(30000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Pivot = { statements: { statement_date: string; severity_score: number | null } | null }
  const rows = ((data ?? []) as Pivot[])
    .map((r) => r.statements)
    .filter((s): s is NonNullable<typeof s> => s != null)

  const { series, total } = buildSeverityDailyMatrix(dias, rows)

  const etag = `W/"cat-sev-dia-${cat.id}-${dias}-${total}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    category: {
      slug: cat.slug, label: cat.label_pt, color: cat.color_hex,
      url: `${SITE_URL}/categorias/${cat.slug}`,
    },
    dias, total, series,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
