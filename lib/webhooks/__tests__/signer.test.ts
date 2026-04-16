import { describe, test, expect } from 'vitest'
import { signWebhookPayload, verifyWebhookSignature, generateWebhookSecret } from '../signer'

describe('signWebhookPayload', () => {
  test('produces sha256= prefix', async () => {
    const sig = await signWebhookPayload('{"a":1}', 'secret')
    expect(sig.startsWith('sha256=')).toBe(true)
  })

  test('is deterministic for same input', async () => {
    const a = await signWebhookPayload('{"a":1}', 'secret')
    const b = await signWebhookPayload('{"a":1}', 'secret')
    expect(a).toBe(b)
  })

  test('differs for different payload', async () => {
    const a = await signWebhookPayload('{"a":1}', 'secret')
    const b = await signWebhookPayload('{"a":2}', 'secret')
    expect(a).not.toBe(b)
  })

  test('differs for different secret', async () => {
    const a = await signWebhookPayload('{"a":1}', 'secret1')
    const b = await signWebhookPayload('{"a":1}', 'secret2')
    expect(a).not.toBe(b)
  })

  test('signature has 64 hex chars', async () => {
    const sig = await signWebhookPayload('{}', 's')
    const hex = sig.replace('sha256=', '')
    expect(hex).toMatch(/^[0-9a-f]{64}$/)
  })
})

describe('verifyWebhookSignature', () => {
  test('verifies matching signature', async () => {
    const sig = await signWebhookPayload('{"a":1}', 'secret')
    expect(await verifyWebhookSignature('{"a":1}', sig, 'secret')).toBe(true)
  })

  test('rejects mismatched signature', async () => {
    const sig = await signWebhookPayload('{"a":1}', 'secret')
    expect(await verifyWebhookSignature('{"a":2}', sig, 'secret')).toBe(false)
  })

  test('rejects wrong secret', async () => {
    const sig = await signWebhookPayload('{}', 'secret1')
    expect(await verifyWebhookSignature('{}', sig, 'secret2')).toBe(false)
  })

  test('rejects length mismatch early', async () => {
    expect(await verifyWebhookSignature('{}', 'sha256=short', 'secret')).toBe(false)
  })
})

describe('generateWebhookSecret', () => {
  test('returns 64-char hex string', () => {
    const secret = generateWebhookSecret()
    expect(secret).toMatch(/^[0-9a-f]{64}$/)
  })

  test('generates unique values', () => {
    const a = generateWebhookSecret()
    const b = generateWebhookSecret()
    expect(a).not.toBe(b)
  })
})
