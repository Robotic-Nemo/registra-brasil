import { describe, test, expect } from 'vitest'
import { buildRssFeed, rssHeaders } from '../rss-builder'

describe('buildRssFeed', () => {
  test('includes basic channel info', () => {
    const feed = buildRssFeed({ title: 'T', description: 'D', link: 'https://ex.com' }, [])
    expect(feed).toContain('<title>T</title>')
    expect(feed).toContain('<description>D</description>')
    expect(feed).toContain('<link>https://ex.com</link>')
  })

  test('defaults language to pt-BR', () => {
    const feed = buildRssFeed({ title: 't', description: 'd', link: 'https://ex.com' }, [])
    expect(feed).toContain('<language>pt-BR</language>')
  })

  test('escapes XML', () => {
    const feed = buildRssFeed({ title: 'A & B', description: '<script>', link: '/' }, [])
    expect(feed).toContain('A &amp; B')
    expect(feed).toContain('&lt;script&gt;')
  })

  test('includes items', () => {
    const feed = buildRssFeed(
      { title: 'T', description: 'D', link: 'https://ex.com' },
      [{ title: 'Item1', description: 'desc', link: 'https://ex.com/1', pubDate: '2024-01-01' }],
    )
    expect(feed).toContain('<item>')
    expect(feed).toContain('<title>Item1</title>')
  })

  test('includes TTL and atom self-link when provided', () => {
    const feed = buildRssFeed(
      { title: 't', description: 'd', link: '/', ttl: 60, selfLink: 'https://ex.com/feed' },
      [],
    )
    expect(feed).toContain('<ttl>60</ttl>')
    expect(feed).toContain('atom:link')
  })

  test('strips illegal XML chars', () => {
    const feed = buildRssFeed(
      { title: 't', description: 'd', link: '/' },
      [{ title: 'bad\x00here', description: 'd', link: '/', pubDate: '' }],
    )
    expect(feed).not.toContain('\x00')
  })

  test('handles invalid dates gracefully', () => {
    const feed = buildRssFeed(
      { title: 't', description: 'd', link: '/' },
      [{ title: 'x', description: 'd', link: '/', pubDate: 'not-a-date' }],
    )
    expect(feed).toContain('<pubDate>')
  })

  test('includes categories', () => {
    const feed = buildRssFeed(
      { title: 't', description: 'd', link: '/' },
      [{ title: 'x', description: 'd', link: '/', pubDate: '', categories: ['a', 'b'] }],
    )
    expect(feed).toContain('<category>a</category>')
    expect(feed).toContain('<category>b</category>')
  })
})

describe('rssHeaders', () => {
  test('sets rss+xml content type', () => {
    const h = rssHeaders() as Record<string, string>
    expect(h['Content-Type']).toContain('application/rss+xml')
  })
  test('sets cache-control', () => {
    const h = rssHeaders() as Record<string, string>
    expect(h['Cache-Control']).toContain('public')
  })
})
