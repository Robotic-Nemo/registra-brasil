import { describe, test, expect, beforeEach, afterEach, vi } from 'vitest'
import { sendEmail, sendBulkEmail } from '../sender'

const ORIGINAL_FETCH = globalThis.fetch
const ORIG_ENV = { ...process.env }

describe('sendEmail', () => {
  beforeEach(() => {
    delete process.env.RESEND_API_KEY
    delete process.env.SMTP_RELAY_URL
  })
  afterEach(() => {
    globalThis.fetch = ORIGINAL_FETCH
    process.env = { ...ORIG_ENV }
    vi.restoreAllMocks()
  })

  test('returns error when no provider configured', async () => {
    vi.spyOn(console, 'warn').mockImplementation(() => {})
    const result = await sendEmail({
      to: { email: 'u@ex.com' },
      subject: 'hi',
      html: '<p>hi</p>',
    })
    expect(result.success).toBe(false)
    expect(result.error).toMatch(/No email provider/i)
  })

  test('uses Resend when RESEND_API_KEY set', async () => {
    process.env.RESEND_API_KEY = 'key'
    const fetchMock = vi.fn().mockResolvedValue({
      ok: true,
      json: async () => ({ id: 'msg_123' }),
    })
    globalThis.fetch = fetchMock as any

    const result = await sendEmail({
      to: { email: 'u@ex.com' },
      subject: 's',
      html: '<p>h</p>',
    })

    expect(result.success).toBe(true)
    expect(result.messageId).toBe('msg_123')
    expect(fetchMock).toHaveBeenCalledWith(
      'https://api.resend.com/emails',
      expect.objectContaining({ method: 'POST' }),
    )
  })

  test('returns error on Resend API failure', async () => {
    process.env.RESEND_API_KEY = 'key'
    globalThis.fetch = vi.fn().mockResolvedValue({
      ok: false,
      status: 400,
      text: async () => 'Bad Request',
    }) as any

    const result = await sendEmail({
      to: { email: 'u@ex.com' },
      subject: 's',
      html: '<p>h</p>',
    })
    expect(result.success).toBe(false)
    expect(result.error).toMatch(/400/)
  })

  test('uses SMTP relay when configured', async () => {
    process.env.SMTP_RELAY_URL = 'https://smtp.example.com'
    globalThis.fetch = vi.fn().mockResolvedValue({
      ok: true,
      json: async () => ({ messageId: 'abc' }),
    }) as any

    const result = await sendEmail({
      to: { email: 'u@ex.com' },
      subject: 's',
      html: 'h',
    })
    expect(result.success).toBe(true)
    expect(result.messageId).toBe('abc')
  })

  test('handles thrown fetch error', async () => {
    process.env.RESEND_API_KEY = 'key'
    globalThis.fetch = vi.fn().mockRejectedValue(new Error('network fail')) as any

    const result = await sendEmail({
      to: { email: 'u@ex.com' },
      subject: 's',
      html: 'h',
    })
    expect(result.success).toBe(false)
    expect(result.error).toContain('network fail')
  })
})

describe('sendBulkEmail', () => {
  beforeEach(() => {
    delete process.env.RESEND_API_KEY
    delete process.env.SMTP_RELAY_URL
  })
  afterEach(() => {
    globalThis.fetch = ORIGINAL_FETCH
    process.env = { ...ORIG_ENV }
    vi.restoreAllMocks()
  })

  test('counts failures when no provider', async () => {
    vi.spyOn(console, 'warn').mockImplementation(() => {})
    const result = await sendBulkEmail(
      [{ email: 'a@x.com' }, { email: 'b@x.com' }],
      'hi',
      '<p>hi</p>',
    )
    expect(result.failed).toBe(2)
    expect(result.sent).toBe(0)
  })

  test('counts successes with provider', async () => {
    process.env.RESEND_API_KEY = 'key'
    globalThis.fetch = vi.fn().mockResolvedValue({
      ok: true,
      json: async () => ({ id: 'id' }),
    }) as any

    const result = await sendBulkEmail(
      [{ email: 'a@x.com' }, { email: 'b@x.com' }],
      'hi',
      '<p>hi</p>',
    )
    expect(result.sent).toBe(2)
    expect(result.failed).toBe(0)
  })
})
