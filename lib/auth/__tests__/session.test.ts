import { describe, test, expect } from 'vitest'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '../session'

describe('SESSION_COOKIE', () => {
  test('is defined and non-empty', () => {
    expect(SESSION_COOKIE).toBeTruthy()
    expect(typeof SESSION_COOKIE).toBe('string')
  })
})

describe('deriveSessionToken', () => {
  test('returns hex string', async () => {
    const token = await deriveSessionToken('secret')
    expect(token).toMatch(/^[0-9a-f]{64}$/)
  })

  test('is deterministic for same secret', async () => {
    const a = await deriveSessionToken('secret')
    const b = await deriveSessionToken('secret')
    expect(a).toBe(b)
  })

  test('differs for different secrets', async () => {
    const a = await deriveSessionToken('secret1')
    const b = await deriveSessionToken('secret2')
    expect(a).not.toBe(b)
  })

  test('rejects empty secret (zero-length key not supported)', async () => {
    await expect(deriveSessionToken('')).rejects.toThrow()
  })
})

describe('timingSafeEqual', () => {
  test('true for equal strings', () => {
    expect(timingSafeEqual('abc', 'abc')).toBe(true)
  })
  test('false for different strings', () => {
    expect(timingSafeEqual('abc', 'abd')).toBe(false)
  })
  test('false for different lengths', () => {
    expect(timingSafeEqual('abc', 'abcd')).toBe(false)
  })
  test('true for empty strings', () => {
    expect(timingSafeEqual('', '')).toBe(true)
  })
  test('false for empty vs non-empty', () => {
    expect(timingSafeEqual('', 'a')).toBe(false)
  })
})
