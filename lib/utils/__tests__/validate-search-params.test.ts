import { describe, test, expect } from 'vitest'
import { parseSearchParams } from '../validate-search-params'

describe('parseSearchParams', () => {
  test('returns defaults for empty input', () => {
    const r = parseSearchParams({})
    expect(r.page).toBe(1)
    expect(r.limit).toBe(20)
    expect(r.fonte).toBe('todos')
    expect(r.q).toBeUndefined()
  })

  test('trims whitespace from q', () => {
    expect(parseSearchParams({ q: '  hi  ' }).q).toBe('hi')
  })

  test('empty q becomes undefined', () => {
    expect(parseSearchParams({ q: '   ' }).q).toBeUndefined()
  })

  test('accepts categoria string', () => {
    expect(parseSearchParams({ categoria: 'saude' }).categoria).toEqual(['saude'])
  })

  test('accepts categoria array', () => {
    expect(parseSearchParams({ categoria: ['a', 'b'] }).categoria).toEqual(['a', 'b'])
  })

  test('dedupes categoria', () => {
    expect(parseSearchParams({ categoria: ['a', 'a', 'b'] }).categoria).toEqual(['a', 'b'])
  })

  test('validates status', () => {
    expect(parseSearchParams({ status: 'verified' }).status).toBe('verified')
  })

  test('drops invalid status', () => {
    expect(parseSearchParams({ status: 'fake' }).status).toBeUndefined()
  })

  test('validates fonte', () => {
    expect(parseSearchParams({ fonte: 'curado' }).fonte).toBe('curado')
  })

  test('defaults fonte to todos when invalid', () => {
    expect(parseSearchParams({ fonte: 'fake' }).fonte).toBe('todos')
  })

  test('parses valid de/ate', () => {
    const r = parseSearchParams({ de: '2024-01-01', ate: '2024-12-31' })
    expect(r.de).toBe('2024-01-01')
    expect(r.ate).toBe('2024-12-31')
  })

  test('swaps inverted dates', () => {
    const r = parseSearchParams({ de: '2024-12-31', ate: '2024-01-01' })
    expect(r.de).toBe('2024-01-01')
    expect(r.ate).toBe('2024-12-31')
  })

  test('drops invalid date', () => {
    expect(parseSearchParams({ de: 'bad' }).de).toBeUndefined()
  })

  test('parses page number', () => {
    expect(parseSearchParams({ page: '5' }).page).toBe(5)
  })

  test('clamps page minimum to 1', () => {
    expect(parseSearchParams({ page: '-3' }).page).toBe(1)
  })

  test('clamps page maximum to 1000', () => {
    expect(parseSearchParams({ page: '9999' }).page).toBe(1000)
  })

  test('handles page as array', () => {
    expect(parseSearchParams({ page: ['2', '3'] }).page).toBe(2)
  })

  test('invalid page falls back to 1', () => {
    expect(parseSearchParams({ page: 'abc' }).page).toBe(1)
  })
})
