import { describe, test, expect } from 'vitest'
import { buildTelegramShareUrl, formatStatementForTelegram, buildStatementTelegramUrl } from '../telegram'

describe('buildTelegramShareUrl', () => {
  test('builds URL with url param', () => {
    const url = buildTelegramShareUrl('https://ex.com')
    expect(url).toContain('t.me/share/url')
    expect(url).toContain('url=https')
  })

  test('includes optional text', () => {
    const url = buildTelegramShareUrl('https://ex.com', 'hello')
    expect(url).toContain('text=hello')
  })

  test('omits text when not provided', () => {
    expect(buildTelegramShareUrl('https://ex.com')).not.toContain('text=')
  })
})

describe('formatStatementForTelegram', () => {
  test('uses markdown bold for name', () => {
    const txt = formatStatementForTelegram({
      summary: 's', politicianName: 'Lula', party: 'PT', date: '2024-01-01', url: 'https://ex.com',
    })
    expect(txt).toContain('*Lula*')
  })

  test('includes markdown link', () => {
    const txt = formatStatementForTelegram({
      summary: 's', politicianName: 'L', party: 'P', date: '2024-01-01', url: 'https://ex.com',
    })
    expect(txt).toContain('[Ver no Registra Brasil](https://ex.com)')
  })
})

describe('buildStatementTelegramUrl', () => {
  test('includes politician name', () => {
    const url = buildStatementTelegramUrl({
      summary: 's', politicianName: 'Lula', url: 'https://ex.com',
    })
    expect(decodeURIComponent(url)).toContain('Lula')
  })
})
