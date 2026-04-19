import { NextResponse } from 'next/server'
import { statementsOnDayOfYear, todayDateLabel } from '@/lib/on-this-day/queries'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

function esc(s: string): string {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&apos;')
}

/**
 * RSS of today's "hoje na história" — one feed that updates each
 * calendar day with statements from the matching MM-DD across all
 * years. Subscribers see a daily stream of historical callbacks.
 */
export async function GET() {
  const now = new Date()
  const month = now.getMonth() + 1
  const day = now.getDate()
  const rows = await statementsOnDayOfYear(month, day, 100)

  const items = rows.map((r) => {
    const url = `${SITE_URL}/declaracao/${r.slug ?? r.id}`
    const year = Number(r.statement_date.slice(0, 4))
    const title = `${year} · ${r.politician_name}: ${r.summary.slice(0, 120)}`
    return `
    <item>
      <title>${esc(title)}</title>
      <link>${esc(url)}</link>
      <guid isPermaLink="true">${esc(url)}</guid>
      <pubDate>${new Date(r.statement_date + 'T12:00:00Z').toUTCString()}</pubDate>
      <author>${esc(r.politician_name)}</author>
      <description>${esc(r.summary)}</description>
    </item>`
  }).join('')

  const xml = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>Hoje na história (${esc(todayDateLabel(month, day))}) — Registra Brasil</title>
    <link>${SITE_URL}/hoje-na-historia</link>
    <atom:link href="${SITE_URL}/hoje-na-historia/feed.xml" rel="self" type="application/rss+xml" />
    <description>Declarações políticas registradas em ${String(day).padStart(2, '0')}/${String(month).padStart(2, '0')} ao longo dos anos. Regenera a cada hora; o conteúdo muda quando o dia vira.</description>
    <language>pt-BR</language>
    <lastBuildDate>${new Date().toUTCString()}</lastBuildDate>${items}
  </channel>
</rss>`

  return new NextResponse(xml, {
    headers: {
      'Content-Type': 'application/rss+xml; charset=utf-8',
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=7200',
    },
  })
}
