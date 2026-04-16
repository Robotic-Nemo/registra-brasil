import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'edge'
export const revalidate = 3600

/**
 * GET /api/v1/politicians — Public API for politicians
 * Params: page, limit, party, state, sort, order, q
 */
export async function GET(request: NextRequest) {
  const rateLimitKey = getRateLimitKey(request, 'api-v1-politicians')
  const { allowed, remaining, resetAt } = checkRateLimit(rateLimitKey, { limit: 60, windowMs: 60_000 })
  if (!allowed) {
    return NextResponse.json({ error: 'Rate limit exceeded' }, {
      status: 429,
      headers: { 'Retry-After': String(Math.ceil((resetAt - Date.now()) / 1000)) },
    })
  }

  const { searchParams } = request.nextUrl
  const page = Math.max(1, Number(searchParams.get('page') ?? 1))
  const limit = Math.min(100, Math.max(1, Number(searchParams.get('limit') ?? 50)))
  const party = searchParams.get('party')
  const state = searchParams.get('state')
  const q = searchParams.get('q')
  const offset = (page - 1) * limit

  const supabase = getSupabaseServiceClient()

  let query = supabase
    .from('politicians')
    .select('slug, common_name, full_name, party, state, role, photo_url, is_active', { count: 'exact' })
    .eq('is_active', true)
    .order('common_name', { ascending: true })
    .range(offset, offset + limit - 1)

  if (party) query = query.eq('party', party.toUpperCase())
  if (state) query = query.eq('state', state.toUpperCase())
  if (q) {
    const escapedQ = q.replace(/%/g, '\\%').replace(/_/g, '\\_')
    query = query.ilike('common_name', `%${escapedQ}%`)
  }

  const { data, count, error } = await query

  if (error) {
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }

  const totalPages = Math.ceil((count ?? 0) / limit)

  return NextResponse.json({
    data: data ?? [],
    pagination: { page, perPage: limit, total: count ?? 0, totalPages, hasNext: page < totalPages, hasPrev: page > 1 },
  }, {
    headers: {
      'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=1800',
      'Vary': 'Accept-Encoding',
      'X-RateLimit-Remaining': String(remaining),
      'X-API-Version': 'v1',
    },
  })
}
