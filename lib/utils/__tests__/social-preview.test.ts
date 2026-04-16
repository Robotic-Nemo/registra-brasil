import { describe, test, expect } from 'vitest'
import { truncateText, buildStatementPreview, buildPoliticianPreview, getOGImageUrl } from '../social-preview'

describe('truncateText', () => {
  test('returns short text unchanged', () => {
    expect(truncateText('hello', 10)).toBe('hello')
  })
  test('truncates with ellipsis', () => {
    const r = truncateText('x'.repeat(20), 10)
    expect(r.length).toBe(10)
    expect(r.endsWith('\u2026')).toBe(true)
  })
})

describe('buildStatementPreview', () => {
  test('truncates title', () => {
    const p = buildStatementPreview({
      summary: 'x'.repeat(200), politicianName: 'Lula', party: 'PT', slug: 's', date: '2024-01-01',
    })
    expect(p.title.length).toBeLessThanOrEqual(70)
  })
  test('uses default image when not provided', () => {
    const p = buildStatementPreview({
      summary: 's', politicianName: 'L', party: 'P', slug: 's', date: 'd',
    })
    expect(p.image).toContain('og-default.png')
  })
  test('uses custom image when provided', () => {
    const p = buildStatementPreview({
      summary: 's', politicianName: 'L', party: 'P', slug: 's', date: 'd', image: 'https://x.png',
    })
    expect(p.image).toBe('https://x.png')
  })
})

describe('buildPoliticianPreview', () => {
  test('includes state in title', () => {
    const p = buildPoliticianPreview({ name: 'Lula', party: 'PT', state: 'SP', slug: 'lula' })
    expect(p.title).toContain('SP')
  })
  test('omits state when null', () => {
    const p = buildPoliticianPreview({ name: 'L', party: 'P', state: null, slug: 's' })
    expect(p.title).not.toContain(' - null')
  })
  test('includes statement count', () => {
    const p = buildPoliticianPreview({
      name: 'Lula', party: 'PT', state: 'SP', slug: 'lula', statementCount: 42,
    })
    expect(p.description).toContain('42')
  })
})

describe('getOGImageUrl', () => {
  test('builds OG API URL', () => {
    expect(getOGImageUrl('/path')).toContain('/api/og')
  })
  test('includes path query', () => {
    expect(getOGImageUrl('/path')).toContain('path=%2Fpath')
  })
  test('includes extra params', () => {
    expect(getOGImageUrl('/x', { type: 'statement' })).toContain('type=statement')
  })
})
