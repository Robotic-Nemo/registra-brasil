import { CHANGELOG } from '@/lib/changelog/entries'

export const runtime = 'edge'
export const revalidate = 86400

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

function esc(s: string): string {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&apos;')
}

export async function GET() {
  const items = CHANGELOG.map((entry) => {
    const body = `<ul>${entry.changes.map((c) => `<li>${esc(c)}</li>`).join('')}</ul>`
    return `    <item>
      <title>${esc(`v${entry.version} — ${entry.title}`)}</title>
      <link>${SITE_URL}/changelog#v${esc(entry.version)}</link>
      <guid isPermaLink="false">rb-changelog:${entry.version}</guid>
      <pubDate>${new Date(entry.date + 'T00:00:00Z').toUTCString()}</pubDate>
      <description>${esc(entry.title)}</description>
      <content:encoded><![CDATA[${body}]]></content:encoded>
    </item>`
  }).join('\n')

  const self = `${SITE_URL}/changelog/feed.xml`
  const rss = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:content="http://purl.org/rss/1.0/modules/content/">
  <channel>
    <title>Changelog — Registra Brasil</title>
    <link>${SITE_URL}/changelog</link>
    <description>Histórico editorial de atualizações.</description>
    <language>pt-BR</language>
    <lastBuildDate>${new Date().toUTCString()}</lastBuildDate>
    <atom:link href="${esc(self)}" rel="self" type="application/rss+xml"/>
${items}
  </channel>
</rss>`

  return new Response(rss, {
    headers: {
      'Content-Type': 'application/rss+xml; charset=utf-8',
      'Cache-Control': 'public, s-maxage=86400, stale-while-revalidate=86400',
    },
  })
}
