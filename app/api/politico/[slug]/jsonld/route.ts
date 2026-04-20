import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SITE_NAME = 'Registra Brasil'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/politico/:slug/jsonld — schema.org Person JSON-LD with
 * a subjectOf ProfilePage node so search engines can connect the
 * politician page to structured data.
 */
interface Params { params: Promise<{ slug: string }> }

export async function GET(request: NextRequest, { params }: Params) {
  const rl = checkRateLimit(getRateLimitKey(request, 'politico-jsonld'), {
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
  const { data } = await (supabase.from('politicians') as any)
    .select('slug, common_name, full_name, party, state, role, bio, photo_url, birth_date, created_at, updated_at')
    .eq('slug', slug)
    .maybeSingle()

  if (!data) return NextResponse.json({ error: 'not_found', slug }, { status: 404 })

  const p = data as {
    slug: string; common_name: string; full_name: string | null
    party: string | null; state: string | null; role: string | null
    bio: string | null; photo_url: string | null; birth_date: string | null
    created_at: string; updated_at: string | null
  }

  const profileUrl = `${SITE_URL}/politico/${p.slug}`
  const publisher = {
    '@type': 'Organization',
    name: SITE_NAME,
    url: SITE_URL,
    logo: `${SITE_URL}/favicon.svg`,
  }

  const person: Record<string, unknown> = {
    '@type': 'Person',
    '@id': profileUrl,
    name: p.common_name,
    url: profileUrl,
  }
  if (p.full_name && p.full_name !== p.common_name) person.alternateName = p.full_name
  if (p.role) person.jobTitle = p.role
  if (p.party) person.affiliation = { '@type': 'Organization', name: p.party }
  if (p.photo_url) person.image = p.photo_url
  if (p.bio) person.description = p.bio
  if (p.birth_date) person.birthDate = p.birth_date
  if (p.state) {
    person.homeLocation = { '@type': 'AdministrativeArea', name: p.state, addressCountry: 'BR' }
  }

  const jsonld = {
    '@context': 'https://schema.org',
    '@graph': [
      {
        '@type': 'ProfilePage',
        '@id': `${profileUrl}#profile`,
        url: profileUrl,
        inLanguage: 'pt-BR',
        dateCreated: p.created_at,
        dateModified: p.updated_at ?? p.created_at,
        mainEntity: { '@id': profileUrl },
        publisher,
      },
      person,
    ],
  }

  const etag = `W/"politico-jsonld-${p.slug}-${(p.updated_at ?? p.created_at).replace(/\D/g, '')}"`
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
