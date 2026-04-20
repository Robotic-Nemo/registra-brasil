import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const UF_RE = /^[A-Za-z]{2}$/

/**
 * GET /api/estados/:uf/politicos.json — active politicians of a UF
 * ranked by verified-statement count. Mirrors partidos/politicos.json.
 *   ?limite=1..100 (default 30)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ uf: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'uf-pols'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { uf: raw } = await params
  if (!UF_RE.test(raw)) {
    return NextResponse.json({ error: 'UF inválida' }, { status: 400 })
  }
  const uf = raw.toUpperCase()
  const limit = Math.max(1, Math.min(100, Number(request.nextUrl.searchParams.get('limite')) || 30))

  const supabase = getSupabaseServiceClient()
  const { data: pols } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name, party, role, photo_url')
    .eq('is_active', true)
    .eq('state', uf)
    .limit(500)

  type Pol = { id: string; slug: string; common_name: string; party: string | null; role: string | null; photo_url: string | null }
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
      slug: p.slug, common_name: p.common_name, party: p.party, role: p.role,
      photo_url: p.photo_url,
      verified_count: counts.get(p.id) ?? 0,
      url: `${SITE_URL}/politico/${p.slug}`,
    }))
    .sort((a, b) => b.verified_count - a.verified_count)
    .slice(0, limit)

  const etag = `W/"uf-pols-${uf}-${all.length}-${top.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    uf,
    url: `${SITE_URL}/estados/${uf.toLowerCase()}`,
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
