import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { decodeCursor, parseLimit, buildCursorPagination } from '@/lib/utils/cursor-pagination'

export const runtime = 'nodejs'
export const revalidate = 900

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const UF_RE = /^[A-Za-z]{2}$/

/**
 * GET /api/estados/:uf/declaracoes.json — cursor-paginated list of
 * statements by politicians of a UF.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ uf: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'uf-decl'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { uf: raw } = await params
  if (!UF_RE.test(raw)) {
    return NextResponse.json({ error: 'UF inválida' }, { status: 400 })
  }
  const uf = raw.toUpperCase()
  const sp = request.nextUrl.searchParams
  const limit = parseLimit(sp.get('limit'), 20, 100)
  const ascending = sp.get('order') === 'asc'
  const status = sp.get('status') ?? 'verified'
  const cursor = sp.get('cursor')

  const supabase = getSupabaseServiceClient()

  let query = (supabase.from('statements') as any)
    .select('id, slug, summary, statement_date, severity_score, verification_status, primary_source_url, politicians!inner(slug, common_name, party, state)')
    .eq('politicians.state', uf)
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
    permalink: `${SITE_URL}/declaracao/${r.slug ?? r.id}`,
  }))

  const pagination = buildCursorPagination(pageRows, 'statement_date', limit, hasMore)

  return NextResponse.json({
    uf,
    url: `${SITE_URL}/estados/${uf.toLowerCase()}`,
    data: page,
    pagination,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=300, s-maxage=900, stale-while-revalidate=3600',
    },
  })
}
