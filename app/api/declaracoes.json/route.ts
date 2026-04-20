import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { decodeCursor, parseLimit, buildCursorPagination } from '@/lib/utils/cursor-pagination'
import { isValidDate } from '@/lib/utils/api-filters'

export const runtime = 'nodejs'
export const revalidate = 600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/declaracoes.json — top-level cursor-paginated list of
 * statements. Thin alternative to /api/v2/statements for clients
 * that just want "walk every statement, newest first".
 *
 *   ?limit=1..100 (default 20)
 *   ?cursor=<opaque>
 *   ?status=verified|disputed|all  (default verified)
 *   ?order=asc|desc                (default desc)
 *   ?from=YYYY-MM-DD, ?to=YYYY-MM-DD
 *   ?min_severity=1..5
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'decl-json'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const sp = request.nextUrl.searchParams
  const limit = parseLimit(sp.get('limit'), 20, 100)
  const ascending = sp.get('order') === 'asc'
  const status = sp.get('status') ?? 'verified'
  const cursor = sp.get('cursor')
  const from = sp.get('from')
  const to = sp.get('to')
  const minSeverityRaw = Number(sp.get('min_severity'))
  const minSeverity = Number.isFinite(minSeverityRaw) && minSeverityRaw >= 1 && minSeverityRaw <= 5
    ? Math.floor(minSeverityRaw) : null

  if (from && !isValidDate(from)) {
    return NextResponse.json({ error: 'from deve ser YYYY-MM-DD' }, { status: 400 })
  }
  if (to && !isValidDate(to)) {
    return NextResponse.json({ error: 'to deve ser YYYY-MM-DD' }, { status: 400 })
  }

  const supabase = getSupabaseServiceClient()
  let query = (supabase.from('statements') as any)
    .select('id, slug, summary, statement_date, severity_score, verification_status, primary_source_url, primary_source_type, politicians!inner(slug, common_name, party, state)')
    .neq('verification_status', 'removed')
    .order('statement_date', { ascending })
    .order('id', { ascending })
    .limit(limit + 1)

  if (status !== 'all') query = query.eq('verification_status', status)
  if (from) query = query.gte('statement_date', from)
  if (to) query = query.lte('statement_date', to)
  if (minSeverity !== null) query = query.gte('severity_score', minSeverity)
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
  if (error) return NextResponse.json({ error: error.message }, { status: 500 })
  const rows = (data ?? []) as Array<Record<string, any>>
  const hasMore = rows.length > limit
  const pageRows = hasMore ? rows.slice(0, limit) : rows
  const page = pageRows.map((r) => ({
    id: r.id, slug: r.slug, summary: r.summary,
    statement_date: r.statement_date,
    severity_score: r.severity_score,
    verification_status: r.verification_status,
    primary_source_url: r.primary_source_url,
    primary_source_type: r.primary_source_type,
    politician: r.politicians ? {
      slug: r.politicians.slug, common_name: r.politicians.common_name,
      party: r.politicians.party, state: r.politicians.state,
      url: `${SITE_URL}/politico/${r.politicians.slug}`,
    } : null,
    permalink: `${SITE_URL}/declaracao/${r.slug ?? r.id}`,
  }))

  const pagination = buildCursorPagination(pageRows, 'statement_date', limit, hasMore)

  return NextResponse.json({
    data: page,
    pagination,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=120, s-maxage=600, stale-while-revalidate=1800',
    },
  })
}
