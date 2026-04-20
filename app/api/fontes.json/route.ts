import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { extractDomain } from '@/lib/sources/domain'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/fontes.json — global catalog of source domains ranked by
 * number of non-removed statements citing them. Mirrors the /fontes
 * HTML page as a data feed for directory/admin integrations.
 *   ?limite=1..500 (default 100)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'fontes-json'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const limit = Math.max(1, Math.min(500, Number(request.nextUrl.searchParams.get('limite')) || 100))

  const supabase = getSupabaseServiceClient()
  const { data: rows } = await (supabase.from('statements') as any)
    .select('primary_source_url, primary_source_type')
    .neq('verification_status', 'removed')
    .limit(50000)

  type Row = { primary_source_url: string | null; primary_source_type: string | null }
  const domainCounts = new Map<string, number>()
  const domainTypes = new Map<string, Map<string, number>>()
  const typeCounts = new Map<string, number>()
  let total = 0
  let withUrl = 0
  for (const r of ((rows ?? []) as Row[])) {
    total++
    const t = r.primary_source_type ?? 'unknown'
    typeCounts.set(t, (typeCounts.get(t) ?? 0) + 1)
    const d = extractDomain(r.primary_source_url)
    if (!d) continue
    withUrl++
    domainCounts.set(d, (domainCounts.get(d) ?? 0) + 1)
    const tm = domainTypes.get(d) ?? new Map<string, number>()
    tm.set(t, (tm.get(t) ?? 0) + 1)
    domainTypes.set(d, tm)
  }

  const top = [...domainCounts.entries()]
    .sort((a, b) => b[1] - a[1])
    .slice(0, limit)
    .map(([domain, count]) => {
      const tm = domainTypes.get(domain)!
      const dominantType = [...tm.entries()].sort((a, b) => b[1] - a[1])[0]?.[0] ?? 'unknown'
      return {
        domain, count,
        share: +(count / Math.max(1, withUrl)).toFixed(4),
        dominant_type: dominantType,
        url: `${SITE_URL}/fontes/${encodeURIComponent(domain)}`,
      }
    })

  const etag = `W/"fontes-${total}-${domainCounts.size}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    total_statements: total,
    total_with_source_url: withUrl,
    unique_domains: domainCounts.size,
    source_types: [...typeCounts.entries()].sort((a, b) => b[1] - a[1]).map(([type, count]) => ({ type, count })),
    top_domains: top,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
