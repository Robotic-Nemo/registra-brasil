import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { decodeCursor, parseLimit, buildCursorPagination } from '@/lib/utils/cursor-pagination'

export const runtime = 'nodejs'
export const revalidate = 900

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

const SELECT = `
  id, politician_id, statement_low_id, statement_high_id,
  headline, editor_note, severity, created_at, updated_at,
  politicians!contradiction_pairs_politician_id_fkey ( id, slug, common_name, party, state ),
  low:statements!contradiction_pairs_statement_low_id_fkey ( id, slug, summary, statement_date, primary_source_url ),
  high:statements!contradiction_pairs_statement_high_id_fkey ( id, slug, summary, statement_date, primary_source_url )
`

/**
 * GET /api/v2/contradictions — cursor-paginated published
 * contradiction pairs with both statements + politician inlined.
 *   ?limit=1..100 (default 20)
 *   ?cursor=<opaque>
 *   ?order=asc|desc (by created_at, default desc)
 *   ?politico=<slug>   filter by politician
 *   ?min_severity=1..4
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'v2-contradictions'), {
    limit: 100, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Rate limit exceeded' } },
      { status: 429 },
    )
  }

  const sp = request.nextUrl.searchParams
  const limit = parseLimit(sp.get('limit'), 20, 100)
  const ascending = sp.get('order') === 'asc'
  const cursor = sp.get('cursor')
  const politico = sp.get('politico')
  const minSeverityRaw = Number(sp.get('min_severity'))
  const minSeverity = Number.isFinite(minSeverityRaw) && minSeverityRaw >= 1 && minSeverityRaw <= 4
    ? Math.floor(minSeverityRaw) : null

  const supabase = getSupabaseServiceClient()

  // Resolve politico slug → id if provided.
  let politicianId: string | null = null
  if (politico) {
    if (!/^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/.test(politico)) {
      return NextResponse.json({ error: { code: 'INVALID_PARAM', message: 'politico inválido' } }, { status: 400 })
    }
    const { data: pol } = await (supabase.from('politicians') as any)
      .select('id').eq('slug', politico).maybeSingle()
    if (!pol) {
      return NextResponse.json({
        data: [],
        pagination: { nextCursor: null, prevCursor: null, limit, hasMore: false },
      }, { headers: v2Headers() })
    }
    politicianId = (pol as { id: string }).id
  }

  let query = (supabase.from('contradiction_pairs') as any)
    .select(SELECT)
    .eq('is_published', true)
    .order('created_at', { ascending })
    .order('id', { ascending })
    .limit(limit + 1)

  if (politicianId) query = query.eq('politician_id', politicianId)
  if (minSeverity !== null) query = query.gte('severity', minSeverity)
  if (cursor) {
    const d = decodeCursor(cursor)
    if (d) {
      if (ascending) {
        query = query.or(`created_at.gt.${d.v},and(created_at.eq.${d.v},id.gt.${d.id})`)
      } else {
        query = query.or(`created_at.lt.${d.v},and(created_at.eq.${d.v},id.lt.${d.id})`)
      }
    }
  }

  const { data, error } = await query
  if (error) {
    console.error('[api/v2/contradictions] Error:', error)
    return NextResponse.json(
      { error: { code: 'INTERNAL_ERROR', message: 'Internal server error' } },
      { status: 500 },
    )
  }
  const rows = (data ?? []) as Array<Record<string, any>>
  const hasMore = rows.length > limit
  const pageRows = hasMore ? rows.slice(0, limit) : rows

  const formatStmt = (s: any) => s ? ({
    id: s.id, slug: s.slug, summary: s.summary,
    statement_date: s.statement_date,
    primary_source_url: s.primary_source_url,
    permalink: `${SITE_URL}/declaracao/${s.slug ?? s.id}`,
  }) : null

  const page = pageRows.map((r) => ({
    id: r.id,
    headline: r.headline,
    editor_note: r.editor_note,
    severity: r.severity,
    created_at: r.created_at,
    updated_at: r.updated_at,
    politician: r.politicians ? {
      slug: r.politicians.slug, common_name: r.politicians.common_name,
      party: r.politicians.party, state: r.politicians.state,
      url: `${SITE_URL}/politico/${r.politicians.slug}`,
    } : null,
    statement_low: formatStmt(r.low),
    statement_high: formatStmt(r.high),
    permalink: `${SITE_URL}/contradicoes/${r.id}`,
  }))

  const pagination = buildCursorPagination(pageRows, 'created_at', limit, hasMore)

  return NextResponse.json(
    { data: page, pagination },
    { headers: v2Headers() },
  )
}

function v2Headers(): HeadersInit {
  return {
    'Cache-Control': 'public, s-maxage=300, stale-while-revalidate=900',
    'X-API-Version': 'v2',
  }
}
