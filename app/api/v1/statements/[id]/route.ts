import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'edge'
export const revalidate = 600

/**
 * GET /api/v1/statements/:id — Single statement detail
 * Accepts either UUID or slug
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  const { id } = await params

  const rateLimitKey = getRateLimitKey(request, 'api-v1-statement-detail')
  const { allowed, remaining, resetAt } = checkRateLimit(rateLimitKey, { limit: 60, windowMs: 60_000 })
  if (!allowed) {
    return NextResponse.json({ error: 'Rate limit exceeded' }, {
      status: 429,
      headers: { 'Retry-After': String(Math.ceil((resetAt - Date.now()) / 1000)) },
    })
  }

  const supabase = getSupabaseServiceClient()

  // Try by slug first, then by UUID
  const isUuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(id)
  const column = isUuid ? 'id' : 'slug'

  const { data, error } = await supabase
    .from('statements')
    .select(`
      id, summary, full_quote, context, verification_status,
      statement_date, statement_date_approx, primary_source_url, primary_source_type,
      venue, event_name, slug, is_featured, youtube_video_id,
      created_at, updated_at,
      politicians (id, slug, common_name, full_name, party, state, role, photo_url),
      statement_categories (
        is_primary,
        categories (slug, label_pt, color_hex)
      )
    `)
    .eq(column, id)
    .maybeSingle()

  if (error) {
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }

  if (!data) {
    return NextResponse.json({ error: 'Statement not found' }, { status: 404 })
  }

  return NextResponse.json({
    data,
  }, {
    headers: {
      'Cache-Control': 'public, s-maxage=600, stale-while-revalidate=300',
      'X-RateLimit-Remaining': String(remaining),
      'X-API-Version': 'v1',
    },
  })
}
