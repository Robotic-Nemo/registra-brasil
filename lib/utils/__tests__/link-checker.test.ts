import { describe, test, expect, vi, afterEach } from 'vitest'
import { checkLink, checkLinks, classifySourceDomain } from '../link-checker'

const ORIG_FETCH = globalThis.fetch

describe('classifySourceDomain', () => {
  test('detects gov.br as governo', () => {
    expect(classifySourceDomain('https://planalto.gov.br')).toBe('governo')
  })
  test('detects camara.leg.br', () => {
    expect(classifySourceDomain('https://www.camara.leg.br/x')).toBe('camara')
  })
  test('detects senado.leg.br', () => {
    expect(classifySourceDomain('https://senado.leg.br/')).toBe('senado')
  })
  test('detects youtube.com', () => {
    expect(classifySourceDomain('https://youtube.com/watch')).toBe('video')
  })
  test('detects twitter.com as rede_social', () => {
    expect(classifySourceDomain('https://twitter.com/user')).toBe('rede_social')
  })
  test('detects globo.com as midia', () => {
    expect(classifySourceDomain('https://g1.globo.com/x')).toBe('midia')
  })
  test('returns outro for unknown', () => {
    expect(classifySourceDomain('https://example.com')).toBe('outro')
  })
  test('returns desconhecido on invalid URL', () => {
    expect(classifySourceDomain('not a url')).toBe('desconhecido')
  })
  test('strips www prefix', () => {
    expect(classifySourceDomain('https://www.youtube.com/watch')).toBe('video')
  })
})

describe('checkLink', () => {
  afterEach(() => { globalThis.fetch = ORIG_FETCH })

  test('returns accessible true for 200', async () => {
    globalThis.fetch = vi.fn().mockResolvedValue({
      ok: true, status: 200, redirected: false, url: '',
    }) as any
    const r = await checkLink('https://ex.com')
    expect(r.accessible).toBe(true)
    expect(r.statusCode).toBe(200)
  })

  test('returns accessible false for 404', async () => {
    globalThis.fetch = vi.fn().mockResolvedValue({
      ok: false, status: 404, redirected: false, url: '',
    }) as any
    const r = await checkLink('https://ex.com')
    expect(r.accessible).toBe(false)
    expect(r.statusCode).toBe(404)
  })

  test('retries with GET on HEAD failure', async () => {
    let count = 0
    globalThis.fetch = vi.fn().mockImplementation(async () => {
      count++
      if (count === 1) throw new Error('head fail')
      return { ok: true, status: 206, redirected: false, url: '' }
    }) as any
    const r = await checkLink('https://ex.com')
    expect(r.accessible).toBe(true)
    expect(count).toBe(2)
  })

  test('records redirect URL', async () => {
    globalThis.fetch = vi.fn().mockResolvedValue({
      ok: true, status: 200, redirected: true, url: 'https://other.com',
    }) as any
    expect((await checkLink('https://ex.com')).redirectUrl).toBe('https://other.com')
  })

  test('returns error when both HEAD and GET fail', async () => {
    globalThis.fetch = vi.fn().mockRejectedValue(new Error('network')) as any
    const r = await checkLink('https://ex.com')
    expect(r.accessible).toBe(false)
    expect(r.error).toBeTruthy()
  })
})

describe('checkLinks', () => {
  afterEach(() => { globalThis.fetch = ORIG_FETCH })

  test('returns array of results', async () => {
    globalThis.fetch = vi.fn().mockResolvedValue({ ok: true, status: 200, redirected: false, url: '' }) as any
    const results = await checkLinks(['https://a.com', 'https://b.com'], { concurrency: 2 })
    expect(results).toHaveLength(2)
  })

  test('empty array returns empty', async () => {
    expect(await checkLinks([])).toEqual([])
  })
})
