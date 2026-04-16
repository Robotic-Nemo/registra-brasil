import { describe, test, expect, vi, afterEach } from 'vitest'
import { getWaybackSnapshot, buildWaybackUrl, requestWaybackSave } from '../archive-org'

const ORIG_FETCH = globalThis.fetch

describe('buildWaybackUrl', () => {
  test('uses wildcard when no timestamp', () => {
    expect(buildWaybackUrl('https://example.com')).toBe('https://web.archive.org/web/*/https://example.com')
  })
  test('uses specific timestamp', () => {
    expect(buildWaybackUrl('https://example.com', '20240101')).toBe('https://web.archive.org/web/20240101/https://example.com')
  })
})

describe('getWaybackSnapshot', () => {
  afterEach(() => { globalThis.fetch = ORIG_FETCH })

  test('returns snapshot when available', async () => {
    globalThis.fetch = vi.fn().mockResolvedValue({
      ok: true,
      json: async () => ({
        archived_snapshots: {
          closest: { available: true, url: 'https://web.archive.org/web/20240101/https://example.com', timestamp: '20240101', status: '200' },
        },
      }),
    }) as any
    const snapshot = await getWaybackSnapshot('https://example.com')
    expect(snapshot).toEqual({
      url: 'https://web.archive.org/web/20240101/https://example.com',
      timestamp: '20240101',
      status: '200',
    })
  })

  test('returns null when snapshot not available', async () => {
    globalThis.fetch = vi.fn().mockResolvedValue({
      ok: true,
      json: async () => ({ archived_snapshots: {} }),
    }) as any
    expect(await getWaybackSnapshot('https://example.com')).toBeNull()
  })

  test('returns null on fetch error', async () => {
    globalThis.fetch = vi.fn().mockRejectedValue(new Error('fail')) as any
    expect(await getWaybackSnapshot('https://example.com')).toBeNull()
  })

  test('returns null on non-ok response', async () => {
    globalThis.fetch = vi.fn().mockResolvedValue({ ok: false }) as any
    expect(await getWaybackSnapshot('https://example.com')).toBeNull()
  })
})

describe('requestWaybackSave', () => {
  afterEach(() => { globalThis.fetch = ORIG_FETCH })

  test('success for ok response', async () => {
    globalThis.fetch = vi.fn().mockResolvedValue({
      ok: true, status: 200, headers: { get: () => null },
    }) as any
    const r = await requestWaybackSave('https://example.com')
    expect(r.success).toBe(true)
  })

  test('failure for 500', async () => {
    globalThis.fetch = vi.fn().mockResolvedValue({
      ok: false, status: 500, headers: { get: () => null },
    }) as any
    const r = await requestWaybackSave('https://example.com')
    expect(r.success).toBe(false)
  })

  test('failure on thrown error', async () => {
    globalThis.fetch = vi.fn().mockRejectedValue(new Error('x')) as any
    const r = await requestWaybackSave('https://example.com')
    expect(r.success).toBe(false)
  })
})
