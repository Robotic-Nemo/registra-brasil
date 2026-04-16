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

interface ArticleSchemaInput {
  headline: string
  description: string
  datePublished: string
  dateModified?: string
  authorName: string
  authorUrl?: string
  url: string
  imageUrl?: string
}

/**
 * Generate Article JSON-LD schema — complements ClaimReview for richer surfacing.
 */
export function articleJsonLd(input: ArticleSchemaInput): Record<string, unknown> {
  const schema: Record<string, unknown> = {
    '@context': 'https://schema.org',
    '@type': 'Article',
    headline: input.headline.slice(0, 110), // Google prefers <110 chars
    description: input.description,
    datePublished: input.datePublished,
    dateModified: input.dateModified ?? input.datePublished,
    author: {
      '@type': 'Person',
      name: input.authorName,
      ...(input.authorUrl ? { url: input.authorUrl } : {}),
    },
    publisher: {
      '@type': 'Organization',
      name: SITE_NAME,
      url: SITE_URL,
      logo: {
        '@type': 'ImageObject',
        url: `${SITE_URL}/icon.png`,
      },
    },
    mainEntityOfPage: {
      '@type': 'WebPage',
      '@id': input.url.startsWith('http') ? input.url : `${SITE_URL}${input.url}`,
    },
  }
  if (input.imageUrl) {
    schema.image = input.imageUrl
  }
  return schema
}

interface ItemListEntry {
  name: string
  url: string
}

/**
 * Generate ItemList JSON-LD — useful for listing pages.
 */
export function itemListJsonLd(items: ItemListEntry[], name?: string): Record<string, unknown> {
  return {
    '@context': 'https://schema.org',
    '@type': 'ItemList',
    ...(name ? { name } : {}),
    numberOfItems: items.length,
    itemListElement: items.map((it, i) => ({
      '@type': 'ListItem',
      position: i + 1,
      name: it.name,
      url: it.url.startsWith('http') ? it.url : `${SITE_URL}${it.url}`,
    })),
  }
}

interface CollectionPageInput {
  name: string
  description: string
  url: string
}

/**
 * Generate CollectionPage JSON-LD — useful for category, tag, and archive pages.
 */
export function collectionPageJsonLd(input: CollectionPageInput): Record<string, unknown> {
  return {
    '@context': 'https://schema.org',
    '@type': 'CollectionPage',
    name: input.name,
    description: input.description,
    url: input.url.startsWith('http') ? input.url : `${SITE_URL}${input.url}`,
    isPartOf: {
      '@type': 'WebSite',
      name: SITE_NAME,
      url: SITE_URL,
    },
    inLanguage: 'pt-BR',
  }
}

interface OrganizationSchemaInput {
  description?: string
  sameAs?: string[]
}

/**
 * Generate Organization JSON-LD for the publisher entity (About page etc).
 */
export function organizationJsonLd(input: OrganizationSchemaInput = {}): Record<string, unknown> {
  return {
    '@context': 'https://schema.org',
    '@type': 'Organization',
    name: SITE_NAME,
    url: SITE_URL,
    logo: `${SITE_URL}/icon.png`,
    ...(input.description ? { description: input.description } : {}),
    ...(input.sameAs && input.sameAs.length > 0 ? { sameAs: input.sameAs } : {}),
  }
}

/**
 * Render JSON-LD as a script tag string for use in Next.js metadata.
 */
export function jsonLdScript(data: Record<string, unknown>): string {
  return JSON.stringify(data)
}
