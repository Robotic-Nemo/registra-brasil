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
 * GET /api/fontes/:domain/politicos.json — top politicians whose
 * statements cite this source domain, ranked by citation count.
 *   ?limite=1..50 (default 20)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ domain: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'fontes-politicos'), {
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
  const { data, error } = await (supabase.from('statements') as any)
    .select('politician_id, politicians!inner(slug, common_name, party, state)')
    .neq('verification_status', 'removed')
    .or(sourceUrlOrFilter(domain))
    .limit(10000)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = {
    politician_id: string
    politicians: { slug: string; common_name: string; party: string | null; state: string | null } | null
  }
  const rows = (data ?? []) as Row[]

  const byPol = new Map<string, { slug: string; common_name: string; party: string | null; state: string | null; count: number }>()
  for (const r of rows) {
    if (!r.politicians) continue
    const k = r.politicians.slug
    const cur = byPol.get(k)
    if (cur) cur.count++
    else byPol.set(k, { ...r.politicians, count: 1 })
  }

  const top = [...byPol.values()]
    .sort((a, b) => b.count - a.count)
    .slice(0, limit)
    .map((p) => ({ ...p, url: `${SITE_URL}/politico/${p.slug}` }))

  const etag = `W/"fontes-politicos-${domain}-${limit}-${rows.length}-${byPol.size}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    domain,
    display_name: displaySourceName(domain),
    url: `${SITE_URL}/fontes/${encodeURIComponent(domain)}`,
    total_citations: rows.length,
    unique_politicians: byPol.size,
    politicos: top,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
