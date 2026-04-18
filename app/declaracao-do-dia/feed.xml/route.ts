import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getRecentPicks } from '@/lib/supabase/queries/daily-pick'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

function esc(s: string): string {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&apos;')
}

export async function GET() {
  const supabase = getSupabaseServiceClient()
  const picks = await getRecentPicks(supabase, 30)

  const items = picks.map((p) => {
    const s = p.statement
    const link = `${SITE_URL}/declaracao/${s.slug ?? s.id}`
    const polName = s.politicians?.common_name ?? ''
    const title = `${p.pickDate}${polName ? ' · ' + polName : ''}: ${s.summary.slice(0, 120)}`
    const body = [
      p.curatorNote ? `<p><em>${esc(p.curatorNote)}</em></p>` : '',
      `<blockquote>${esc(s.full_quote ?? s.summary)}</blockquote>`,
      `<p><a href="${esc(s.primary_source_url)}">Fonte primária</a></p>`,
    ].filter(Boolean).join('\n')
    return `    <item>
      <title>${esc(title)}</title>
      <link>${esc(link)}</link>
      <guid isPermaLink="false">pick:${p.pickDate}</guid>
      <pubDate>${new Date(p.pickDate).toUTCString()}</pubDate>
      <description>${esc(s.summary)}</description>
      <content:encoded><![CDATA[${body}]]></content:encoded>
    </item>`
  }).join('\n')

  const self = `${SITE_URL}/declaracao-do-dia/feed.xml`
  const rss = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:content="http://purl.org/rss/1.0/modules/content/">
  <channel>
    <title>Declaração do dia — Registra Brasil</title>
    <link>${SITE_URL}/declaracao-do-dia</link>
    <description>Picks editoriais diários do acervo Registra Brasil.</description>
    <language>pt-BR</language>
    <lastBuildDate>${new Date().toUTCString()}</lastBuildDate>
    <atom:link href="${esc(self)}" rel="self" type="application/rss+xml"/>
${items}
  </channel>
</rss>`

  return new Response(rss, {
    headers: {
      'Content-Type': 'application/rss+xml; charset=utf-8',
      'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=600',
    },
  })
}
