import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { decodeCursor, parseLimit, buildCursorPagination } from '@/lib/utils/cursor-pagination'

export const runtime = 'nodejs'
export const revalidate = 900

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/politico/:slug/declaracoes.json — cursor-paginated list of
 * a politician's statements. Default 20 / max 100 per page. Newest
 * first by statement_date (id tie-break).
 *   ?limit=1..100   page size
 *   ?cursor=<opaque>
 *   ?status=verified|disputed|all   filter (default verified)
 *   ?order=asc|desc (default desc)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'pol-decl'), {
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

  const supabase = getSupabaseServiceClient()
  const { data: pol } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name, party, state')
    .eq('slug', slug)
    .maybeSingle()
  if (!pol) {
    return NextResponse.json({ error: 'Político não encontrado' }, { status: 404 })
  }

  let query = (supabase.from('statements') as any)
    .select('id, slug, summary, statement_date, severity_score, verification_status, primary_source_url, primary_source_type')
    .eq('politician_id', pol.id)
    .neq('verification_status', 'removed')
    .order('statement_date', { ascending })
    .order('id', { ascending })
    .limit(limit + 1)

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
  const rows = (data ?? []) as Array<Record<string, unknown>>
  const hasMore = rows.length > limit
  const page = (hasMore ? rows.slice(0, limit) : rows).map((r: any) => ({
    id: r.id, slug: r.slug, summary: r.summary,
    statement_date: r.statement_date,
    severity_score: r.severity_score,
    verification_status: r.verification_status,
    primary_source_url: r.primary_source_url,
    primary_source_type: r.primary_source_type,
    permalink: `${SITE_URL}/declaracao/${r.slug ?? r.id}`,
  }))

  const pagination = buildCursorPagination(hasMore ? rows.slice(0, limit) : rows, 'statement_date', limit, hasMore)

  return NextResponse.json({
    politician: {
      slug: pol.slug, common_name: pol.common_name,
      party: pol.party, state: pol.state,
      url: `${SITE_URL}/politico/${pol.slug}`,
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
