import { statementsOnDayOfYear } from '@/lib/on-this-day/queries'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /hoje-na-historia/feed.json — JSON Feed 1.1 of today's MM-DD
 * historical callbacks across every year. Subscribers get a fresh
 * JSON payload daily.
 */
export async function GET() {
  const now = new Date()
  const rows = await statementsOnDayOfYear(now.getMonth() + 1, now.getDate(), 100)

  const items = rows.map((r) => {
    const url = `${SITE_URL}/declaracao/${r.slug ?? r.id}`
    const year = Number(r.statement_date.slice(0, 4))
    return {
      id: url,
      url,
      title: `${year} · ${r.politician_name}: ${r.summary.slice(0, 120)}`,
      summary: r.summary,
      content_html: `<p>${escapeHtml(r.summary)}</p>`,
      date_published: new Date(r.statement_date + 'T12:00:00Z').toISOString(),
      authors: [{
        name: r.politician_name + (r.politician_party ? ` (${r.politician_party}${r.politician_state ? '-' + r.politician_state : ''})` : ''),
      }],
      tags: [String(year), r.verification_status],
      _registra_brasil: {
        severity: r.severity_score,
        verification: r.verification_status,
      },
    }
  })

  const feed = {
    version: 'https://jsonfeed.org/version/1.1',
    title: 'Registra Brasil — Hoje na história',
    home_page_url: `${SITE_URL}/hoje-na-historia`,
    feed_url: `${SITE_URL}/hoje-na-historia/feed.json`,
    description: 'Declarações feitas no mesmo dia (MM-DD) em anos anteriores.',
    language: 'pt-BR',
    items,
  }
  return new Response(JSON.stringify(feed), {
    headers: {
      'Content-Type': 'application/feed+json; charset=utf-8',
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
    },
  })
}

function escapeHtml(s: string): string {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
}
