import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { extractDomain } from '@/lib/sources/domain'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const UF_RE = /^[A-Za-z]{2}$/

/**
 * GET /api/estados/:uf/sources.json — top domains + source-type
 * breakdown for statements by politicians of a UF.
 *   ?limite=1..50 (default 25)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ uf: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'uf-sources'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { uf: raw } = await params
  if (!UF_RE.test(raw)) {
    return NextResponse.json({ error: 'UF inválida' }, { status: 400 })
  }
  const uf = raw.toUpperCase()
  const limit = Math.max(1, Math.min(50, Number(request.nextUrl.searchParams.get('limite')) || 25))

  const supabase = getSupabaseServiceClient()
  const { data: rows } = await (supabase.from('statements') as any)
    .select('primary_source_url, primary_source_type, politicians!inner(state)')
    .eq('politicians.state', uf)
    .neq('verification_status', 'removed')
    .limit(20000)

  type Row = { primary_source_url: string | null; primary_source_type: string | null }
  const all = (rows ?? []) as Row[]

  const domainCounts = new Map<string, number>()
  const typeCounts = new Map<string, number>()
  let withUrl = 0
  for (const r of all) {
    const d = extractDomain(r.primary_source_url)
    if (d) { domainCounts.set(d, (domainCounts.get(d) ?? 0) + 1); withUrl++ }
    const t = r.primary_source_type ?? 'unknown'
    typeCounts.set(t, (typeCounts.get(t) ?? 0) + 1)
  }

  const topDomains = [...domainCounts.entries()]
    .sort((a, b) => b[1] - a[1])
    .slice(0, limit)
    .map(([domain, count]) => ({ domain, count, share: +(count / Math.max(1, withUrl)).toFixed(3) }))

  const etag = `W/"ufsr-${uf}-${all.length}-${domainCounts.size}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    uf,
    url: `${SITE_URL}/estados/${uf.toLowerCase()}`,
    total_statements: all.length,
    total_with_source_url: withUrl,
    unique_domains: domainCounts.size,
    top_domains: topDomains,
    source_types: [...typeCounts.entries()].sort((a, b) => b[1] - a[1]).map(([type, count]) => ({ type, count })),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
