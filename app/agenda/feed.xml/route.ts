import { NextResponse } from 'next/server'
import { listEvents, kindLabel } from '@/lib/agenda/queries'

export const runtime = 'nodejs'
export const revalidate = 600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

function esc(s: string): string {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&apos;')
}

export async function GET() {
  const events = await listEvents('upcoming', 60)
  const items = events.map((e) => {
    const url = `${SITE_URL}/agenda#${e.id}`
    const title = `${kindLabel(e.kind)}: ${e.title}`
    const desc =
      `<p><strong>${esc(new Date(e.event_date).toLocaleString('pt-BR'))}</strong>${e.location ? ` — ${esc(e.location)}` : ''}</p>` +
      `<p>${esc(e.summary)}</p>` +
      (e.source_url ? `<p><a href="${esc(e.source_url)}">Fonte</a></p>` : '')
    return `
    <item>
      <title>${esc(title)}</title>
      <link>${esc(url)}</link>
      <guid isPermaLink="false">event:${e.id}</guid>
      <pubDate>${new Date(e.event_date).toUTCString()}</pubDate>
      <description>${esc(desc)}</description>
    </item>`
  }).join('')

  const xml = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>Agenda política — Registra Brasil</title>
    <link>${SITE_URL}/agenda</link>
    <atom:link href="${SITE_URL}/agenda/feed.xml" rel="self" type="application/rss+xml" />
    <description>Próximos eventos políticos selecionados pela equipe do Registra Brasil.</description>
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
