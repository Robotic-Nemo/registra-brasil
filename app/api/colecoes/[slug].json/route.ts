import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/colecoes/:slug.json — machine-readable detail for a
 * published editorial collection. Mirrors the public /colecao/:slug
 * page but shaped for clients that want structured JSON rather
 * than the feed shape in /colecao/:slug/feed.json.
 */
interface Params { params: Promise<{ slug: string }> }

export async function GET(request: NextRequest, { params }: Params) {
  const rl = checkRateLimit(getRateLimitKey(request, 'colecao-json'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }

  const supabase = getSupabaseServiceClient()
  const { data: col } = await (supabase.from('collections') as any)
    .select('id, slug, title, subtitle, description, cover_image_url, published_at, created_at, updated_at')
    .eq('slug', slug).eq('is_published', true).maybeSingle()
  if (!col) return NextResponse.json({ error: 'not_found', slug }, { status: 404 })

  const c = col as {
    id: string; slug: string; title: string; subtitle: string | null
    description: string | null; cover_image_url: string | null
    published_at: string | null; created_at: string; updated_at: string | null
  }

  const { data: rows } = await (supabase.from('collection_statements') as any)
    .select('position, statements!inner(id, slug, summary, statement_date, severity_score, verification_status, politicians!inner(slug, common_name, party, state))')
    .eq('collection_id', c.id)
    .order('position', { ascending: true })
    .limit(500)

  type Stmt = {
    id: string; slug: string | null; summary: string; statement_date: string
    severity_score: number | null; verification_status: string
    politicians: { slug: string; common_name: string; party: string | null; state: string | null }
  }
  const items = ((rows ?? []) as Array<{ position: number; statements: Stmt | null }>)
    .filter((r) => r.statements)
    .map((r) => {
      const s = r.statements!
      return {
        position: r.position,
        id: s.id,
        slug: s.slug,
        summary: s.summary,
        statement_date: s.statement_date,
        severity_score: s.severity_score,
        verification_status: s.verification_status,
        politician: {
          slug: s.politicians.slug,
          common_name: s.politicians.common_name,
          party: s.politicians.party,
          state: s.politicians.state,
          url: `${SITE_URL}/politico/${s.politicians.slug}`,
        },
        permalink: `${SITE_URL}/declaracao/${s.slug ?? s.id}`,
      }
    })

  const body = {
    slug: c.slug,
    title: c.title,
    subtitle: c.subtitle,
    description: c.description,
    cover_image_url: c.cover_image_url,
    published_at: c.published_at,
    created_at: c.created_at,
    updated_at: c.updated_at ?? c.created_at,
    url: `${SITE_URL}/colecao/${c.slug}`,
    count: items.length,
    items,
  }

  const etag = `W/"col-${c.slug}-${items.length}-${(c.updated_at ?? c.created_at).replace(/\D/g, '')}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json(body, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
      ETag: etag,
    },
  })
}
