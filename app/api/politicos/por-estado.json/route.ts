import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { BRAZIL_TILES } from '@/lib/maps/brazil-tile'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/politicos/por-estado.json — active-politician counts
 * aggregated by UF. Shape: `{ uf, name, region, count, url }[]`
 * sorted by count desc. Includes every UF in `BRAZIL_TILES`, even
 * those with zero active politicians, so clients can render a
 * complete map without post-merge.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'pol-por-estado'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('politicians') as any)
    .select('state')
    .eq('is_active', true)
    .not('state', 'is', null)
    .limit(20000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { state: string | null }
  const counts = new Map<string, number>()
  for (const r of ((data ?? []) as Row[])) {
    if (!r.state) continue
    const uf = r.state.toUpperCase()
    counts.set(uf, (counts.get(uf) ?? 0) + 1)
  }

  const results = BRAZIL_TILES.map((t) => ({
    uf: t.uf,
    name: t.name,
    region: t.region,
    count: counts.get(t.uf) ?? 0,
    url: `${SITE_URL}/estados/${t.uf}`,
  })).sort((a, b) => b.count - a.count)

  const total = results.reduce((s, r) => s + r.count, 0)
  const etag = `W/"pol-por-estado-${total}-${results.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    total,
    count: results.length,
    results,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
