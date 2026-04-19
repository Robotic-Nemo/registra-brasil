import { NextResponse } from 'next/server'
import { listPublishedContradictions } from '@/lib/contradictions/queries'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

function esc(s: string): string {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&apos;')
}

export async function GET() {
  const pairs = await listPublishedContradictions(30)
  const items = pairs.map((p) => {
    const url = `${SITE_URL}/contradicoes/${p.id}`
    const title = `${p.politician.common_name}: ${p.headline}`
    const desc =
      `<p>${esc(p.editor_note.slice(0, 400))}</p>` +
      `<p><em>Declaração A (${p.statement_low.statement_date}):</em> "${esc(p.statement_low.summary.slice(0, 200))}"</p>` +
      `<p><em>Declaração B (${p.statement_high.statement_date}):</em> "${esc(p.statement_high.summary.slice(0, 200))}"</p>`
    return `
    <item>
      <title>${esc(title)}</title>
      <link>${esc(url)}</link>
      <guid isPermaLink="true">${esc(url)}</guid>
      <pubDate>${new Date(p.created_at).toUTCString()}</pubDate>
      <author>${esc(p.politician.common_name)}</author>
      <description>${esc(desc)}</description>
    </item>`
  }).join('')

  const xml = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>Contradições — Registra Brasil</title>
    <link>${SITE_URL}/contradicoes</link>
    <atom:link href="${SITE_URL}/contradicoes/feed.xml" rel="self" type="application/rss+xml" />
    <description>Pares de declarações contraditórias recém-publicadas pelo Registra Brasil.</description>
    <language>pt-BR</language>
    <lastBuildDate>${new Date().toUTCString()}</lastBuildDate>${items}
  </channel>
</rss>`

  return new NextResponse(xml, {
    headers: {
      'Content-Type': 'application/rss+xml; charset=utf-8',
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
    },
  })
}
