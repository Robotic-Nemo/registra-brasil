import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { displaySourceName, classifySource, CATEGORY_LABEL } from '@/lib/sources/domain'
import { sourceUrlOrFilter } from '@/lib/sources/domain-filter'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SITE_NAME = 'Registra Brasil'
const DOMAIN_RE = /^[a-z0-9%.-]{3,253}$/i

/**
 * GET /api/fontes/:domain/jsonld — schema.org WebSite +
 * CollectionPage JSON-LD for a source domain. Reports how many
 * verified statements cite that domain.
 */
interface Params { params: Promise<{ domain: string }> }

export async function GET(request: NextRequest, { params }: Params) {
  const rl = checkRateLimit(getRateLimitKey(request, 'fontes-jsonld'), {
    limit: 120, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { domain: raw } = await params
  if (!DOMAIN_RE.test(raw)) {
    return NextResponse.json({ error: 'domínio inválido' }, { status: 400 })
  }
  const domain = decodeURIComponent(raw).toLowerCase().replace(/^www\./, '')
  // Re-gate post-decode to keep `%` / `_` / grammar chars out of the
  // `.or(...)` interpolation below. Real DNS hosts can only use
  // `[a-z0-9.-]` — anything else would have been URL-encoded by a
  // well-behaved client.
  if (!/^[a-z0-9.-]{3,253}$/i.test(domain)) {
    return NextResponse.json({ error: 'domínio inválido' }, { status: 400 })
  }

  const supabase = getSupabaseServiceClient()
  // Count verified statements whose primary_source_url host matches
  // the requested domain. PostgREST has no direct host extractor so
  // we match on a pattern — `//<domain>` (after scheme) or `://www.<domain>`
  // to cover both variants.
  const { count } = await (supabase.from('statements') as any)
    .select('id', { count: 'exact', head: true })
    .eq('verification_status', 'verified')
    .or(sourceUrlOrFilter(domain))

  const statementCount = count ?? 0
  const displayName = displaySourceName(domain)
  const classification = classifySource(domain)
  const domainUrl = `${SITE_URL}/fontes/${encodeURIComponent(domain)}`
  const publisher = {
    '@type': 'Organization',
    name: SITE_NAME,
    url: SITE_URL,
    logo: `${SITE_URL}/favicon.svg`,
  }

  // Map our internal classification to a schema.org type when possible.
  const siteType = classification === 'oficial' ? 'GovernmentOrganization'
    : classification === 'imprensa' ? 'NewsMediaOrganization'
    : classification === 'video' ? 'WebSite'
    : classification === 'social' ? 'WebSite'
    : 'WebSite'

  const jsonld = {
    '@context': 'https://schema.org',
    '@graph': [
      {
        '@type': siteType,
        '@id': `https://${domain}/#site`,
        name: displayName,
        url: `https://${domain}`,
        alternateName: domain,
        additionalType: CATEGORY_LABEL[classification],
      },
      {
        '@type': 'CollectionPage',
        '@id': `${domainUrl}#page`,
        url: domainUrl,
        inLanguage: 'pt-BR',
        name: `${displayName} — ${SITE_NAME}`,
        description: `${statementCount} declarações verificadas citando ${displayName} como fonte primária.`,
        about: { '@id': `https://${domain}/#site` },
        publisher,
        mainEntity: {
          '@type': 'ItemList',
          numberOfItems: statementCount,
        },
      },
    ],
  }

  const etag = `W/"fontes-jsonld-${domain}-${statementCount}"`
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
