import { describe, test, expect } from 'vitest'
import { generateNonce } from '../nonce'

describe('generateNonce', () => {
  test('returns a non-empty string', () => {
    expect(generateNonce()).toMatch(/\S/)
  })

  test('is hex-like (no dashes)', () => {
    expect(generateNonce()).not.toContain('-')
  })

  test('generates unique values', () => {
    const a = generateNonce()
    const b = generateNonce()
    expect(a).not.toBe(b)
  })

  test('has consistent length', () => {
    const nonce = generateNonce()
    expect(nonce.length).toBe(32) // UUID without dashes
  })
})
