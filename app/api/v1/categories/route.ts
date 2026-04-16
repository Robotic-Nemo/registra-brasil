import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'edge'
export const revalidate = 3600

/**
 * GET /api/v1/categories — Public categories API with statement counts
 */
export async function GET(request: NextRequest) {
  const rateLimitKey = getRateLimitKey(request, 'api-v1-categories')
  const { allowed, remaining, resetAt } = checkRateLimit(rateLimitKey, { limit: 60, windowMs: 60_000 })
  if (!allowed) {
    return NextResponse.json({ error: 'Rate limit exceeded' }, {
      status: 429,
      headers: { 'Retry-After': String(Math.ceil((resetAt - Date.now()) / 1000)) },
    })
  }

  const supabase = getSupabaseServiceClient()

  const { data: categories, error } = await supabase
    .from('categories')
    .select('id, slug, label_pt, label_en, description, color_hex, icon, severity, sort_order')
    .order('sort_order')

  if (error) {
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }

  // Get counts per category (only verified statements)
  const { data: counts } = await supabase
    .from('statement_categories')
    .select('category_id, statements!inner(verification_status)')
    .eq('statements.verification_status', 'verified')

  const countMap = new Map<string, number>()
  if (counts) {
    for (const row of counts) {
      const cid = (row as unknown as { category_id: string }).category_id
      countMap.set(cid, (countMap.get(cid) ?? 0) + 1)
    }
  }

  const result = ((categories ?? []) as any[]).map((cat) => ({
    ...cat,
    statement_count: countMap.get(cat.id) ?? 0,
  }))

  return NextResponse.json({
    data: result,
    total: result.length,
  }, {
    headers: {
      'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=1800',
      'Vary': 'Accept-Encoding',
      'X-RateLimit-Remaining': String(remaining),
      'X-API-Version': 'v1',
    },
  })
}
