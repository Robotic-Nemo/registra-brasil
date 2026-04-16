import { describe, test, expect } from 'vitest'
import { formatBR, formatCompact, formatPercent, clamp, parsePage } from '../number'

describe('formatBR', () => {
  test('formats number with Brazilian locale separator', () => {
    expect(formatBR(1234)).toBe('1.234')
  })
  test('handles zero', () => {
    expect(formatBR(0)).toBe('0')
  })
  test('handles negative numbers', () => {
    expect(formatBR(-1000)).toContain('1.000')
  })
  test('handles decimals', () => {
    const result = formatBR(1234.56)
    expect(result).toContain('1.234')
  })
})

describe('formatCompact', () => {
  test('formats thousands', () => {
    const result = formatCompact(1500)
    expect(result).toBeTruthy()
  })
  test('formats millions', () => {
    const result = formatCompact(2_000_000)
    expect(result).toBeTruthy()
  })
  test('handles small numbers', () => {
    const result = formatCompact(42)
    expect(result).toBe('42')
  })
})

describe('formatPercent', () => {
  test('calculates and formats percentage', () => {
    expect(formatPercent(1, 4)).toBe('25%')
  })
  test('returns 0% when total is zero', () => {
    expect(formatPercent(5, 0)).toBe('0%')
  })
  test('rounds to nearest integer', () => {
    expect(formatPercent(1, 3)).toBe('33%')
  })
  test('handles 100%', () => {
    expect(formatPercent(10, 10)).toBe('100%')
  })
})

describe('clamp', () => {
  test('returns value when within range', () => {
    expect(clamp(5, 0, 10)).toBe(5)
  })
  test('returns min when value is below range', () => {
    expect(clamp(-5, 0, 10)).toBe(0)
  })
  test('returns max when value is above range', () => {
    expect(clamp(15, 0, 10)).toBe(10)
  })
  test('handles equal min and max', () => {
    expect(clamp(5, 3, 3)).toBe(3)
  })
  test('handles value at boundaries', () => {
    expect(clamp(0, 0, 10)).toBe(0)
    expect(clamp(10, 0, 10)).toBe(10)
  })
})

describe('parsePage', () => {
  test('parses valid page number string', () => {
    expect(parsePage('5')).toBe(5)
  })
  test('returns fallback for null input', () => {
    expect(parsePage(null)).toBe(1)
  })
  test('returns fallback for non-numeric string', () => {
    expect(parsePage('abc')).toBe(1)
  })
  test('returns fallback for page less than 1', () => {
    expect(parsePage('0')).toBe(1)
    expect(parsePage('-1')).toBe(1)
  })
  test('uses custom fallback', () => {
    expect(parsePage(null, 5)).toBe(5)
  })
})
