import { describe, test, expect, vi, afterEach } from 'vitest'
import { getStatementShareLinks, getPoliticianShareLinks, nativeShare } from '../share'

describe('getStatementShareLinks', () => {
  test('returns links for all platforms', () => {
    const links = getStatementShareLinks('abc', 'A summary', 'Lula')
    expect(links.twitter).toContain('twitter.com')
    expect(links.facebook).toContain('facebook.com')
    expect(links.whatsapp).toContain('wa.me')
    expect(links.telegram).toContain('t.me')
    expect(links.linkedin).toContain('linkedin.com')
    expect(links.email.startsWith('mailto:')).toBe(true)
    expect(links.copy).toContain('/declaracao/abc')
  })
  test('encodes summary in twitter link', () => {
    const links = getStatementShareLinks('x', 'Hello world', 'Lula')
    expect(decodeURIComponent(links.twitter)).toContain('Hello world')
  })
})

describe('getPoliticianShareLinks', () => {
  test('returns share links', () => {
    const links = getPoliticianShareLinks('lula', 'Lula', 'PT')
    expect(links.copy).toContain('/politico/lula')
    expect(links.twitter).toContain('twitter.com')
  })
})

describe('nativeShare', () => {
  afterEach(() => {
    // Clean up
    try { delete (globalThis as any).navigator } catch { /* ignore */ }
  })

  test('returns false without navigator.share', async () => {
    try {
      Object.defineProperty(globalThis, 'navigator', { value: {}, configurable: true })
    } catch { return }
    expect(await nativeShare('t', 'x', '/')).toBe(false)
  })

  test('returns true when navigator.share resolves', async () => {
    try {
      Object.defineProperty(globalThis, 'navigator', {
        value: { share: vi.fn().mockResolvedValue(undefined) },
        configurable: true,
      })
    } catch { return }
    expect(await nativeShare('t', 'x', '/')).toBe(true)
  })

  test('returns false when navigator.share rejects', async () => {
    try {
      Object.defineProperty(globalThis, 'navigator', {
        value: { share: vi.fn().mockRejectedValue(new Error('cancelled')) },
        configurable: true,
      })
    } catch { return }
    expect(await nativeShare('t', 'x', '/')).toBe(false)
  })
})
