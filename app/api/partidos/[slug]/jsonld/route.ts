import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SITE_NAME = 'Registra Brasil'
const PARTY_RE = /^[a-z0-9%A-Z.-]{1,100}$/

/**
 * GET /api/partidos/:slug/jsonld — schema.org Organization +
 * CollectionPage JSON-LD graph for a political party. Dimensions
 * (active politician count, verified statement count) embedded as
 * structured data.
 */
interface Params { params: Promise<{ slug: string }> }

export async function GET(request: NextRequest, { params }: Params) {
  const rl = checkRateLimit(getRateLimitKey(request, 'partido-jsonld'), {
    limit: 120, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!PARTY_RE.test(slug)) {
    return NextResponse.json({ error: 'slug inválido' }, { status: 400 })
  }
  const party = decodeURIComponent(slug)
  if (!party || party.length > 30) {
    return NextResponse.json({ error: 'party inválido' }, { status: 400 })
  }

  const supabase = getSupabaseServiceClient()

  // Parallel builder factory — supabase-js mutates.
  const politiciansQuery = (supabase.from('politicians') as any)
    .select('id', { count: 'exact', head: true })
    .eq('party', party)
    .eq('is_active', true)

  const statementsQuery = (supabase.from('statements') as any)
    .select('id, politicians!inner(party, is_active)', { count: 'exact', head: true })
    .eq('verification_status', 'verified')
    .eq('politicians.party', party)
    .eq('politicians.is_active', true)

  const [pRes, sRes] = await Promise.all([politiciansQuery, statementsQuery])

  const politicianCount = pRes.count ?? 0
  const statementCount = sRes.count ?? 0

  if (politicianCount === 0 && statementCount === 0) {
    return NextResponse.json({ error: 'not_found', party }, { status: 404 })
  }

  const partyUrl = `${SITE_URL}/partidos/${encodeURIComponent(party)}`
  const publisher = {
    '@type': 'Organization',
    name: SITE_NAME,
    url: SITE_URL,
    logo: `${SITE_URL}/favicon.svg`,
  }

  const jsonld = {
    '@context': 'https://schema.org',
    '@graph': [
      {
        '@type': 'Organization',
        '@id': `${partyUrl}#org`,
        name: party,
        url: partyUrl,
        additionalType: 'PoliticalParty',
        areaServed: { '@type': 'Country', name: 'Brasil' },
        numberOfEmployees: politicianCount,
      },
      {
        '@type': 'CollectionPage',
        '@id': `${partyUrl}#page`,
        url: partyUrl,
        inLanguage: 'pt-BR',
        name: `${party} no ${SITE_NAME}`,
        description: `Perfil do partido ${party} com ${statementCount} declarações verificadas de ${politicianCount} políticos ativos registrados.`,
        about: { '@id': `${partyUrl}#org` },
        publisher,
        mainEntity: {
          '@type': 'ItemList',
          numberOfItems: statementCount,
        },
      },
    ],
  }

  const etag = `W/"partido-jsonld-${party}-${politicianCount}-${statementCount}"`
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
