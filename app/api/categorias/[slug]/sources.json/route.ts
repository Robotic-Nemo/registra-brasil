import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { extractDomain } from '@/lib/sources/domain'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/categorias/:slug/sources.json — top source domains + type
 * breakdown across statements tagged with a category.
 *   ?limite=1..50 (default 25)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'cat-sources'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const limit = Math.max(1, Math.min(50, Number(request.nextUrl.searchParams.get('limite')) || 25))

  const supabase = getSupabaseServiceClient()
  const { data: cat } = await (supabase.from('categories') as any)
    .select('id, slug, label_pt, color_hex')
    .eq('slug', slug)
    .maybeSingle()
  if (!cat) {
    return NextResponse.json({ error: 'Categoria não encontrada' }, { status: 404 })
  }

  // Pull statement_ids tagged with this category, capped.
  const { data: scRows } = await (supabase.from('statement_categories') as any)
    .select('statement_id')
    .eq('category_id', cat.id)
    .limit(20000)
  const stmtIds = [...new Set(((scRows ?? []) as Array<{ statement_id: string }>).map((r) => r.statement_id))]

  const domainCounts = new Map<string, number>()
  const typeCounts = new Map<string, number>()
  let total = 0
  let withUrl = 0

  // Chunk IN() to keep URL under PostgREST limits.
  const CHUNK = 500
  for (let i = 0; i < stmtIds.length; i += CHUNK) {
    const slice = stmtIds.slice(i, i + CHUNK)
    const { data: rows } = await (supabase.from('statements') as any)
      .select('primary_source_url, primary_source_type')
      .in('id', slice)
      .neq('verification_status', 'removed')
      .limit(CHUNK)
    for (const r of ((rows ?? []) as Array<{ primary_source_url: string | null; primary_source_type: string | null }>)) {
      total++
      const d = extractDomain(r.primary_source_url)
      if (d) { domainCounts.set(d, (domainCounts.get(d) ?? 0) + 1); withUrl++ }
      const t = r.primary_source_type ?? 'unknown'
      typeCounts.set(t, (typeCounts.get(t) ?? 0) + 1)
    }
  }

  const topDomains = [...domainCounts.entries()]
    .sort((a, b) => b[1] - a[1])
    .slice(0, limit)
    .map(([domain, count]) => ({ domain, count, share: +(count / Math.max(1, withUrl)).toFixed(3) }))

  const etag = `W/"catsr-${cat.id.slice(0, 8)}-${total}-${domainCounts.size}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    category: {
      slug: cat.slug, label: cat.label_pt, color: cat.color_hex,
      url: `${SITE_URL}/categorias/${cat.slug}`,
    },
    total_statements: total,
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
