import { describe, test, expect } from 'vitest'
import { getSourceLabel, isOfficialSourceType, isVideoSourceType } from '../source-labels'

describe('getSourceLabel', () => {
  test('returns known label', () => {
    expect(getSourceLabel('youtube_video')).toBe('Vídeo YouTube')
  })
  test('returns "Outro" for other', () => {
    expect(getSourceLabel('other')).toBe('Outro')
  })
  test('falls back to input for unknown', () => {
    expect(getSourceLabel('unknown_type')).toBe('unknown_type')
  })
  test('returns camara tv label', () => {
    expect(getSourceLabel('camara_tv')).toBe('TV Câmara')
  })
  test('returns senado tv label', () => {
    expect(getSourceLabel('senado_tv')).toBe('TV Senado')
  })
  test('returns diario oficial label', () => {
    expect(getSourceLabel('diario_oficial')).toBe('Diário Oficial')
  })
})

describe('isOfficialSourceType', () => {
  test('camara_tv is official', () => {
    expect(isOfficialSourceType('camara_tv')).toBe(true)
  })
  test('senado_tv is official', () => {
    expect(isOfficialSourceType('senado_tv')).toBe(true)
  })
  test('diario_oficial is official', () => {
    expect(isOfficialSourceType('diario_oficial')).toBe(true)
  })
  test('transcript_pdf is official', () => {
    expect(isOfficialSourceType('transcript_pdf')).toBe(true)
  })
  test('youtube_video is not official', () => {
    expect(isOfficialSourceType('youtube_video')).toBe(false)
  })
  test('news_article is not official', () => {
    expect(isOfficialSourceType('news_article')).toBe(false)
  })
})

describe('isVideoSourceType', () => {
  test('youtube_video is video', () => {
    expect(isVideoSourceType('youtube_video')).toBe(true)
  })
  test('youtube_live_archive is video', () => {
    expect(isVideoSourceType('youtube_live_archive')).toBe(true)
  })
  test('camara_tv is video', () => {
    expect(isVideoSourceType('camara_tv')).toBe(true)
  })
  test('senado_tv is video', () => {
    expect(isVideoSourceType('senado_tv')).toBe(true)
  })
  test('transcript_pdf is not video', () => {
    expect(isVideoSourceType('transcript_pdf')).toBe(false)
  })
  test('diario_oficial is not video', () => {
    expect(isVideoSourceType('diario_oficial')).toBe(false)
  })
})
