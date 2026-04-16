import { describe, test, expect } from 'vitest'
import {
  buildSitemapUrl,
  createSitemapEntry,
  getStaticSitemapEntries,
  generateSlugEntries,
} from '../sitemap-helpers'

describe('buildSitemapUrl', () => {
  test('prepends slash', () => {
    expect(buildSitemapUrl('path').endsWith('/path')).toBe(true)
  })
  test('handles leading slash', () => {
    expect(buildSitemapUrl('/path').endsWith('/path')).toBe(true)
  })
})

describe('createSitemapEntry', () => {
  test('returns url/lastModified/changeFrequency/priority', () => {
    const entry = createSitemapEntry('/foo')
    expect(entry.url).toContain('/foo')
    expect(entry.changeFrequency).toBe('weekly')
    expect(entry.priority).toBe(0.5)
    expect(entry.lastModified).toBeDefined()
  })
  test('respects custom options', () => {
    const entry = createSitemapEntry('/x', { priority: 0.9, changeFrequency: 'daily' })
    expect(entry.priority).toBe(0.9)
    expect(entry.changeFrequency).toBe('daily')
  })
})

describe('getStaticSitemapEntries', () => {
  test('returns non-empty list', () => {
    expect(getStaticSitemapEntries().length).toBeGreaterThan(0)
  })
  test('homepage has priority 1.0', () => {
    const entries = getStaticSitemapEntries()
    const home = entries.find((e) => e.url.endsWith('/'))
    expect(home?.priority).toBe(1.0)
  })
})

describe('generateSlugEntries', () => {
  test('generates entry per slug', () => {
    const entries = generateSlugEntries('/politico', [
      { slug: 'lula' }, { slug: 'bolsonaro' },
    ])
    expect(entries).toHaveLength(2)
    expect(entries[0].url).toContain('/politico/lula')
  })
  test('uses updatedAt as lastModified', () => {
    const entries = generateSlugEntries('/politico', [
      { slug: 'a', updatedAt: '2024-01-01' },
    ])
    expect(entries[0].lastModified).toBe('2024-01-01')
  })
})
