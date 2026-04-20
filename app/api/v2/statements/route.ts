import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { decodeCursor, parseLimit, buildCursorPagination } from '@/lib/utils/cursor-pagination'
import { parseFields, buildSelectString, projectFields } from '@/lib/utils/field-selection'
import { parseMultiValueUpper, parseMultiValueLower, parseInclude, isValidDate } from '@/lib/utils/api-filters'
import { parseSeverityFilter } from '@/lib/utils/severity'
import type { V2StatementInclude } from '@/types/api-v2'
import type { FieldSelectionConfig } from '@/types/api-v2'

export const runtime = 'edge'

const FIELD_CONFIG: FieldSelectionConfig = {
  allowed: [
    'id', 'summary', 'full_quote', 'context', 'verification_status',
    'statement_date', 'primary_source_url', 'primary_source_type',
    'venue', 'event_name', 'slug', 'created_at', 'updated_at',
    'is_featured', 'politician_id', 'severity_score',
  ],
  defaults: [
    'id', 'summary', 'verification_status', 'statement_date',
    'primary_source_url', 'slug', 'created_at', 'severity_score',
  ],
}

const SORT_MAP: Record<string, string> = {
  date: 'statement_date',
  created: 'created_at',
  severity: 'severity_score',
}

/**
 * GET /api/v2/statements — Enhanced statements API with cursor pagination,
 * multi-value filters, full-text search, field selection, and relation includes.
 */
export async function GET(request: NextRequest) {
  const rateLimitKey = getRateLimitKey(request, 'api-v2-statements')
  const { allowed, remaining, resetAt } = checkRateLimit(rateLimitKey, { limit: 100, windowMs: 60_000 })
  if (!allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Rate limit exceeded' } },
      { status: 429, headers: { 'Retry-After': String(Math.ceil((resetAt - Date.now()) / 1000)) } }
    )
  }

  const sp = request.nextUrl.searchParams

  // Parse params
  const q = sp.get('q')
  const from = sp.get('from')
  const to = sp.get('to')
  const parties = parseMultiValueUpper(sp.get('party'))
  const states = parseMultiValueUpper(sp.get('state'))
  const categories = parseMultiValueLower(sp.get('category'))
  // Whitelist to prevent `status=removed` from leaking soft-deleted
  // rows and `status=all` (or any other value) from returning an
  // empty page because of an exact `eq` against a made-up literal.
  const statusRaw = sp.get('status') ?? 'verified'
  const ALLOWED_STATUS = new Set(['verified', 'disputed', 'unverified'])
  const status = ALLOWED_STATUS.has(statusRaw) ? statusRaw : 'verified'
  const sortKey = sp.get('sort') ?? 'date'
  const order = sp.get('order') === 'asc'
  const cursor = sp.get('cursor')
  const limit = parseLimit(sp.get('limit'), 20, 100)
  const fields = parseFields(sp.get('fields'), FIELD_CONFIG)
  const includes = parseInclude<V2StatementInclude>(sp.get('include'), ['politician', 'categories'])
  const severity = parseSeverityFilter(sp.get('severity'))
  // `min_severity=N` filters statements with severity_score >= N.
  const minSeverityRaw = Number(sp.get('min_severity'))
  const minSeverity = Number.isFinite(minSeverityRaw) && minSeverityRaw >= 1 && minSeverityRaw <= 5
    ? Math.floor(minSeverityRaw)
    : null

  // Validate dates
  if (from && !isValidDate(from)) {
    return NextResponse.json(
      { error: { code: 'INVALID_PARAM', message: 'Invalid "from" date. Use YYYY-MM-DD.' } },
      { status: 400 }
    )
  }
  if (to && !isValidDate(to)) {
    return NextResponse.json(
      { error: { code: 'INVALID_PARAM', message: 'Invalid "to" date. Use YYYY-MM-DD.' } },
      { status: 400 }
    )
  }

  const sortField = SORT_MAP[sortKey] ?? 'statement_date'
  const supabase = getSupabaseServiceClient()

  // Build select string
  const selectStr = buildSelectString(fields, includes.length > 0 ? includes : undefined)

  // Fetch limit+1 to detect hasMore
  let query = supabase
    .from('statements')
    .select(selectStr)
    .eq('verification_status', status)
    .order(sortField, { ascending: order })
    .order('id', { ascending: order })
    .limit(limit + 1)

  // Cursor-based pagination
  if (cursor) {
    const decoded = decodeCursor(cursor)
    if (decoded) {
      if (order) {
        query = query.or(`${sortField}.gt.${decoded.v},and(${sortField}.eq.${decoded.v},id.gt.${decoded.id})`)
      } else {
        query = query.or(`${sortField}.lt.${decoded.v},and(${sortField}.eq.${decoded.v},id.lt.${decoded.id})`)
      }
    }
  }

  // Full-text search. PostgREST `or()` parses commas/parens/colons as
  // delimiters; a raw user `q` with those chars breaks the filter or
  // opens injection. Strip delimiters and wildcards so `%` and `_` in
  // user input match literally.
  if (q) {
    const safe = q.replace(/[,()\\]/g, ' ').replace(/[%_]/g, ' ').trim()
    if (safe) {
      query = query.or(`summary.ilike.%${safe}%,full_quote.ilike.%${safe}%`)
    }
  }

  // Date range
  if (from) query = query.gte('statement_date', from)
  if (to) query = query.lte('statement_date', to)

  // Severity filters.
  // `severity=4,5` — exact match against the set.
  // `min_severity=3` — >= 3.
  // Both filter on the statement override column (nulls excluded).
  if (severity && severity.length > 0) {
    query = query.in('severity_score', severity as number[])
  }
  if (minSeverity !== null) {
    query = query.gte('severity_score', minSeverity)
  }

  // Multi-value filters: party and state require a join through politicians
  if (parties || states) {
    // Get matching politician IDs
    let polQuery = supabase.from('politicians').select('id')
    if (parties) polQuery = polQuery.in('party', parties)
    if (states) polQuery = polQuery.in('state', states)
    const { data: pols } = await polQuery
    const polIds = (pols ?? []).map((p: unknown) => (p as { id: string }).id)
    if (polIds.length === 0) {
      return NextResponse.json({
        data: [],
        pagination: { nextCursor: null, prevCursor: null, limit, hasMore: false },
      }, { headers: v2Headers(remaining) })
    }
    query = query.in('politician_id', polIds)
  }

  // Category filter
  if (categories) {
    // Get category IDs by slug
    const { data: cats } = await supabase
      .from('categories')
      .select('id')
      .in('slug', categories)
    const catIds = (cats ?? []).map((c: unknown) => (c as { id: string }).id)
    if (catIds.length === 0) {
      return NextResponse.json({
        data: [],
        pagination: { nextCursor: null, prevCursor: null, limit, hasMore: false },
      }, { headers: v2Headers(remaining) })
    }
    // Filter statements that have at least one of the given categories
    // Cap at 10k ids — postgres' `IN (...)` query below already caps
    // the practical filter size, and a single page of v2 results is
    // at most `limit` rows anyway.
    const { data: scRows } = await supabase
      .from('statement_categories')
      .select('statement_id')
      .in('category_id', catIds)
      .limit(10000)
    const stmtIds = [...new Set((scRows ?? []).map((r: unknown) => (r as { statement_id: string }).statement_id))]
    if (stmtIds.length === 0) {
      return NextResponse.json({
        data: [],
        pagination: { nextCursor: null, prevCursor: null, limit, hasMore: false },
      }, { headers: v2Headers(remaining) })
    }
    query = query.in('id', stmtIds)
  }

  const { data, error } = await query

  if (error) {
    console.error('[api/v2/statements] Error:', error)
    return NextResponse.json(
      { error: { code: 'INTERNAL_ERROR', message: 'Internal server error' } },
      { status: 500 }
    )
  }

  const rows = (data ?? []) as Record<string, unknown>[]
  const hasMore = rows.length > limit
  const pageRows = hasMore ? rows.slice(0, limit) : rows

  // Apply field projection
  const projected = pageRows.map(row => projectFields(row, fields, includes))

  const pagination = buildCursorPagination(pageRows, sortField, limit, hasMore)

  return NextResponse.json(
    { data: projected, pagination },
    { headers: v2Headers(remaining) }
  )
}

function v2Headers(remaining: number): HeadersInit {
  return {
    // SWR shorter than s-maxage left a coverage gap — once the fresh
// window closed, clients paid a synchronous DB round-trip instead
// of riding the stale window. Bumped SWR past s-maxage so stale
// hits serve instantly while we refresh in the background.
'Cache-Control': 'public, s-maxage=120, stale-while-revalidate=600',
    'Vary': 'Accept-Encoding',
    'X-RateLimit-Remaining': String(remaining),
    'X-API-Version': 'v2',
  }
}
