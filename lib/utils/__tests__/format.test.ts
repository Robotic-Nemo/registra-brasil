import { describe, test, expect } from 'vitest'
import { formatNumber, formatPercentage, formatCompact } from '../format'

describe('formatNumber', () => {
  test('formats number with Brazilian locale', () => {
    // pt-BR uses dots as thousands separators
    expect(formatNumber(1234)).toBe('1.234')
  })

  test('handles zero', () => {
    expect(formatNumber(0)).toBe('0')
  })

  test('handles negative numbers', () => {
    expect(formatNumber(-1000)).toContain('1.000')
  })

  test('handles small numbers', () => {
    expect(formatNumber(42)).toBe('42')
  })
})

describe('formatPercentage', () => {
  test('formats percentage with comma decimal', () => {
    expect(formatPercentage(75.3)).toBe('75,3%')
  })

  test('formats with custom decimal places', () => {
    expect(formatPercentage(33.333, 2)).toBe('33,33%')
  })

  test('handles zero', () => {
    expect(formatPercentage(0)).toBe('0,0%')
  })

  test('handles 100%', () => {
    expect(formatPercentage(100)).toBe('100,0%')
  })
})

describe('formatCompact', () => {
  test('returns number as-is below 1000', () => {
    expect(formatCompact(999)).toBe('999')
  })

  test('formats thousands with one decimal', () => {
    expect(formatCompact(1500)).toBe('1,5k')
  })

  test('formats 10k+ without decimals', () => {
    expect(formatCompact(45000)).toBe('45k')
  })

  test('formats millions', () => {
    expect(formatCompact(1_200_000)).toBe('1,2M')
  })

  test('handles zero', () => {
    expect(formatCompact(0)).toBe('0')
  })
})
