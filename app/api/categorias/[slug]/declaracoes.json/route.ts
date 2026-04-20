import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { decodeCursor, parseLimit, buildCursorPagination } from '@/lib/utils/cursor-pagination'

export const runtime = 'nodejs'
export const revalidate = 900

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/categorias/:slug/declaracoes.json — cursor-paginated list
 * of statements tagged with a category (primary or secondary).
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'cat-decl'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const sp = request.nextUrl.searchParams
  const limit = parseLimit(sp.get('limit'), 20, 100)
  const ascending = sp.get('order') === 'asc'
  const status = sp.get('status') ?? 'verified'
  const cursor = sp.get('cursor')
  const primaryOnly = sp.get('primary') === '1'

  const supabase = getSupabaseServiceClient()
  const { data: cat } = await (supabase.from('categories') as any)
    .select('id, slug, label_pt, color_hex')
    .eq('slug', slug)
    .maybeSingle()
  if (!cat) {
    return NextResponse.json({ error: 'Categoria não encontrada' }, { status: 404 })
  }

  let query = (supabase.from('statements') as any)
    .select('id, slug, summary, statement_date, severity_score, verification_status, primary_source_url, politicians!inner(slug, common_name, party, state), statement_categories!inner(category_id, is_primary)')
    .eq('statement_categories.category_id', cat.id)
    .neq('verification_status', 'removed')
    .order('statement_date', { ascending })
    .order('id', { ascending })
    .limit(limit + 1)

  if (primaryOnly) query = query.eq('statement_categories.is_primary', true)
  if (status !== 'all') query = query.eq('verification_status', status)
  if (cursor) {
    const d = decodeCursor(cursor)
    if (d) {
      if (ascending) {
        query = query.or(`statement_date.gt.${d.v},and(statement_date.eq.${d.v},id.gt.${d.id})`)
      } else {
        query = query.or(`statement_date.lt.${d.v},and(statement_date.eq.${d.v},id.lt.${d.id})`)
      }
    }
  }

  const { data, error } = await query
  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 })
  }
  const rows = (data ?? []) as Array<Record<string, any>>
  const hasMore = rows.length > limit
  const pageRows = hasMore ? rows.slice(0, limit) : rows
  const page = pageRows.map((r) => ({
    id: r.id, slug: r.slug, summary: r.summary,
    statement_date: r.statement_date,
    severity_score: r.severity_score,
    verification_status: r.verification_status,
    primary_source_url: r.primary_source_url,
    politician: r.politicians ? {
      slug: r.politicians.slug, common_name: r.politicians.common_name,
      party: r.politicians.party, state: r.politicians.state,
      url: `${SITE_URL}/politico/${r.politicians.slug}`,
    } : null,
    is_primary_category: Array.isArray(r.statement_categories)
      ? r.statement_categories.some((sc: any) => sc.is_primary)
      : false,
    permalink: `${SITE_URL}/declaracao/${r.slug ?? r.id}`,
  }))

  const pagination = buildCursorPagination(pageRows, 'statement_date', limit, hasMore)

  return NextResponse.json({
    category: {
      slug: cat.slug, label: cat.label_pt, color: cat.color_hex,
      url: `${SITE_URL}/categorias/${cat.slug}`,
    },
    data: page,
    pagination,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=300, s-maxage=900, stale-while-revalidate=3600',
    },
  })
}
