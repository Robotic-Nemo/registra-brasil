import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { extractDomain } from '@/lib/sources/domain'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/politico/:slug/sources.json — top source domains + source
 * type breakdown for a politician's statements. Useful to show
 * "coverage sources" or to audit source diversity.
 *   ?limite=1..50 (default 20) — top N domains returned.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'pol-sources'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const limit = Math.max(1, Math.min(50, Number(request.nextUrl.searchParams.get('limite')) || 20))

  const supabase = getSupabaseServiceClient()
  const { data: p } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name')
    .eq('slug', slug)
    .maybeSingle()
  if (!p) {
    return NextResponse.json({ error: 'Político não encontrado' }, { status: 404 })
  }

  const { data: rows } = await (supabase.from('statements') as any)
    .select('primary_source_url, primary_source_type')
    .eq('politician_id', p.id)
    .neq('verification_status', 'removed')
    .limit(20000)

  type Row = { primary_source_url: string | null; primary_source_type: string | null }
  const all = (rows ?? []) as Row[]

  const domainCounts = new Map<string, number>()
  const typeCounts = new Map<string, number>()
  let totalWithUrl = 0
  for (const r of all) {
    const d = extractDomain(r.primary_source_url)
    if (d) {
      domainCounts.set(d, (domainCounts.get(d) ?? 0) + 1)
      totalWithUrl++
    }
    const t = r.primary_source_type ?? 'unknown'
    typeCounts.set(t, (typeCounts.get(t) ?? 0) + 1)
  }

  const topDomains = [...domainCounts.entries()]
    .sort((a, b) => b[1] - a[1])
    .slice(0, limit)
    .map(([domain, count]) => ({ domain, count, share: +(count / Math.max(1, totalWithUrl)).toFixed(3) }))

  const sourceTypes = [...typeCounts.entries()]
    .sort((a, b) => b[1] - a[1])
    .map(([type, count]) => ({ type, count }))

  const etag = `W/"psr-${p.id.slice(0, 8)}-${all.length}-${domainCounts.size}-${typeCounts.size}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    politician: {
      slug: p.slug, common_name: p.common_name,
      url: `${SITE_URL}/politico/${p.slug}`,
    },
    total_statements: all.length,
    total_with_source_url: totalWithUrl,
    unique_domains: domainCounts.size,
    top_domains: topDomains,
    source_types: sourceTypes,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
