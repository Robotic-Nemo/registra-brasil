import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/partidos/:slug/politicos.json — active politicians of a
 * party with verified-statement counts. Useful for "members" cards.
 *   ?limite=1..100 (default 30)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'party-pols'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!/^[a-z0-9%A-Z.-]{1,100}$/.test(slug)) {
    return NextResponse.json({ error: 'partido inválido' }, { status: 400 })
  }
  const party = decodeURIComponent(slug).toUpperCase()
  const limit = Math.max(1, Math.min(100, Number(request.nextUrl.searchParams.get('limite')) || 30))

  const supabase = getSupabaseServiceClient()
  const { data: pols } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name, state, role, photo_url')
    .eq('is_active', true)
    .eq('party', party)
    .limit(500)

  type Pol = { id: string; slug: string; common_name: string; state: string | null; role: string | null; photo_url: string | null }
  const all = (pols ?? []) as Pol[]
  const ids = all.map((p) => p.id)

  const counts = new Map<string, number>()
  if (ids.length > 0) {
    const { data: rows } = await (supabase.from('statements') as any)
      .select('politician_id')
      .eq('verification_status', 'verified')
      .in('politician_id', ids)
      .limit(30000)
    for (const r of ((rows ?? []) as Array<{ politician_id: string }>)) {
      counts.set(r.politician_id, (counts.get(r.politician_id) ?? 0) + 1)
    }
  }

  const top = all
    .map((p) => ({
      slug: p.slug, common_name: p.common_name, state: p.state, role: p.role,
      photo_url: p.photo_url,
      verified_count: counts.get(p.id) ?? 0,
      url: `${SITE_URL}/politico/${p.slug}`,
    }))
    .sort((a, b) => b.verified_count - a.verified_count)
    .slice(0, limit)

  const etag = `W/"pt-pols-${party}-${all.length}-${top.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    party,
    url: `${SITE_URL}/partidos/${encodeURIComponent(party)}`,
    total_active_politicians: all.length,
    top,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
