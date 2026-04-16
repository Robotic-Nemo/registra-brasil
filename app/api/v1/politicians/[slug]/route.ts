import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'edge'
export const revalidate = 3600

/**
 * GET /api/v1/politicians/:slug — Single politician detail
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> }
) {
  const { slug } = await params

  const rateLimitKey = getRateLimitKey(request, 'api-v1-politician-detail')
  const { allowed, remaining, resetAt } = checkRateLimit(rateLimitKey, { limit: 60, windowMs: 60_000 })
  if (!allowed) {
    return NextResponse.json({ error: 'Rate limit exceeded' }, {
      status: 429,
      headers: { 'Retry-After': String(Math.ceil((resetAt - Date.now()) / 1000)) },
    })
  }

  const supabase = getSupabaseServiceClient()

  const { data: politician, error } = await supabase
    .from('politicians')
    .select(`
      id, slug, full_name, common_name, party, party_history,
      state, role, role_history, photo_url, tse_id, camara_id, senado_id,
      wikipedia_url, is_active, created_at, updated_at
    `)
    .eq('slug', slug)
    .maybeSingle()

  if (error) {
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }

  if (!politician) {
    return NextResponse.json({ error: 'Politician not found' }, { status: 404 })
  }

  // Get statement count
  const polRecord = politician as any
  const { count } = await supabase
    .from('statements')
    .select('id', { count: 'exact', head: true })
    .eq('politician_id', polRecord.id)
    .eq('verification_status', 'verified')

  return NextResponse.json({
    data: {
      ...polRecord,
      statement_count: count ?? 0,
    },
  }, {
    headers: {
      'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=1800',
      'X-RateLimit-Remaining': String(remaining),
      'X-API-Version': 'v1',
    },
  })
}
