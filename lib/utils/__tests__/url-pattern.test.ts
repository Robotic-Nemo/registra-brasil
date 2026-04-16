import { describe, test, expect } from 'vitest'
import { detectSourceType, isVideoUrl, isOfficialDomain } from '../url-pattern'

describe('detectSourceType', () => {
  test('detects youtube.com watch URLs', () => {
    expect(detectSourceType('https://www.youtube.com/watch?v=abc123')).toBe('youtube_video')
  })
  test('detects youtu.be URLs', () => {
    expect(detectSourceType('https://youtu.be/abc123')).toBe('youtube_video')
  })
  test('detects youtube live archives', () => {
    expect(detectSourceType('https://www.youtube.com/live/abc')).toBe('youtube_live_archive')
  })
  test('detects camara.leg.br TV URLs', () => {
    expect(detectSourceType('https://www.tv.camara.leg.br/foo')).toBe('camara_tv')
  })
  test('detects senado.leg.br TV URLs', () => {
    expect(detectSourceType('https://www.tv.senado.leg.br/foo')).toBe('senado_tv')
  })
  test('detects diario oficial', () => {
    expect(detectSourceType('https://www.in.gov.br/web/dou/doc')).toBe('diario_oficial')
  })
  test('detects PDF URLs', () => {
    expect(detectSourceType('https://example.com/doc.pdf')).toBe('transcript_pdf')
  })
  test('detects Twitter/X URLs', () => {
    expect(detectSourceType('https://twitter.com/user/status/1')).toBe('social_media_post')
    expect(detectSourceType('https://x.com/user/status/1')).toBe('social_media_post')
  })
  test('detects news article domains', () => {
    expect(detectSourceType('https://g1.globo.com/article')).toBe('news_article')
  })
  test('returns null for unknown URL', () => {
    expect(detectSourceType('https://example.com/foo')).toBeNull()
  })
  test('returns null for invalid URL', () => {
    expect(detectSourceType('not-a-url')).toBeNull()
  })
})

describe('isVideoUrl', () => {
  test('returns true for youtube', () => {
    expect(isVideoUrl('https://youtube.com/watch?v=1')).toBe(true)
  })
  test('returns true for camara TV', () => {
    expect(isVideoUrl('https://tv.camara.leg.br/foo')).toBe(true)
  })
  test('returns false for PDF', () => {
    expect(isVideoUrl('https://example.com/a.pdf')).toBe(false)
  })
  test('returns false for news', () => {
    expect(isVideoUrl('https://g1.globo.com/x')).toBe(false)
  })
})

describe('isOfficialDomain', () => {
  test('returns true for .gov.br', () => {
    expect(isOfficialDomain('https://planalto.gov.br')).toBe(true)
  })
  test('returns true for .leg.br', () => {
    expect(isOfficialDomain('https://camara.leg.br')).toBe(true)
  })
  test('returns true for .jus.br', () => {
    expect(isOfficialDomain('https://stf.jus.br')).toBe(true)
  })
  test('returns false for .com', () => {
    expect(isOfficialDomain('https://example.com')).toBe(false)
  })
  test('returns false for invalid URL', () => {
    expect(isOfficialDomain('bad')).toBe(false)
  })
})
