import { describe, it, expect, vi, beforeEach } from 'vitest'
import { signPayload, dispatchWebhook, verifyWebhookSignature } from '../webhook'

// Use the real Web Crypto API (available in Node 20+)
// If not available vitest will polyfill via happy-dom / jsdom

describe('signPayload', () => {
  it('returns a hex string', async () => {
    const sig = await signPayload('hello', 'secret')
    expect(sig).toMatch(/^[0-9a-f]+$/)
  })

  it('produces consistent signatures for the same input', async () => {
    const a = await signPayload('data', 'key')
    const b = await signPayload('data', 'key')
    expect(a).toBe(b)
  })

  it('produces different signatures for different payloads', async () => {
    const a = await signPayload('payload-a', 'key')
    const b = await signPayload('payload-b', 'key')
    expect(a).not.toBe(b)
  })

  it('produces different signatures for different secrets', async () => {
    const a = await signPayload('data', 'secret-1')
    const b = await signPayload('data', 'secret-2')
    expect(a).not.toBe(b)
  })
})

describe('verifyWebhookSignature', () => {
  it('returns true for a valid signature', async () => {
    const payload = '{"event":"test"}'
    const secret = 'webhook-secret'
    const signature = `sha256=${await signPayload(payload, secret)}`

    const result = await verifyWebhookSignature(payload, signature, secret)
    expect(result).toBe(true)
  })

  it('returns false for an invalid signature', async () => {
    const result = await verifyWebhookSignature('payload', 'sha256=bad', 'secret')
    expect(result).toBe(false)
  })

  it('returns false when signature length differs', async () => {
    const result = await verifyWebhookSignature('payload', 'sha256=ab', 'secret')
    expect(result).toBe(false)
  })

  it('handles signature without sha256= prefix', async () => {
    const payload = 'test'
    const secret = 's'
    const raw = await signPayload(payload, secret)

    // Passing without prefix should also work since replace strips it
    const result = await verifyWebhookSignature(payload, raw, secret)
    expect(result).toBe(true)
  })
})

describe('dispatchWebhook', () => {
  beforeEach(() => {
    vi.restoreAllMocks()
  })

  it('sends POST with correct headers and signed payload', async () => {
    const mockResponse = {
      status: 200,
      text: () => Promise.resolve('ok'),
    }
    const fetchSpy = vi.spyOn(globalThis, 'fetch').mockResolvedValue(mockResponse as Response)

    const result = await dispatchWebhook(
      'https://example.com/hook',
      'statement.created',
      { id: '123' },
      'my-secret'
    )

    expect(fetchSpy).toHaveBeenCalledOnce()
    const [url, opts] = fetchSpy.mock.calls[0]
    expect(url).toBe('https://example.com/hook')
    expect(opts?.method).toBe('POST')

    const headers = opts?.headers as Record<string, string>
    expect(headers['Content-Type']).toBe('application/json')
    expect(headers['X-Webhook-Event']).toBe('statement.created')
    expect(headers['X-Webhook-Signature']).toMatch(/^sha256=[0-9a-f]+$/)
    expect(headers['User-Agent']).toBe('RegistraBrasil-Webhook/1.0')

    // Verify the body is valid JSON with expected shape
    const body = JSON.parse(opts?.body as string)
    expect(body.event).toBe('statement.created')
    expect(body.data).toEqual({ id: '123' })
    expect(body.timestamp).toBeDefined()

    expect(result.status).toBe(200)
    expect(result.body).toBe('ok')
  })

  it('returns status and truncated body on error', async () => {
    const longBody = 'x'.repeat(2000)
    const mockResponse = {
      status: 500,
      text: () => Promise.resolve(longBody),
    }
    vi.spyOn(globalThis, 'fetch').mockResolvedValue(mockResponse as Response)

    const result = await dispatchWebhook(
      'https://example.com/hook',
      'statement.verified',
      {},
      'secret'
    )

    expect(result.status).toBe(500)
    expect(result.body.length).toBeLessThanOrEqual(1000)
  })

  it('handles response.text() failure gracefully', async () => {
    const mockResponse = {
      status: 200,
      text: () => Promise.reject(new Error('read failed')),
    }
    vi.spyOn(globalThis, 'fetch').mockResolvedValue(mockResponse as Response)

    const result = await dispatchWebhook(
      'https://example.com/hook',
      'politician.created',
      {},
      'secret'
    )

    expect(result.status).toBe(200)
    expect(result.body).toBe('')
  })

  it('propagates fetch errors', async () => {
    vi.spyOn(globalThis, 'fetch').mockRejectedValue(new Error('network error'))

    await expect(
      dispatchWebhook('https://example.com/hook', 'statement.removed', {}, 'secret')
    ).rejects.toThrow('network error')
  })

  it('signature in header matches verifyWebhookSignature', async () => {
    let capturedBody = ''
    let capturedSignature = ''

    vi.spyOn(globalThis, 'fetch').mockImplementation(async (_url, opts) => {
      capturedBody = opts?.body as string
      capturedSignature = (opts?.headers as Record<string, string>)['X-Webhook-Signature']
      return { status: 200, text: () => Promise.resolve('') } as Response
    })

    await dispatchWebhook('https://example.com/hook', 'statement.disputed', { x: 1 }, 'the-secret')

    const valid = await verifyWebhookSignature(capturedBody, capturedSignature, 'the-secret')
    expect(valid).toBe(true)

    const invalid = await verifyWebhookSignature(capturedBody, capturedSignature, 'wrong-secret')
    expect(invalid).toBe(false)
  })
})
