import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/politicos.json — directory of active politicians with
 * slug, common name, party, state, and profile URL. Optional
 * ?ativo=false to include inactive politicians too.
 *
 * Cached 1h browser / 3h CDN. Thin payload (no photo URLs, no
 * histories) so the file stays under ~50kB for hundreds of rows.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'politicos-dir'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const includeInactive = request.nextUrl.searchParams.get('ativo') === 'false'
  const supabase = getSupabaseServiceClient()
  let q = (supabase.from('politicians') as any)
    .select('slug, common_name, party, state, is_active')
    .order('common_name')
  if (!includeInactive) q = q.eq('is_active', true)
  const { data, error } = await q.limit(2000)
  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 })
  }

  type Row = { slug: string; common_name: string; party: string | null; state: string | null; is_active: boolean }
  const rows = (data ?? []) as Row[]

  return NextResponse.json({
    count: rows.length,
    include_inactive: includeInactive,
    politicians: rows.map((r) => ({
      slug: r.slug,
      common_name: r.common_name,
      party: r.party,
      state: r.state,
      is_active: r.is_active,
      url: `${SITE_URL}/politico/${r.slug}`,
    })),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=3600, s-maxage=10800, stale-while-revalidate=86400',
    },
  })
}
