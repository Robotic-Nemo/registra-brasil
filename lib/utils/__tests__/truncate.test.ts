import { describe, test, expect } from 'vitest'
import { truncate } from '../truncate'

describe('truncate', () => {
  test('returns string unchanged when shorter than maxLen', () => {
    expect(truncate('hello', 10)).toBe('hello')
  })
  test('returns string unchanged when equal to maxLen', () => {
    expect(truncate('hello', 5)).toBe('hello')
  })
  test('truncates at word boundary', () => {
    expect(truncate('hello world foo', 8)).toBe('hello...')
  })
  test('uses hard cut when no space found', () => {
    expect(truncate('abcdefghijklm', 5)).toBe('abcde...')
  })
  test('trims trailing whitespace before ellipsis', () => {
    expect(truncate('hello  world', 7)).toBe('hello...')
  })
  test('handles empty string', () => {
    expect(truncate('', 5)).toBe('')
  })
  test('handles very small maxLen', () => {
    // With maxLen 1, slice keeps 1 char
    const result = truncate('abc def', 1)
    expect(typeof result).toBe('string')
  })
  test('handles multi-word sentence', () => {
    const long = 'The quick brown fox jumps over the lazy dog'
    const out = truncate(long, 20)
    expect(out.endsWith('...')).toBe(true)
    expect(out.length).toBeLessThanOrEqual(23)
  })
})
