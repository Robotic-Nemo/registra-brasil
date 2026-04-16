import { describe, test, expect } from 'vitest'
import {
  buildWebSiteSchema,
  buildClaimReviewSchema,
  buildPersonSchema,
  buildBreadcrumbSchema,
  toJsonLdScript,
} from '../schema-org'

describe('buildWebSiteSchema', () => {
  test('has WebSite type', () => {
    const s = buildWebSiteSchema()
    expect(s['@type']).toBe('WebSite')
    expect(s['@context']).toBe('https://schema.org')
  })

  test('has SearchAction', () => {
    const s = buildWebSiteSchema() as any
    expect(s.potentialAction['@type']).toBe('SearchAction')
  })
})

describe('buildClaimReviewSchema', () => {
  test('builds schema with verified rating', () => {
    const s = buildClaimReviewSchema({
      summary: 'test', politicianName: 'Lula', date: '2024-01-01',
      slug: 'test-slug', verificationStatus: 'verified',
    }) as any
    expect(s['@type']).toBe('ClaimReview')
    expect(s.reviewRating.ratingValue).toBe(5)
    expect(s.reviewRating.alternateName).toBe('Verificado')
  })

  test('uses unverified rating for unknown status', () => {
    const s = buildClaimReviewSchema({
      summary: 'x', politicianName: 'Lula', date: '2024-01-01',
      slug: 'x', verificationStatus: 'unknown-status',
    }) as any
    expect(s.reviewRating.ratingValue).toBe(3)
  })

  test('uses fullQuote when provided', () => {
    const s = buildClaimReviewSchema({
      summary: 's', fullQuote: 'full', politicianName: 'Lula', date: '2024-01-01',
      slug: 'x', verificationStatus: 'verified',
    }) as any
    expect(s.claimReviewed).toBe('full')
  })

  test('includes source appearance when URL provided', () => {
    const s = buildClaimReviewSchema({
      summary: 's', politicianName: 'Lula', date: '2024-01-01',
      slug: 'x', verificationStatus: 'verified', sourceUrl: 'https://src.com',
    }) as any
    expect(s.itemReviewed.appearance.url).toBe('https://src.com')
  })
})

describe('buildPersonSchema', () => {
  test('includes basic info', () => {
    const s = buildPersonSchema({ name: 'Lula', party: 'PT', state: 'SP', slug: 'lula' }) as any
    expect(s['@type']).toBe('Person')
    expect(s.name).toBe('Lula')
    expect(s.affiliation.name).toBe('PT')
    expect(s.address.addressRegion).toBe('SP')
  })

  test('omits image when not provided', () => {
    const s = buildPersonSchema({ name: 'X', party: 'Y', state: null, slug: 's' }) as any
    expect(s.image).toBeUndefined()
  })

  test('includes image when provided', () => {
    const s = buildPersonSchema({
      name: 'X', party: 'Y', state: null, slug: 's', photoUrl: 'https://x.jpg',
    }) as any
    expect(s.image).toBe('https://x.jpg')
  })
})

describe('buildBreadcrumbSchema', () => {
  test('builds with positions', () => {
    const s = buildBreadcrumbSchema([
      { name: 'Home', path: '/' },
      { name: 'Politicos', path: '/politicos' },
    ]) as any
    expect(s['@type']).toBe('BreadcrumbList')
    expect(s.itemListElement[0].position).toBe(1)
    expect(s.itemListElement[1].position).toBe(2)
  })

  test('handles empty list', () => {
    const s = buildBreadcrumbSchema([]) as any
    expect(s.itemListElement).toEqual([])
  })
})

describe('toJsonLdScript', () => {
  test('wraps JSON in script tag', () => {
    const out = toJsonLdScript({ a: 1 })
    expect(out).toContain('application/ld+json')
    expect(out).toContain('"a":1')
  })
})
