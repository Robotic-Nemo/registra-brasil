import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { decodeCursor, parseLimit, buildCursorPagination } from '@/lib/utils/cursor-pagination'
import { parseFields } from '@/lib/utils/field-selection'
import { parseMultiValueUpper, parseInclude } from '@/lib/utils/api-filters'
import type { V2PoliticianInclude } from '@/types/api-v2'
import type { FieldSelectionConfig } from '@/types/api-v2'

export const runtime = 'edge'

const FIELD_CONFIG: FieldSelectionConfig = {
  allowed: [
    'id', 'slug', 'full_name', 'common_name', 'party', 'state',
    'role', 'photo_url', 'is_active', 'tse_id', 'camara_id',
    'senado_id', 'wikipedia_url', 'created_at', 'updated_at',
  ],
  defaults: [
    'id', 'slug', 'common_name', 'full_name', 'party', 'state',
    'role', 'photo_url', 'is_active',
  ],
}

const SORT_MAP: Record<string, string> = {
  name: 'common_name',
  created: 'created_at',
}

/**
 * GET /api/v2/politicians — Enhanced politicians API with cursor pagination,
 * multi-value filters, search, and field selection.
 */
export async function GET(request: NextRequest) {
  const rateLimitKey = getRateLimitKey(request, 'api-v2-politicians')
  const { allowed, remaining, resetAt } = checkRateLimit(rateLimitKey, { limit: 100, windowMs: 60_000 })
  if (!allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Rate limit exceeded' } },
      { status: 429, headers: { 'Retry-After': String(Math.ceil((resetAt - Date.now()) / 1000)) } }
    )
  }

  const sp = request.nextUrl.searchParams

  const q = sp.get('q')
  const parties = parseMultiValueUpper(sp.get('party'))
  const states = parseMultiValueUpper(sp.get('state'))
  const role = sp.get('role')
  const activeParam = sp.get('active')
  const sortKey = sp.get('sort') ?? 'name'
  const order = sp.get('order') === 'desc' ? false : true
  const cursor = sp.get('cursor')
  const limit = parseLimit(sp.get('limit'), 50, 200)
  const fields = parseFields(sp.get('fields'), FIELD_CONFIG)
  const includes = parseInclude<V2PoliticianInclude>(sp.get('include'), ['statement_count', 'categories'])

  const sortField = SORT_MAP[sortKey] ?? 'common_name'
  const supabase = getSupabaseServiceClient()

  // Build select
  const fieldSet = new Set(fields)
  fieldSet.add('id')
  const selectStr = Array.from(fieldSet).join(', ')

  let query = supabase
    .from('politicians')
    .select(selectStr)
    .order(sortField, { ascending: order })
    .order('id', { ascending: order })
    .limit(limit + 1)

  // Active filter
  if (activeParam !== null) {
    query = query.eq('is_active', activeParam !== 'false')
  } else {
    query = query.eq('is_active', true)
  }

  // Cursor
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

  // Search
  if (q) {
    // Strip PostgREST or-grammar metachars (`,()` and backslash) before
    // escaping LIKE wildcards. Without this a user-supplied `q` like
    // `a,b)` breaks out of the ilike filter into a sibling or-clause.
    const safe = q.replace(/[,()\\]/g, ' ').replace(/[%_]/g, ' ').trim()
    if (safe) {
      query = query.or(`common_name.ilike.%${safe}%,full_name.ilike.%${safe}%`)
    }
  }

  // Multi-value filters
  if (parties) query = query.in('party', parties)
  if (states) query = query.in('state', states)
  if (role) query = query.eq('role', role)

  const { data, error } = await query

  if (error) {
    console.error('[api/v2/politicians] Error:', error)
    return NextResponse.json(
      { error: { code: 'INTERNAL_ERROR', message: 'Internal server error' } },
      { status: 500 }
    )
  }

  const rows = (data ?? []) as Record<string, unknown>[]
  const hasMore = rows.length > limit
  const pageRows = hasMore ? rows.slice(0, limit) : rows

  // Include statement_count if requested
  let enriched: Record<string, unknown>[] = pageRows
  if (includes.includes('statement_count') && pageRows.length > 0) {
    const polIds = pageRows.map(r => String(r['id']))
    const { data: countData } = await supabase
      .from('statements')
      .select('politician_id', { count: 'exact' })
      .in('politician_id', polIds)
      .eq('verification_status', 'verified')

    // Build count map
    const countMap = new Map<string, number>()
    if (countData) {
      for (const row of countData as unknown as { politician_id: string }[]) {
        countMap.set(row.politician_id, (countMap.get(row.politician_id) ?? 0) + 1)
      }
    }

    enriched = pageRows.map(row => ({
      ...row,
      statement_count: countMap.get(String(row['id'])) ?? 0,
    }))
  }

  const pagination = buildCursorPagination(pageRows, sortField, limit, hasMore)

  return NextResponse.json(
    { data: enriched, pagination },
    {
      headers: {
        'Cache-Control': 'public, s-maxage=600, stale-while-revalidate=3600',
        'Vary': 'Accept-Encoding',
        'X-RateLimit-Remaining': String(remaining),
        'X-API-Version': 'v2',
      },
    }
  )
}
