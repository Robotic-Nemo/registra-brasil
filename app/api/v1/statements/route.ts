import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'edge'
export const revalidate = 300

/**
 * GET /api/v1/statements — Public API for statements
 * Params: page, limit, politician, category, status, sort, order
 */
export async function GET(request: NextRequest) {
  // Rate limiting
  const rateLimitKey = getRateLimitKey(request, 'api-v1-statements')
  const { allowed, remaining, resetAt } = checkRateLimit(rateLimitKey, { limit: 60, windowMs: 60_000 })
  if (!allowed) {
    return NextResponse.json({ error: 'Rate limit exceeded' }, {
      status: 429,
      headers: { 'Retry-After': String(Math.ceil((resetAt - Date.now()) / 1000)) },
    })
  }

  const { searchParams } = request.nextUrl
  const page = Math.max(1, Number(searchParams.get('page') ?? 1))
  const limit = Math.min(50, Math.max(1, Number(searchParams.get('limit') ?? 20)))
  const politician = searchParams.get('politician')
  const category = searchParams.get('category')
  const status = searchParams.get('status') ?? 'verified'
  const sort = searchParams.get('sort') ?? 'statement_date'
  const order = searchParams.get('order') === 'asc' ? true : false

  const offset = (page - 1) * limit
  const supabase = getSupabaseServiceClient()

  let query = supabase
    .from('statements')
    .select(`
      id, summary, full_quote, context, verification_status,
      statement_date, primary_source_url, primary_source_type,
      venue, event_name, slug, created_at,
      politicians (slug, common_name, party, state),
      statement_categories (
        is_primary,
        categories (slug, label_pt, color_hex)
      )
    `, { count: 'exact' })
    .eq('verification_status', status)
    .range(offset, offset + limit - 1)

  // Sort
  const validSorts = ['statement_date', 'created_at', 'summary']
  const sortField = validSorts.includes(sort) ? sort : 'statement_date'
  query = query.order(sortField, { ascending: order })

  // Filters
  if (politician) {
    const { data: polRow } = await supabase
      .from('politicians')
      .select('id')
      .eq('slug', politician)
      .single()
    if (!polRow) {
      return NextResponse.json({
        data: [],
        pagination: { page, perPage: limit, total: 0, totalPages: 0, hasNext: false, hasPrev: false },
      })
    }
    query = query.eq('politician_id', (polRow as any).id)
  }

  const { data, count, error } = await query

  if (error) {
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }

  const totalPages = Math.ceil((count ?? 0) / limit)

  return NextResponse.json({
    data: data ?? [],
    pagination: {
      page,
      perPage: limit,
      total: count ?? 0,
      totalPages,
      hasNext: page < totalPages,
      hasPrev: page > 1,
    },
  }, {
    headers: {
      'Cache-Control': 'public, s-maxage=300, stale-while-revalidate=1800',
      'Vary': 'Accept-Encoding',
      'X-RateLimit-Remaining': String(remaining),
      'X-API-Version': 'v1',
    },
  })
}
