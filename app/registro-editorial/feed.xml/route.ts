import { NextResponse } from 'next/server'
import { getPublicRevisionFeed, labelField } from '@/lib/moderation/feed'

export const runtime = 'nodejs'
export const revalidate = 600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

function xmlEscape(s: string): string {
  return s
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;')
}

export async function GET() {
  const rows = await getPublicRevisionFeed(100)

  const items = rows
    .map((r) => {
      const url = `${SITE_URL}/declaracao/${r.statement_slug ?? r.statement_id}`
      const keys = r.changed_keys.map(labelField).join(', ')
      const title = `Revisão #${r.revision_number} · ${r.politician_name}`
      const desc =
        `<p><strong>${xmlEscape(r.statement_summary.slice(0, 200))}</strong></p>` +
        (keys ? `<p>Campos alterados: ${xmlEscape(keys)}</p>` : '') +
        (r.reason ? `<p><em>${xmlEscape(r.reason)}</em></p>` : '')
      return `
    <item>
      <title>${xmlEscape(title)}</title>
      <link>${xmlEscape(url)}</link>
      <guid isPermaLink="false">rev:${r.revision_id}</guid>
      <pubDate>${new Date(r.created_at).toUTCString()}</pubDate>
      <description>${xmlEscape(desc)}</description>
    </item>`
    })
    .join('')

  const xml = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>Registro editorial — Registra Brasil</title>
    <link>${SITE_URL}/registro-editorial</link>
    <atom:link href="${SITE_URL}/registro-editorial/feed.xml" rel="self" type="application/rss+xml" />
    <description>Histórico público das últimas revisões em declarações do arquivo.</description>
    <language>pt-BR</language>
    <lastBuildDate>${new Date().toUTCString()}</lastBuildDate>${items}
  </channel>
</rss>`

  return new NextResponse(xml, {
    headers: {
      'Content-Type': 'application/rss+xml; charset=utf-8',
      'Cache-Control': 'public, max-age=300, s-maxage=600, stale-while-revalidate=1800',
    },
  })
}
