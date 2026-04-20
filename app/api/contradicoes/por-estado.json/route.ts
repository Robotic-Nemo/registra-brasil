import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/contradicoes/por-estado.json — published contradiction
 * pairs aggregated by the politician's UF. `{ state, count, url }[]`,
 * ordered by count desc.
 *
 *   ?limite=1..27 (default 27)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'contra-estado'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const lim = Math.max(1, Math.min(27, Number(request.nextUrl.searchParams.get('limite')) || 27))

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('contradiction_pairs') as any)
    .select('id, politicians!contradiction_pairs_politician_id_fkey(state)')
    .eq('is_published', true)
    .limit(5000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { id: string; politicians: { state: string | null } | null }
  const rows = (data ?? []) as Row[]
  const counts = new Map<string, number>()
  for (const r of rows) {
    const uf = r.politicians?.state
    if (!uf) continue
    counts.set(uf, (counts.get(uf) ?? 0) + 1)
  }
  const results = Array.from(counts.entries())
    .map(([state, count]) => ({
      state,
      count,
      url: `${SITE_URL}/estados/${state.toLowerCase()}`,
    }))
    .sort((a, b) => b.count - a.count)
    .slice(0, lim)

  const etag = `W/"contra-uf-${lim}-${rows.length}-${results.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    count: results.length,
    total_pairs: rows.length,
    results,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
      ETag: etag,
    },
  })
}
