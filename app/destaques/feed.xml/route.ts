import { NextResponse } from 'next/server'
import { computeMonthlyRecap, currentMonth, monthLabel } from '@/lib/monthly-recap/compute'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

function esc(s: string): string {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&apos;')
}

/**
 * RSS version of /destaques — the 20 statements that ranked highest by
 * severity in the current calendar month. Regenerates hourly.
 */
export async function GET() {
  const month = currentMonth()
  const recap = await computeMonthlyRecap(month)
  const items = (recap?.topByseverity ?? []).map((s) => {
    const url = `${SITE_URL}/declaracao/${s.slug ?? s.id}`
    const title = `${s.politician_name}: ${s.summary.slice(0, 120)}`
    return `
    <item>
      <title>${esc(title)}</title>
      <link>${esc(url)}</link>
      <guid isPermaLink="true">${esc(url)}</guid>
      <pubDate>${new Date(s.statement_date + 'T12:00:00Z').toUTCString()}</pubDate>
      <author>${esc(s.politician_name)}</author>
      <description>${esc(s.summary)}</description>
    </item>`
  }).join('')

  const xml = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>Destaques do mês — ${esc(monthLabel(month))} — Registra Brasil</title>
    <link>${SITE_URL}/destaques</link>
    <atom:link href="${SITE_URL}/destaques/feed.xml" rel="self" type="application/rss+xml" />
    <description>As 20 declarações de maior gravidade do mês corrente.</description>
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
