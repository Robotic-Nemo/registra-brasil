import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/categorias/:slug/partidos.json — party breakdown inside
 * a category. Useful for "who talks about X most" style cards.
 *   ?limite=1..100 (default 30)
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'cat-parties'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const limit = Math.max(1, Math.min(100, Number(request.nextUrl.searchParams.get('limite')) || 30))

  const supabase = getSupabaseServiceClient()
  const { data: cat } = await (supabase.from('categories') as any)
    .select('id, slug, label_pt, color_hex')
    .eq('slug', slug)
    .maybeSingle()
  if (!cat) {
    return NextResponse.json({ error: 'Categoria não encontrada' }, { status: 404 })
  }

  const { data: rows } = await (supabase.from('statement_categories') as any)
    .select('statements!inner(verification_status, politicians!inner(party))')
    .eq('category_id', cat.id)
    .limit(30000)

  type Row = {
    statements: {
      verification_status: string
      politicians: { party: string | null } | null
    } | null
  }
  const tally = new Map<string, number>()
  let total = 0
  for (const r of ((rows ?? []) as Row[])) {
    const s = r.statements
    if (!s || s.verification_status === 'removed') continue
    const p = s.politicians?.party
    if (!p) continue
    tally.set(p, (tally.get(p) ?? 0) + 1)
    total++
  }

  const top = [...tally.entries()]
    .sort((a, b) => b[1] - a[1])
    .slice(0, limit)
    .map(([party, count]) => ({
      party, count,
      share: +(count / Math.max(1, total)).toFixed(3),
      url: `${SITE_URL}/partidos/${encodeURIComponent(party)}`,
    }))

  const etag = `W/"cat-pt-${cat.id.slice(0, 8)}-${total}-${tally.size}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    category: {
      slug: cat.slug, label: cat.label_pt, color: cat.color_hex,
      url: `${SITE_URL}/categorias/${cat.slug}`,
    },
    total_statements: total,
    unique_parties: tally.size,
    top,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
