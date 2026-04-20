import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/categorias/:slug/politicos.json — top-N politicians in
 * a category by count of non-removed statements tagged with it
 * (as primary or secondary). Default N=20, max 100.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'cat-pols'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const limit = Math.max(1, Math.min(100, Number(request.nextUrl.searchParams.get('limite')) || 20))

  const supabase = getSupabaseServiceClient()
  const { data: cat } = await (supabase.from('categories') as any)
    .select('id, slug, label_pt, color_hex')
    .eq('slug', slug)
    .maybeSingle()
  if (!cat) {
    return NextResponse.json({ error: 'Categoria não encontrada' }, { status: 404 })
  }

  const { data: rows } = await (supabase.from('statement_categories') as any)
    .select('statements!inner(politician_id, verification_status, politicians!inner(slug, common_name, party, state, photo_url))')
    .eq('category_id', cat.id)
    .limit(20000)

  type Row = {
    statements: {
      politician_id: string
      verification_status: string
      politicians: { slug: string; common_name: string; party: string | null; state: string | null; photo_url: string | null } | null
    } | null
  }
  const tally = new Map<string, {
    slug: string; common_name: string; party: string | null; state: string | null
    photo_url: string | null; count: number
  }>()
  for (const r of ((rows ?? []) as Row[])) {
    const s = r.statements
    if (!s || s.verification_status === 'removed' || !s.politicians) continue
    const e = tally.get(s.politician_id)
    if (e) e.count++
    else tally.set(s.politician_id, { ...s.politicians, count: 1 })
  }

  const top = [...tally.values()]
    .sort((a, b) => b.count - a.count)
    .slice(0, limit)
    .map((p) => ({ ...p, url: `${SITE_URL}/politico/${p.slug}` }))

  const etag = `W/"cpols-${cat.id.slice(0, 8)}-${tally.size}-${top.length}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    category: {
      slug: cat.slug, label: cat.label_pt, color: cat.color_hex,
      url: `${SITE_URL}/categorias/${cat.slug}`,
    },
    total_politicians: tally.size,
    top,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
