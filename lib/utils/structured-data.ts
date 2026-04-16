/**
 * JSON-LD structured data helpers for SEO.
 * Generates schema.org compliant JSON-LD for various page types.
 */

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SITE_NAME = 'Registra Brasil'

interface BreadcrumbItem {
  name: string
  url: string
}

/**
 * Generate BreadcrumbList JSON-LD schema.
 */
export function breadcrumbListJsonLd(items: BreadcrumbItem[]): Record<string, unknown> {
  return {
    '@context': 'https://schema.org',
    '@type': 'BreadcrumbList',
    itemListElement: items.map((item, i) => ({
      '@type': 'ListItem',
      position: i + 1,
      name: item.name,
      item: item.url.startsWith('http') ? item.url : `${SITE_URL}${item.url}`,
    })),
  }
}

interface PersonSchemaInput {
  name: string
  slug: string
  party: string
  state?: string | null
  role?: string | null
  photoUrl?: string | null
}

/**
 * Generate Person JSON-LD schema for a politician.
 */
export function personJsonLd(person: PersonSchemaInput): Record<string, unknown> {
  const schema: Record<string, unknown> = {
    '@context': 'https://schema.org',
    '@type': 'Person',
    name: person.name,
    url: `${SITE_URL}/politico/${person.slug}`,
    memberOf: {
      '@type': 'Organization',
      name: person.party,
    },
  }

  if (person.role) {
    schema.jobTitle = person.role
  }
  if (person.state) {
    schema.address = {
      '@type': 'PostalAddress',
      addressRegion: person.state,
      addressCountry: 'BR',
    }
  }
  if (person.photoUrl) {
    schema.image = person.photoUrl
  }

  return schema
}

interface ClaimSchemaInput {
  id: string
  slug?: string | null
  summary: string
  politicianName: string
  politicianSlug: string
  datePublished: string
  verificationStatus: string
  sourceUrl: string
}

/**
 * Generate ClaimReview JSON-LD schema for a statement/claim.
 */
export function claimReviewJsonLd(claim: ClaimSchemaInput): Record<string, unknown> {
  const ratingMap: Record<string, { value: number; bestRating: number; worstRating: number; name: string }> = {
    verified: { value: 5, bestRating: 5, worstRating: 1, name: 'Verificado' },
    unverified: { value: 3, bestRating: 5, worstRating: 1, name: 'Nao verificado' },
    disputed: { value: 2, bestRating: 5, worstRating: 1, name: 'Disputado' },
    removed: { value: 1, bestRating: 5, worstRating: 1, name: 'Removido' },
  }

  const rating = ratingMap[claim.verificationStatus] ?? ratingMap.unverified

  return {
    '@context': 'https://schema.org',
    '@type': 'ClaimReview',
    url: `${SITE_URL}/declaracao/${claim.slug ?? claim.id}`,
    claimReviewed: claim.summary,
    datePublished: claim.datePublished,
    author: {
      '@type': 'Organization',
      name: SITE_NAME,
      url: SITE_URL,
    },
    itemReviewed: {
      '@type': 'Claim',
      author: {
        '@type': 'Person',
        name: claim.politicianName,
        url: `${SITE_URL}/politico/${claim.politicianSlug}`,
      },
      datePublished: claim.datePublished,
      appearance: {
        '@type': 'CreativeWork',
        url: claim.sourceUrl,
      },
    },
    reviewRating: {
      '@type': 'Rating',
      ratingValue: rating.value,
      bestRating: rating.bestRating,
      worstRating: rating.worstRating,
      alternateName: rating.name,
    },
  }
}

interface WebSiteSchemaInput {
  searchUrl?: string
}

/**
 * Generate WebSite JSON-LD with search action.
 */
export function webSiteJsonLd(opts?: WebSiteSchemaInput): Record<string, unknown> {
  return {
    '@context': 'https://schema.org',
    '@type': 'WebSite',
    name: SITE_NAME,
    url: SITE_URL,
    potentialAction: {
      '@type': 'SearchAction',
      target: {
        '@type': 'EntryPoint',
        urlTemplate: `${SITE_URL}${opts?.searchUrl ?? '/buscar'}?q={search_term_string}`,
      },
      'query-input': 'required name=search_term_string',
    },
  }
}

interface WebPageSchemaInput {
  title: string
  description: string
  url: string
  datePublished?: string
  dateModified?: string
}

/**
 * Generate WebPage JSON-LD schema.
 */
export function webPageJsonLd(page: WebPageSchemaInput): Record<string, unknown> {
  const schema: Record<string, unknown> = {
    '@context': 'https://schema.org',
    '@type': 'WebPage',
    name: page.title,
    description: page.description,
    url: page.url.startsWith('http') ? page.url : `${SITE_URL}${page.url}`,
    isPartOf: {
      '@type': 'WebSite',
      name: SITE_NAME,
      url: SITE_URL,
    },
  }

  if (page.datePublished) {
    schema.datePublished = page.datePublished
  }
  if (page.dateModified) {
    schema.dateModified = page.dateModified
  }

  return schema
}

interface FAQItem {
  question: string
  answer: string
}

/**
 * Generate FAQPage JSON-LD schema.
 */
export function faqPageJsonLd(items: FAQItem[]): Record<string, unknown> {
  return {
    '@context': 'https://schema.org',
    '@type': 'FAQPage',
    mainEntity: items.map((item) => ({
      '@type': 'Question',
      name: item.question,
      acceptedAnswer: {
        '@type': 'Answer',
        text: item.answer,
      },
    })),
  }
}

/**
 * Render JSON-LD as a script tag string for use in Next.js metadata.
 */
export function jsonLdScript(data: Record<string, unknown>): string {
  return JSON.stringify(data)
}
