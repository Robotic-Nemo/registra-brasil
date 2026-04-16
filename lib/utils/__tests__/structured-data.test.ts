import { describe, test, expect } from 'vitest'
import {
  breadcrumbListJsonLd,
  personJsonLd,
  claimReviewJsonLd,
  webSiteJsonLd,
  webPageJsonLd,
  faqPageJsonLd,
  articleJsonLd,
  itemListJsonLd,
  collectionPageJsonLd,
  organizationJsonLd,
  jsonLdScript,
} from '../structured-data'

describe('breadcrumbListJsonLd', () => {
  test('emits BreadcrumbList', () => {
    const r = breadcrumbListJsonLd([{ name: 'Home', url: '/' }]) as any
    expect(r['@type']).toBe('BreadcrumbList')
    expect(r.itemListElement[0].position).toBe(1)
  })
  test('uses absolute URL unchanged', () => {
    const r = breadcrumbListJsonLd([{ name: 'Ext', url: 'https://ex.com/foo' }]) as any
    expect(r.itemListElement[0].item).toBe('https://ex.com/foo')
  })
})

describe('personJsonLd', () => {
  test('basic person', () => {
    const r = personJsonLd({ name: 'Lula', slug: 'lula', party: 'PT' }) as any
    expect(r['@type']).toBe('Person')
    expect(r.memberOf.name).toBe('PT')
  })
  test('includes address when state present', () => {
    const r = personJsonLd({ name: 'X', slug: 's', party: 'P', state: 'SP' }) as any
    expect(r.address.addressRegion).toBe('SP')
  })
  test('omits role/state/image when absent', () => {
    const r = personJsonLd({ name: 'X', slug: 's', party: 'P' }) as any
    expect(r.address).toBeUndefined()
    expect(r.image).toBeUndefined()
  })
})

describe('claimReviewJsonLd', () => {
  test('verified rating', () => {
    const r = claimReviewJsonLd({
      id: 'id', summary: 's', politicianName: 'Lula', politicianSlug: 'lula',
      datePublished: '2024-01-01', verificationStatus: 'verified', sourceUrl: 'https://ex.com',
    }) as any
    expect(r.reviewRating.ratingValue).toBe(5)
    expect(r.reviewRating.alternateName).toBe('Verificado')
  })
  test('unknown status defaults to unverified', () => {
    const r = claimReviewJsonLd({
      id: 'id', summary: 's', politicianName: 'L', politicianSlug: 'l',
      datePublished: '2024-01-01', verificationStatus: 'unknown', sourceUrl: 'https://x.com',
    }) as any
    expect(r.reviewRating.ratingValue).toBe(3)
  })
})

describe('webSiteJsonLd', () => {
  test('basic WebSite', () => {
    const r = webSiteJsonLd() as any
    expect(r['@type']).toBe('WebSite')
  })
})

describe('webPageJsonLd', () => {
  test('basic WebPage', () => {
    const r = webPageJsonLd({ title: 't', description: 'd', url: '/x' }) as any
    expect(r['@type']).toBe('WebPage')
    expect(r.name).toBe('t')
  })
  test('includes datePublished when provided', () => {
    const r = webPageJsonLd({ title: 't', description: 'd', url: '/x', datePublished: '2024-01-01' }) as any
    expect(r.datePublished).toBe('2024-01-01')
  })
})

describe('faqPageJsonLd', () => {
  test('converts FAQ items', () => {
    const r = faqPageJsonLd([{ question: 'Q?', answer: 'A' }]) as any
    expect(r.mainEntity[0]['@type']).toBe('Question')
    expect(r.mainEntity[0].acceptedAnswer.text).toBe('A')
  })
})

describe('articleJsonLd', () => {
  test('truncates headline to 110 chars', () => {
    const r = articleJsonLd({
      headline: 'x'.repeat(200), description: 'd', datePublished: '2024-01-01',
      authorName: 'A', url: '/x',
    }) as any
    expect((r.headline as string).length).toBeLessThanOrEqual(110)
  })
})

describe('itemListJsonLd', () => {
  test('computes positions and count', () => {
    const r = itemListJsonLd([{ name: 'a', url: '/a' }, { name: 'b', url: '/b' }]) as any
    expect(r.numberOfItems).toBe(2)
    expect(r.itemListElement[1].position).toBe(2)
  })
})

describe('collectionPageJsonLd', () => {
  test('sets language pt-BR', () => {
    const r = collectionPageJsonLd({ name: 'n', description: 'd', url: '/x' }) as any
    expect(r.inLanguage).toBe('pt-BR')
  })
})

describe('organizationJsonLd', () => {
  test('basic Organization', () => {
    const r = organizationJsonLd() as any
    expect(r['@type']).toBe('Organization')
  })
  test('includes sameAs when provided', () => {
    const r = organizationJsonLd({ sameAs: ['https://x.com'] }) as any
    expect(r.sameAs).toEqual(['https://x.com'])
  })
})

describe('jsonLdScript', () => {
  test('returns JSON string', () => {
    expect(jsonLdScript({ a: 1 })).toBe('{"a":1}')
  })
})
