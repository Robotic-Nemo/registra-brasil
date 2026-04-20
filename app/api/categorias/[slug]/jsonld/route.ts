import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SITE_NAME = 'Registra Brasil'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/categorias/:slug/jsonld — schema.org DefinedTerm +
 * CollectionPage JSON-LD graph for a category. Links the term to
 * the DefinedTermSet "Categorias editoriais" and reports statement
 * count as structured data.
 */
interface Params { params: Promise<{ slug: string }> }

export async function GET(request: NextRequest, { params }: Params) {
  const rl = checkRateLimit(getRateLimitKey(request, 'cat-jsonld'), {
    limit: 120, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }

  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('categories') as any)
    .select('id, slug, label_pt, label_en, description, color_hex, severity, parent_id, created_at, updated_at')
    .eq('slug', slug)
    .maybeSingle()

  if (!data) return NextResponse.json({ error: 'not_found', slug }, { status: 404 })

  const c = data as {
    id: string; slug: string; label_pt: string; label_en: string | null
    description: string | null; color_hex: string | null; severity: number | null
    parent_id: string | null; created_at: string; updated_at: string | null
  }

  // Head-count of non-removed statements tagged primary for this
  // category. Matches the count surfaced by /api/v2/categories/:slug.
  const { count } = await (supabase.from('statement_categories') as any)
    .select('statement_id, statements!inner(verification_status)', { count: 'exact', head: true })
    .eq('category_id', c.id)
    .eq('is_primary', true)
    .neq('statements.verification_status', 'removed')

  const statementCount = count ?? 0
  const categoryUrl = `${SITE_URL}/categorias/${c.slug}`
  const publisher = {
    '@type': 'Organization',
    name: SITE_NAME,
    url: SITE_URL,
    logo: `${SITE_URL}/favicon.svg`,
  }

  const term: Record<string, unknown> = {
    '@type': 'DefinedTerm',
    '@id': `${categoryUrl}#term`,
    name: c.label_pt,
    url: categoryUrl,
    inLanguage: 'pt-BR',
    inDefinedTermSet: {
      '@type': 'DefinedTermSet',
      '@id': `${SITE_URL}/categorias#set`,
      name: 'Categorias editoriais — Registra Brasil',
      url: `${SITE_URL}/categorias`,
    },
  }
  if (c.label_en) term.alternateName = c.label_en
  if (c.description) term.description = c.description
  if (c.color_hex) term.color = c.color_hex

  const jsonld = {
    '@context': 'https://schema.org',
    '@graph': [
      term,
      {
        '@type': 'CollectionPage',
        '@id': `${categoryUrl}#page`,
        url: categoryUrl,
        inLanguage: 'pt-BR',
        name: `${c.label_pt} — ${SITE_NAME}`,
        description: c.description ?? `Declarações categorizadas como "${c.label_pt}" no Registra Brasil.`,
        about: { '@id': `${categoryUrl}#term` },
        publisher,
        dateCreated: c.created_at,
        dateModified: c.updated_at ?? c.created_at,
        mainEntity: {
          '@type': 'ItemList',
          numberOfItems: statementCount,
        },
      },
    ],
  }

  const etag = `W/"cat-jsonld-${c.slug}-${statementCount}-${(c.updated_at ?? c.created_at).replace(/\D/g, '')}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json(jsonld, {
    headers: {
      'Content-Type': 'application/ld+json; charset=utf-8',
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
