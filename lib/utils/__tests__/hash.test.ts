import { describe, test, expect } from 'vitest'
import { hashString, cacheKey } from '../hash'

describe('hashString', () => {
  test('returns a string', () => {
    expect(typeof hashString('hello')).toBe('string')
  })
  test('returns consistent hash for same input', () => {
    expect(hashString('test')).toBe(hashString('test'))
  })
  test('returns different hashes for different inputs', () => {
    expect(hashString('foo')).not.toBe(hashString('bar'))
  })
  test('handles empty string', () => {
    expect(typeof hashString('')).toBe('string')
  })
  test('returns non-empty string', () => {
    expect(hashString('x').length).toBeGreaterThan(0)
  })
})

describe('cacheKey', () => {
  test('creates consistent key from parts', () => {
    const key1 = cacheKey('a', 1, true)
    const key2 = cacheKey('a', 1, true)
    expect(key1).toBe(key2)
  })
  test('creates different keys for different parts', () => {
    expect(cacheKey('a', 1)).not.toBe(cacheKey('b', 1))
  })
  test('handles null and undefined', () => {
    const key = cacheKey('prefix', null, undefined)
    expect(typeof key).toBe('string')
  })
  test('returns a string', () => {
    expect(typeof cacheKey('x')).toBe('string')
  })
})
