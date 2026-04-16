import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { parseInclude, parseSeverity } from '@/lib/utils/api-filters'
import type { V2CategoryInclude } from '@/types/api-v2'

export const runtime = 'edge'

/**
 * GET /api/v2/categories — Enhanced categories API with filtering and includes.
 */
export async function GET(request: NextRequest) {
  const rateLimitKey = getRateLimitKey(request, 'api-v2-categories')
  const { allowed, remaining, resetAt } = checkRateLimit(rateLimitKey, { limit: 100, windowMs: 60_000 })
  if (!allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Rate limit exceeded' } },
      { status: 429, headers: { 'Retry-After': String(Math.ceil((resetAt - Date.now()) / 1000)) } }
    )
  }

  const sp = request.nextUrl.searchParams
  const q = sp.get('q')
  const severity = parseSeverity(sp.get('severity'))
  const parentId = sp.get('parent_id')
  const includes = parseInclude<V2CategoryInclude>(sp.get('include'), ['statement_count', 'children'])

  const supabase = getSupabaseServiceClient()

  let query = supabase
    .from('categories')
    .select('id, slug, label_pt, label_en, description, color_hex, icon, severity, parent_id, sort_order, created_at')
    .order('sort_order')

  if (q) {
    const escaped = q.replace(/%/g, '\\%').replace(/_/g, '\\_')
    query = query.or(`label_pt.ilike.%${escaped}%,label_en.ilike.%${escaped}%,description.ilike.%${escaped}%`)
  }

  if (severity) query = query.in('severity', severity)
  if (parentId === 'null') {
    query = query.is('parent_id', null)
  } else if (parentId) {
    query = query.eq('parent_id', parentId)
  }

  const { data: categories, error } = await query

  if (error) {
    console.error('[api/v2/categories] Error:', error)
    return NextResponse.json(
      { error: { code: 'INTERNAL_ERROR', message: 'Internal server error' } },
      { status: 500 }
    )
  }

  let result = (categories ?? []) as Record<string, unknown>[]

  // Include statement_count
  if (includes.includes('statement_count') && result.length > 0) {
    const catIds = result.map(c => String(c['id']))

    const { data: scData } = await supabase
      .from('statement_categories')
      .select('category_id, statements!inner(verification_status)')
      .in('category_id', catIds)
      .eq('statements.verification_status' as any, 'verified')

    const countMap = new Map<string, number>()
    if (scData) {
      for (const row of scData as unknown as { category_id: string }[]) {
        countMap.set(row.category_id, (countMap.get(row.category_id) ?? 0) + 1)
      }
    }

    result = result.map(cat => ({
      ...cat,
      statement_count: countMap.get(String(cat['id'])) ?? 0,
    }))
  }

  // Include children (nest subcategories)
  if (includes.includes('children')) {
    const allCats = result
    const parentIds = new Set(allCats.map(c => String(c['id'])))
    // Find children not already in result
    const childrenInResult = allCats.filter(c => c['parent_id'] && parentIds.has(String(c['parent_id'])))
    const topLevel = allCats.filter(c => !c['parent_id'] || !parentIds.has(String(c['parent_id'])) || parentId)

    result = topLevel.map(cat => ({
      ...cat,
      children: childrenInResult.filter(child => child['parent_id'] === cat['id']),
    }))
  }

  return NextResponse.json(
    { data: result, total: result.length },
    {
      headers: {
        'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=1800',
        'Vary': 'Accept-Encoding',
        'X-RateLimit-Remaining': String(remaining),
        'X-API-Version': 'v2',
      },
    }
  )
}
