import { describe, test, expect } from 'vitest'
import { buildOGMetadata, buildStatementOGMetadata, buildPoliticianOGMetadata } from '../open-graph'

describe('buildOGMetadata', () => {
  test('builds basic metadata', () => {
    const m = buildOGMetadata({ title: 'Test', path: '/test' })
    expect(m.title).toContain('Test')
    expect((m.openGraph as any).url).toContain('/test')
  })

  test('uses custom image', () => {
    const m = buildOGMetadata({ title: 'T', path: '/p', image: 'https://i.png' })
    expect((m.openGraph as any).images[0].url).toBe('https://i.png')
  })

  test('includes publishedTime for article', () => {
    const m = buildOGMetadata({ title: 'T', path: '/p', type: 'article', publishedTime: '2024-01-01' })
    expect((m.openGraph as any).publishedTime).toBe('2024-01-01')
  })

  test('uses locale', () => {
    const m = buildOGMetadata({ title: 'T', path: '/p' })
    expect((m.openGraph as any).locale).toBe('pt_BR')
  })

  test('includes twitter card', () => {
    const m = buildOGMetadata({ title: 'T', path: '/p' })
    expect(m.twitter?.card).toBe('summary_large_image')
  })

  test('adds tags when provided', () => {
    const m = buildOGMetadata({ title: 'T', path: '/p', tags: ['a', 'b'] })
    expect((m.openGraph as any).tags).toEqual(['a', 'b'])
  })
})

describe('buildStatementOGMetadata', () => {
  test('builds with politician info', () => {
    const m = buildStatementOGMetadata({
      summary: 's', politicianName: 'Lula', party: 'PT', slug: 'foo', date: '2024-01-01',
    })
    expect(m.title).toContain('Lula')
    expect((m.openGraph as any).url).toContain('/declaracao/foo')
    expect((m.openGraph as any).type).toBe('article')
  })
})

describe('buildPoliticianOGMetadata', () => {
  test('builds profile metadata', () => {
    const m = buildPoliticianOGMetadata({
      name: 'Lula', party: 'PT', state: 'SP', slug: 'lula',
    })
    expect(m.title).toContain('Lula')
    expect(m.title).toContain('SP')
    expect((m.openGraph as any).type).toBe('profile')
  })

  test('omits state label when null', () => {
    const m = buildPoliticianOGMetadata({
      name: 'X', party: 'Y', state: null, slug: 's',
    })
    expect(m.title).not.toContain(' - null')
  })
})
