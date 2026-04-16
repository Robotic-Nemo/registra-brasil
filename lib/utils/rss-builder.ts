/**
 * RSS 2.0 feed builder utility.
 */

interface RssChannel {
  title: string
  description: string
  link: string
  language?: string
  lastBuildDate?: string
  ttl?: number
  selfLink?: string
  imageUrl?: string
}

interface RssItem {
  title: string
  description: string
  link: string
  pubDate: string
  guid?: string
  author?: string
  categories?: string[]
}

function escapeXml(str: string): string {
  return str
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;')
}

export function buildRssFeed(channel: RssChannel, items: RssItem[]): string {
  const lines: string[] = [
    '<?xml version="1.0" encoding="UTF-8"?>',
    '<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">',
    '<channel>',
    `<title>${escapeXml(channel.title)}</title>`,
    `<description>${escapeXml(channel.description)}</description>`,
    `<link>${escapeXml(channel.link)}</link>`,
    `<language>${channel.language ?? 'pt-BR'}</language>`,
    '<generator>Registra Brasil</generator>',
  ]

  if (channel.lastBuildDate) {
    lines.push(`<lastBuildDate>${new Date(channel.lastBuildDate).toUTCString()}</lastBuildDate>`)
  }
  if (channel.ttl) {
    lines.push(`<ttl>${channel.ttl}</ttl>`)
  }
  if (channel.selfLink) {
    lines.push(`<atom:link href="${escapeXml(channel.selfLink)}" rel="self" type="application/rss+xml"/>`)
  }
  if (channel.imageUrl) {
    lines.push(
      '<image>',
      `<url>${escapeXml(channel.imageUrl)}</url>`,
      `<title>${escapeXml(channel.title)}</title>`,
      `<link>${escapeXml(channel.link)}</link>`,
      '</image>'
    )
  }

  for (const item of items) {
    lines.push('<item>')
    lines.push(`<title>${escapeXml(item.title)}</title>`)
    lines.push(`<description>${escapeXml(item.description)}</description>`)
    lines.push(`<link>${escapeXml(item.link)}</link>`)
    lines.push(`<pubDate>${new Date(item.pubDate).toUTCString()}</pubDate>`)
    lines.push(`<guid isPermaLink="true">${escapeXml(item.guid ?? item.link)}</guid>`)
    if (item.author) {
      lines.push(`<author>${escapeXml(item.author)}</author>`)
    }
    if (item.categories) {
      for (const cat of item.categories) {
        lines.push(`<category>${escapeXml(cat)}</category>`)
      }
    }
    lines.push('</item>')
  }

  lines.push('</channel>', '</rss>')
  return lines.join('\n')
}

/** Standard RSS response headers */
export function rssHeaders(): HeadersInit {
  return {
    'Content-Type': 'application/rss+xml; charset=utf-8',
    'Cache-Control': 'public, s-maxage=900, stale-while-revalidate=300',
  }
}
