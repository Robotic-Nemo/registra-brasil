import { describe, test, expect } from 'vitest'
import { formatBRL, formatBRLCompact, parseBRL } from '../currency'

describe('formatBRL', () => {
  test('formats as Brazilian currency', () => {
    const result = formatBRL(1234.56)
    // Intl formatting may use different space types
    expect(result).toContain('R$')
    expect(result).toContain('1.234')
    expect(result).toContain('56')
  })

  test('handles zero', () => {
    const result = formatBRL(0)
    expect(result).toContain('R$')
    expect(result).toContain('0')
  })

  test('handles negative values', () => {
    const result = formatBRL(-100)
    expect(result).toContain('R$')
    expect(result).toContain('100')
  })

  test('handles NaN', () => {
    const result = formatBRL(NaN)
    expect(result).toContain('NaN')
  })
})

describe('formatBRLCompact', () => {
  test('formats millions as M', () => {
    expect(formatBRLCompact(5_000_000)).toBe('R$ 5.0M')
  })

  test('formats thousands as K', () => {
    expect(formatBRLCompact(2_500)).toBe('R$ 2.5K')
  })

  test('formats billions as B', () => {
    expect(formatBRLCompact(3_000_000_000)).toBe('R$ 3.0B')
  })

  test('uses standard format for small values', () => {
    const result = formatBRLCompact(500)
    expect(result).toContain('R$')
    expect(result).toContain('500')
  })

  test('returns formatted NaN for non-finite', () => {
    const result = formatBRLCompact(NaN)
    expect(result).toContain('NaN')
  })

  test('returns formatted Infinity for non-finite', () => {
    const result = formatBRLCompact(Infinity)
    // Intl formats Infinity
    expect(result).toBeTruthy()
  })
})

describe('parseBRL', () => {
  test('parses formatted BRL string', () => {
    expect(parseBRL('R$ 1.234,56')).toBe(1234.56)
  })

  test('parses without R$ prefix', () => {
    expect(parseBRL('1.234,56')).toBe(1234.56)
  })

  test('returns 0 for unparseable string', () => {
    expect(parseBRL('abc')).toBe(0)
  })

  test('returns 0 for empty string', () => {
    expect(parseBRL('')).toBe(0)
  })

  test('parses simple value', () => {
    expect(parseBRL('R$ 100,00')).toBe(100)
  })
})
