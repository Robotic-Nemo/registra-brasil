import { describe, test, expect } from 'vitest'
import { generateUnsubscribeToken, verifyUnsubscribeToken, isValidEmail } from '../newsletter'

describe('isValidEmail', () => {
  test('accepts valid email', () => {
    expect(isValidEmail('user@example.com')).toBe(true)
  })
  test('rejects empty', () => {
    expect(isValidEmail('')).toBe(false)
  })
  test('rejects missing @', () => {
    expect(isValidEmail('userexample.com')).toBe(false)
  })
  test('rejects missing domain', () => {
    expect(isValidEmail('user@')).toBe(false)
  })
  test('rejects space in email', () => {
    expect(isValidEmail('u ser@example.com')).toBe(false)
  })
  test('accepts dot in local part', () => {
    expect(isValidEmail('first.last@example.com')).toBe(true)
  })
  test('accepts plus in local part', () => {
    expect(isValidEmail('user+tag@example.com')).toBe(true)
  })
})

describe('generateUnsubscribeToken / verifyUnsubscribeToken', () => {
  test('returns 64-char hex', async () => {
    const token = await generateUnsubscribeToken('user@example.com')
    expect(token).toMatch(/^[0-9a-f]{64}$/)
  })

  test('verifies matching token', async () => {
    const token = await generateUnsubscribeToken('user@example.com')
    expect(await verifyUnsubscribeToken('user@example.com', token)).toBe(true)
  })

  test('rejects mismatched email', async () => {
    const token = await generateUnsubscribeToken('a@example.com')
    expect(await verifyUnsubscribeToken('b@example.com', token)).toBe(false)
  })

  test('rejects token with wrong length', async () => {
    expect(await verifyUnsubscribeToken('a@example.com', 'short')).toBe(false)
  })
})
