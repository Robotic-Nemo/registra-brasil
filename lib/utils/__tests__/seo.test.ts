import { describe, test, expect } from 'vitest'
import { canonicalUrl, metaDescription, pageTitle, statementOgMeta, politicianOgMeta } from '../seo'

describe('canonicalUrl', () => {
  test('prepends site URL', () => {
    expect(canonicalUrl('/foo')).toMatch(/\/foo$/)
  })
  test('handles path without leading slash', () => {
    expect(canonicalUrl('foo')).toMatch(/\/foo$/)
  })
})

describe('metaDescription', () => {
  test('returns short text unchanged', () => {
    expect(metaDescription('hello')).toBe('hello')
  })
  test('truncates at word boundary', () => {
    const text = 'one two three four five six seven eight nine ten eleven twelve'.repeat(5)
    const result = metaDescription(text, 160)
    expect(result.length).toBeLessThanOrEqual(161)
    expect(result.endsWith('…')).toBe(true)
  })
  test('hard cut when no good word boundary', () => {
    const text = 'x'.repeat(200)
    expect(metaDescription(text, 100).endsWith('…')).toBe(true)
  })
})

describe('pageTitle', () => {
  test('uses em-dash separator', () => {
    expect(pageTitle('Home')).toContain('Home —')
  })
  test('includes site name', () => {
    expect(pageTitle('X')).toContain('Registra Brasil')
  })
})

describe('statementOgMeta', () => {
  test('returns article type', () => {
    const m = statementOgMeta('Lula', 'A summary', '/path')
    expect(m.type).toBe('article')
    expect(m.title).toContain('Lula')
    expect(m.url).toContain('/path')
  })
})

describe('politicianOgMeta', () => {
  test('returns profile type', () => {
    const m = politicianOgMeta('Lula', 'PT', '/politico/lula')
    expect(m.type).toBe('profile')
    expect(m.title).toContain('Lula')
    expect(m.title).toContain('PT')
  })
})
