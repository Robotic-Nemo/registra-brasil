import { describe, test, expect } from 'vitest'
import { formatBytes, parseBytes } from '../format-bytes'

describe('formatBytes', () => {
  test('returns 0 B for zero', () => {
    expect(formatBytes(0)).toBe('0 B')
  })
  test('formats bytes under 1KB', () => {
    expect(formatBytes(512)).toBe('512 B')
  })
  test('formats exactly 1 KB', () => {
    expect(formatBytes(1024)).toBe('1 KB')
  })
  test('formats 1.5 KB with default decimals', () => {
    expect(formatBytes(1536)).toBe('1.5 KB')
  })
  test('formats 1 MB', () => {
    expect(formatBytes(1048576)).toBe('1 MB')
  })
  test('formats 1 GB', () => {
    expect(formatBytes(1073741824)).toBe('1 GB')
  })
  test('respects decimals parameter', () => {
    expect(formatBytes(1536, 3)).toBe('1.500 KB')
  })
  test('handles negative numbers with a minus prefix', () => {
    expect(formatBytes(-1024)).toBe('-1 KB')
  })
  test('handles Infinity', () => {
    expect(formatBytes(Infinity)).toBe('Infinity')
  })
  test('handles NaN', () => {
    expect(formatBytes(NaN)).toBe('NaN')
  })
  test('caps at largest unit (PB)', () => {
    expect(formatBytes(Math.pow(1024, 6) * 2)).toMatch(/PB$/)
  })
})

describe('parseBytes', () => {
  test('parses "1 KB"', () => {
    expect(parseBytes('1 KB')).toBe(1024)
  })
  test('parses "1.5 MB"', () => {
    expect(parseBytes('1.5 MB')).toBe(1572864)
  })
  test('parses bytes without space', () => {
    expect(parseBytes('1KB')).toBe(1024)
  })
  test('parses case insensitive', () => {
    expect(parseBytes('1 kb')).toBe(1024)
  })
  test('returns null for invalid input', () => {
    expect(parseBytes('abc')).toBeNull()
  })
  test('returns null for unknown unit', () => {
    expect(parseBytes('1 XB')).toBeNull()
  })
  test('returns null for empty string', () => {
    expect(parseBytes('')).toBeNull()
  })
  test('parses plain bytes', () => {
    expect(parseBytes('500 B')).toBe(500)
  })
})
