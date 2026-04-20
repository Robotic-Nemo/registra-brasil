import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { BRAZIL_TILES } from '@/lib/maps/brazil-tile'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SITE_NAME = 'Registra Brasil'
const UF_RE = /^[A-Za-z]{2}$/

/**
 * GET /api/estados/:uf/jsonld — schema.org AdministrativeArea +
 * CollectionPage graph for a Brazilian state. Completes the scope
 * JSON-LD set (politico, partido, categoria, estado) so SEO can
 * pick up structured data on any scope page.
 */
interface Params { params: Promise<{ uf: string }> }

export async function GET(request: NextRequest, { params }: Params) {
  const rl = checkRateLimit(getRateLimitKey(request, 'estado-jsonld'), {
    limit: 120, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { uf: raw } = await params
  if (!UF_RE.test(raw)) {
    return NextResponse.json({ error: 'uf inválida' }, { status: 400 })
  }
  const uf = raw.toUpperCase()
  const tile = BRAZIL_TILES.find((t) => t.uf === uf)
  if (!tile) {
    return NextResponse.json({ error: 'uf desconhecida', uf }, { status: 404 })
  }

  const supabase = getSupabaseServiceClient()
  const politiciansQuery = (supabase.from('politicians') as any)
    .select('id', { count: 'exact', head: true })
    .eq('state', uf)
    .eq('is_active', true)
  const statementsQuery = (supabase.from('statements') as any)
    .select('id, politicians!inner(state)', { count: 'exact', head: true })
    .eq('verification_status', 'verified')
    .eq('politicians.state', uf)

  const [pRes, sRes] = await Promise.all([politiciansQuery, statementsQuery])
  const politicianCount = pRes.count ?? 0
  const statementCount = sRes.count ?? 0

  const stateUrl = `${SITE_URL}/estados/${uf.toLowerCase()}`
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
        '@type': 'AdministrativeArea',
        '@id': `${stateUrl}#area`,
        name: tile.name,
        alternateName: uf,
        url: stateUrl,
        identifier: uf,
        addressCountry: 'BR',
        containedInPlace: {
          '@type': 'Country',
          name: 'Brasil',
          addressCountry: 'BR',
        },
        areaServed: tile.region,
      },
      {
        '@type': 'CollectionPage',
        '@id': `${stateUrl}#page`,
        url: stateUrl,
        inLanguage: 'pt-BR',
        name: `${tile.name} — ${SITE_NAME}`,
        description: `Perfil do estado ${tile.name} (${uf}) com ${statementCount} declarações verificadas de ${politicianCount} políticos ativos registrados.`,
        about: { '@id': `${stateUrl}#area` },
        publisher,
        mainEntity: {
          '@type': 'ItemList',
          numberOfItems: statementCount,
        },
      },
    ],
  }

  const etag = `W/"estado-jsonld-${uf}-${politicianCount}-${statementCount}"`
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
