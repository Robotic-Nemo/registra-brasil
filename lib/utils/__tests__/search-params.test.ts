import { describe, test, expect } from 'vitest'
import {
  buildSearchParams,
  parseFilterParams,
  buildSearchUrl,
  mergeSearchParams,
} from '../search-params'

describe('buildSearchParams', () => {
  test('omits empty q', () => {
    expect(buildSearchParams({ q: '   ' }).toString()).toBe('')
  })
  test('trims q', () => {
    expect(buildSearchParams({ q: '  hello  ' }).get('q')).toBe('hello')
  })
  test('appends multiple categorias', () => {
    const p = buildSearchParams({ categoria: ['saude', 'educacao'] })
    expect(p.getAll('categoria')).toEqual(['saude', 'educacao'])
  })
  test('dedupes categorias', () => {
    const p = buildSearchParams({ categoria: ['a', 'a', 'b'] })
    expect(p.getAll('categoria')).toEqual(['a', 'b'])
  })
  test('omits fonte=todos', () => {
    expect(buildSearchParams({ fonte: 'todos' }).toString()).toBe('')
  })
  test('ignores invalid de', () => {
    expect(buildSearchParams({ de: 'not-a-date' }).has('de')).toBe(false)
  })
  test('accepts valid date', () => {
    expect(buildSearchParams({ de: '2024-01-01' }).get('de')).toBe('2024-01-01')
  })
  test('omits page=1', () => {
    expect(buildSearchParams({ page: 1 }).has('page')).toBe(false)
  })
  test('includes page > 1', () => {
    expect(buildSearchParams({ page: 3 }).get('page')).toBe('3')
  })
})

describe('parseFilterParams', () => {
  test('parses basic fields', () => {
    const p = new URLSearchParams('q=test&partido=PT&estado=SP')
    const r = parseFilterParams(p)
    expect(r.q).toBe('test')
    expect(r.partido).toBe('PT')
    expect(r.estado).toBe('SP')
  })
  test('returns undefined for absent', () => {
    expect(parseFilterParams(new URLSearchParams()).q).toBeUndefined()
  })
  test('gathers multi categoria', () => {
    const p = new URLSearchParams('categoria=a&categoria=b')
    expect(parseFilterParams(p).categoria).toEqual(['a', 'b'])
  })
  test('dedupes categoria', () => {
    const p = new URLSearchParams('categoria=a&categoria=a&categoria=b')
    expect(parseFilterParams(p).categoria).toEqual(['a', 'b'])
  })
  test('swaps inverted dates', () => {
    const p = new URLSearchParams('de=2024-12-31&ate=2024-01-01')
    const r = parseFilterParams(p)
    expect(r.de).toBe('2024-01-01')
    expect(r.ate).toBe('2024-12-31')
  })
  test('ignores invalid date strings', () => {
    const p = new URLSearchParams('de=foo&ate=bar')
    const r = parseFilterParams(p)
    expect(r.de).toBeUndefined()
    expect(r.ate).toBeUndefined()
  })
  test('min page 1', () => {
    const p = new URLSearchParams('page=-5')
    expect(parseFilterParams(p).page).toBe(1)
  })
  test('parses page number', () => {
    const p = new URLSearchParams('page=3')
    expect(parseFilterParams(p).page).toBe(3)
  })
  test('empty categoria returns undefined', () => {
    expect(parseFilterParams(new URLSearchParams()).categoria).toBeUndefined()
  })
})

describe('buildSearchUrl', () => {
  test('empty filters returns base path', () => {
    expect(buildSearchUrl('/base', {})).toBe('/base')
  })
  test('includes query string', () => {
    expect(buildSearchUrl('/base', { q: 'hi' })).toBe('/base?q=hi')
  })
})

describe('mergeSearchParams', () => {
  test('merges updates and resets page', () => {
    const current = new URLSearchParams('q=old&page=5')
    const merged = mergeSearchParams(current, { q: 'new' })
    expect(merged.get('q')).toBe('new')
    expect(merged.has('page')).toBe(false)
  })
  test('preserves existing values not being updated', () => {
    const current = new URLSearchParams('partido=PT')
    const merged = mergeSearchParams(current, { q: 'hi' })
    expect(merged.get('partido')).toBe('PT')
    expect(merged.get('q')).toBe('hi')
  })
})
