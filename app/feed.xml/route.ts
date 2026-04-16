import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getRecentStatements } from '@/lib/supabase/queries/statements'

export const runtime = 'edge'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

function escapeXml(str: string): string {
  return str
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;')
}

const EMPTY_RSS = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>Registra Brasil</title>
    <link>${SITE_URL}</link>
    <description>Arquivo público de declarações de políticos brasileiros</description>
    <language>pt-BR</language>
    <lastBuildDate>${new Date().toUTCString()}</lastBuildDate>
    <atom:link href="${SITE_URL}/feed.xml" rel="self" type="application/rss+xml"/>
  </channel>
</rss>`

export async function GET() {
  try {
    const supabase = getSupabaseServiceClient()
    const statements = await getRecentStatements(supabase, 30)

    const items = statements.map((s) => {
      const link = `${SITE_URL}/declaracao/${s.slug ?? s.id}`
      const categories = s.statement_categories
        .map((sc) => `<category>${escapeXml(sc.categories.label_pt)}</category>`)
        .join('\n        ')

      const contentParts: string[] = [
        `<h2>${escapeXml(s.summary)}</h2>`,
      ]
      if (s.full_quote) {
        contentParts.push(`<blockquote>${escapeXml(s.full_quote)}</blockquote>`)
      }
      if (s.context) {
        contentParts.push(`<p><strong>Contexto:</strong> ${escapeXml(s.context)}</p>`)
      }
      if (s.venue) {
        contentParts.push(`<p><strong>Local:</strong> ${escapeXml(s.venue)}${s.event_name ? ` — ${escapeXml(s.event_name)}` : ''}</p>`)
      }
      contentParts.push(`<p><a href="${escapeXml(s.primary_source_url)}">Ver fonte original</a></p>`)

      const contentEncoded = `<![CDATA[${contentParts.join('\n')}]]>`

      return `    <item>
      <title>${escapeXml(`${s.politicians.common_name}: ${s.summary.slice(0, 100)}`)}</title>
      <link>${escapeXml(link)}</link>
      <guid isPermaLink="true">${escapeXml(link)}</guid>
      <pubDate>${new Date(s.statement_date).toUTCString()}</pubDate>
      <description>${escapeXml(s.summary)}</description>
      <content:encoded>${contentEncoded}</content:encoded>
      <author>${escapeXml(s.politicians.common_name)}${s.politicians.party ? ` (${escapeXml(s.politicians.party)}${s.politicians.state ? `-${escapeXml(s.politicians.state)}` : ''})` : ''}</author>
      ${categories}
      <source url="${escapeXml(s.primary_source_url)}">${escapeXml(s.primary_source_type.replace(/_/g, ' '))}</source>
    </item>`
    })

    const rss = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:content="http://purl.org/rss/1.0/modules/content/">
  <channel>
    <title>Registra Brasil</title>
    <link>${SITE_URL}</link>
    <description>Arquivo público de declarações de políticos brasileiros</description>
    <language>pt-BR</language>
    <lastBuildDate>${new Date().toUTCString()}</lastBuildDate>
    <atom:link href="${SITE_URL}/feed.xml" rel="self" type="application/rss+xml"/>
${items.join('\n')}
  </channel>
</rss>`

    return new Response(rss, {
      headers: {
        'Content-Type': 'application/rss+xml; charset=utf-8',
        'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=600',
      },
    })
  } catch (err) {
    console.error('[feed.xml] Failed to generate RSS feed:', err)
    return new Response(EMPTY_RSS, {
      status: 200,
      headers: {
        'Content-Type': 'application/rss+xml; charset=utf-8',
        'Cache-Control': 'no-store',
      },
    })
  }
}
