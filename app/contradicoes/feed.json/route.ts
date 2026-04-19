import { listPublishedContradictions } from '@/lib/contradictions/queries'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /contradicoes/feed.json — JSON Feed 1.1 of the most recent
 * published contradiction pairs. Counterpart to /contradicoes/feed.xml.
 */
export async function GET() {
  const pairs = await listPublishedContradictions(30)
  const items = pairs.map((p) => {
    const url = `${SITE_URL}/contradicoes/${p.id}`
    const html =
      `<p>${escapeHtml(p.editor_note)}</p>` +
      `<p><em>Declaração A (${p.statement_low.statement_date}):</em> ${escapeHtml(p.statement_low.summary)}</p>` +
      `<p><em>Declaração B (${p.statement_high.statement_date}):</em> ${escapeHtml(p.statement_high.summary)}</p>`
    return {
      id: url,
      url,
      title: `${p.politician.common_name}: ${p.headline}`,
      summary: p.editor_note.slice(0, 300),
      content_html: html,
      date_published: new Date(p.created_at).toISOString(),
      authors: [{ name: p.politician.common_name }],
      tags: ['contradição', p.politician.common_name],
    }
  })

  const feed = {
    version: 'https://jsonfeed.org/version/1.1',
    title: 'Registra Brasil — Contradições',
    home_page_url: `${SITE_URL}/contradicoes`,
    feed_url: `${SITE_URL}/contradicoes/feed.json`,
    description: 'Pares de declarações contraditórias recém-publicadas.',
    language: 'pt-BR',
    items,
  }
  return new Response(JSON.stringify(feed), {
    headers: {
      'Content-Type': 'application/feed+json; charset=utf-8',
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=7200',
    },
  })
}

function escapeHtml(s: string): string {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
}
