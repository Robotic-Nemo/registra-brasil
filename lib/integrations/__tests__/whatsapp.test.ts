import { describe, test, expect } from 'vitest'
import { buildWhatsAppShareUrl, formatStatementForWhatsApp, buildStatementWhatsAppUrl } from '../whatsapp'

describe('buildWhatsAppShareUrl', () => {
  test('builds valid URL', () => {
    const url = buildWhatsAppShareUrl('hello')
    expect(url).toContain('api.whatsapp.com/send')
    expect(url).toContain('text=hello')
  })
  test('URL-encodes special chars', () => {
    expect(buildWhatsAppShareUrl('a b&c')).toContain('a+b%26c')
  })
})

describe('formatStatementForWhatsApp', () => {
  test('includes bold politician name', () => {
    const txt = formatStatementForWhatsApp({
      summary: 's', politicianName: 'Lula', party: 'PT', date: '2024-01-01', url: 'https://ex.com',
    })
    expect(txt).toContain('*Lula*')
    expect(txt).toContain('(PT)')
  })

  test('includes URL at end', () => {
    const txt = formatStatementForWhatsApp({
      summary: 's', politicianName: 'L', party: 'P', date: '2024-01-01', url: 'https://ex.com/x',
    })
    expect(txt.endsWith('https://ex.com/x')).toBe(true)
  })
})

describe('buildStatementWhatsAppUrl', () => {
  test('returns share URL with encoded content', () => {
    const url = buildStatementWhatsAppUrl({
      summary: 's', politicianName: 'L', party: 'P', date: '2024-01-01', url: 'https://ex.com',
    })
    expect(url).toContain('api.whatsapp.com')
    expect(decodeURIComponent(url)).toContain('*L*')
  })
})
