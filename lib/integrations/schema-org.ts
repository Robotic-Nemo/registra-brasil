/**
 * Enhanced Schema.org structured data utilities.
 */

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SITE_NAME = 'Registra Brasil'

type JsonLdObject = Record<string, unknown>

/**
 * Build base WebSite schema.
 */
export function buildWebSiteSchema(): JsonLdObject {
  return {
    '@context': 'https://schema.org',
    '@type': 'WebSite',
    name: SITE_NAME,
    url: SITE_URL,
    potentialAction: {
      '@type': 'SearchAction',
      target: {
        '@type': 'EntryPoint',
        urlTemplate: `${SITE_URL}/busca?q={search_term_string}`,
      },
      'query-input': 'required name=search_term_string',
    },
  }
}

/**
 * Build a ClaimReview schema for a verified statement.
 */
export function buildClaimReviewSchema(params: {
  summary: string
  fullQuote?: string | null
  politicianName: string
  date: string
  slug: string
  verificationStatus: string
  sourceUrl?: string | null
}): JsonLdObject {
  const ratingMap: Record<string, { value: number; bestRating: number; alternateName: string }> = {
    verified: { value: 5, bestRating: 5, alternateName: 'Verificado' },
    mostly_true: { value: 4, bestRating: 5, alternateName: 'Majoritariamente verdadeiro' },
    disputed: { value: 2, bestRating: 5, alternateName: 'Contestado' },
    false: { value: 1, bestRating: 5, alternateName: 'Falso' },
    unverified: { value: 3, bestRating: 5, alternateName: 'Nao verificado' },
  }

  const rating = ratingMap[params.verificationStatus] ?? ratingMap.unverified

  return {
    '@context': 'https://schema.org',
    '@type': 'ClaimReview',
    url: `${SITE_URL}/declaracao/${params.slug}`,
    claimReviewed: params.fullQuote ?? params.summary,
    datePublished: params.date,
    itemReviewed: {
      '@type': 'Claim',
      author: {
        '@type': 'Person',
        name: params.politicianName,
      },
      datePublished: params.date,
      appearance: params.sourceUrl
        ? { '@type': 'CreativeWork', url: params.sourceUrl }
        : undefined,
    },
    author: {
      '@type': 'Organization',
      name: SITE_NAME,
      url: SITE_URL,
    },
    reviewRating: {
      '@type': 'Rating',
      ratingValue: rating.value,
      bestRating: rating.bestRating,
      worstRating: 1,
      alternateName: rating.alternateName,
    },
  }
}

/**
 * Build a Person schema for a politician profile.
 */
export function buildPersonSchema(params: {
  name: string
  party: string
  state: string | null
  slug: string
  photoUrl?: string | null
  role?: string | null
}): JsonLdObject {
  return {
    '@context': 'https://schema.org',
    '@type': 'Person',
    name: params.name,
    url: `${SITE_URL}/politico/${params.slug}`,
    affiliation: {
      '@type': 'Organization',
      name: params.party,
    },
    ...(params.photoUrl ? { image: params.photoUrl } : {}),
    ...(params.role ? { jobTitle: params.role } : {}),
    ...(params.state
      ? {
          address: {
            '@type': 'PostalAddress',
            addressRegion: params.state,
            addressCountry: 'BR',
          },
        }
      : {}),
  }
}

/**
 * Build BreadcrumbList schema.
 */
export function buildBreadcrumbSchema(
  items: { name: string; path: string }[]
): JsonLdObject {
  return {
    '@context': 'https://schema.org',
    '@type': 'BreadcrumbList',
    itemListElement: items.map((item, index) => ({
      '@type': 'ListItem',
      position: index + 1,
      name: item.name,
      item: `${SITE_URL}${item.path}`,
    })),
  }
}

/**
 * Serialize a schema object to a JSON-LD script tag string.
 */
export function toJsonLdScript(schema: JsonLdObject): string {
  return `<script type="application/ld+json">${JSON.stringify(schema)}</script>`
}
