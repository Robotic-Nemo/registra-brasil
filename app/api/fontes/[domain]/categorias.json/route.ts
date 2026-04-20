import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { displaySourceName } from '@/lib/sources/domain'
import { sourceUrlOrFilter, DOMAIN_RE_STRICT } from '@/lib/sources/domain-filter'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const DOMAIN_RE = /^[a-z0-9%.-]{3,253}$/i

/**
 * GET /api/fontes/:domain/categorias.json — ranked categories cited
 * alongside this source domain. Uses the `statement_categories`
 * pivot joined to `statements` filtered by the domain `.or()` chunk.
 *   ?limite=1..50 (default 20)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ domain: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'fontes-cats'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { domain: raw } = await params
  if (!DOMAIN_RE.test(raw)) {
    return NextResponse.json({ error: 'domínio inválido' }, { status: 400 })
  }
  const domain = decodeURIComponent(raw).toLowerCase().replace(/^www\./, '')
  if (!DOMAIN_RE_STRICT.test(domain)) {
    return NextResponse.json({ error: 'domínio inválido' }, { status: 400 })
  }
  const limit = Math.max(1, Math.min(50, Number(request.nextUrl.searchParams.get('limite')) || 20))

  const supabase = getSupabaseServiceClient()
  // We can't pass `.or()` through a !inner join cleanly, so fetch
  // matching statement IDs first (thin), then pivot rows.
  const { data: stRows, error: stErr } = await (supabase.from('statements') as any)
    .select('id')
    .neq('verification_status', 'removed')
    .or(sourceUrlOrFilter(domain))
    .limit(10000)
  if (stErr) return NextResponse.json({ error: stErr.message }, { status: 500 })

  type Stmt = { id: string }
  const ids = ((stRows ?? []) as Stmt[]).map((r) => r.id)
  if (ids.length === 0) {
    return NextResponse.json({
      domain,
      display_name: displaySourceName(domain),
      url: `${SITE_URL}/fontes/${encodeURIComponent(domain)}`,
      total: 0,
      categorias: [],
      generated_at: new Date().toISOString(),
    }, {
      headers: {
        'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      },
    })
  }

  const { data, error } = await (supabase.from('statement_categories') as any)
    .select('is_primary, categories!inner(slug, label_pt, color_hex)')
    .in('statement_id', ids)
    .limit(30000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { is_primary: boolean; categories: { slug: string; label_pt: string; color_hex: string | null } | null }
  const tally = new Map<string, { slug: string; label: string; color: string | null; primary: number; total: number }>()
  for (const r of (data ?? []) as Row[]) {
    const c = r.categories
    if (!c) continue
    const cur = tally.get(c.slug) ?? { slug: c.slug, label: c.label_pt, color: c.color_hex, primary: 0, total: 0 }
    cur.total++
    if (r.is_primary) cur.primary++
    tally.set(c.slug, cur)
  }

  const categorias = [...tally.values()]
    .sort((a, b) => b.total - a.total)
    .slice(0, limit)
    .map((c) => ({ ...c, url: `${SITE_URL}/categorias/${c.slug}` }))

  const etag = `W/"fontes-cats-${domain}-${limit}-${ids.length}-${tally.size}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    domain,
    display_name: displaySourceName(domain),
    url: `${SITE_URL}/fontes/${encodeURIComponent(domain)}`,
    total: ids.length,
    unique_categories: tally.size,
    categorias,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
