import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getRecentStatements } from '@/lib/supabase/queries/statements'

export const runtime = 'edge'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

function escapeXml(str: string): string {
  return str
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;')
}

/**
 * GET /feed.atom — Atom 1.0 feed of recent verified statements.
 * Sibling to /feed.xml (RSS 2.0). Atom has stricter date + id
 * semantics, which some aggregators (e.g. Feedly, Inoreader)
 * prefer for dedup.
 */
export async function GET() {
  const updated = new Date().toISOString()
  try {
    const supabase = getSupabaseServiceClient()
    const statements = await getRecentStatements(supabase, 30)

    const entries = statements.map((s) => {
      const link = `${SITE_URL}/declaracao/${s.slug ?? s.id}`
      const author = s.politicians.common_name
      const published = new Date(s.statement_date).toISOString()
      const categories = s.statement_categories
        .map((sc) => `    <category term="${escapeXml(sc.categories.slug ?? sc.categories.label_pt)}" label="${escapeXml(sc.categories.label_pt)}"/>`)
        .join('\n')

      const contentParts: string[] = [`<h2>${escapeXml(s.summary)}</h2>`]
      if (s.full_quote) contentParts.push(`<blockquote>${escapeXml(s.full_quote)}</blockquote>`)
      if (s.context) contentParts.push(`<p><strong>Contexto:</strong> ${escapeXml(s.context)}</p>`)
      if (s.venue) contentParts.push(`<p><strong>Local:</strong> ${escapeXml(s.venue)}${s.event_name ? ` — ${escapeXml(s.event_name)}` : ''}</p>`)
      contentParts.push(`<p><a href="${escapeXml(s.primary_source_url)}">Fonte original</a></p>`)
      const content = `<![CDATA[${contentParts.join('\n')}]]>`

      return `  <entry>
    <id>${escapeXml(link)}</id>
    <title>${escapeXml(`${author}: ${s.summary.slice(0, 120)}`)}</title>
    <link rel="alternate" type="text/html" href="${escapeXml(link)}"/>
    <published>${published}</published>
    <updated>${published}</updated>
    <author><name>${escapeXml(author)}</name></author>
    <summary>${escapeXml(s.summary)}</summary>
    <content type="html">${content}</content>
${categories}
  </entry>`
    })

    const atom = `<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
  <id>${SITE_URL}/</id>
  <title>Registra Brasil</title>
  <subtitle>Arquivo público de declarações de políticos brasileiros</subtitle>
  <link rel="self" type="application/atom+xml" href="${SITE_URL}/feed.atom"/>
  <link rel="alternate" type="text/html" href="${SITE_URL}/"/>
  <updated>${updated}</updated>
${entries.join('\n')}
</feed>`

    return new Response(atom, {
      headers: {
        'Content-Type': 'application/atom+xml; charset=utf-8',
        'Cache-Control': 'public, max-age=600, s-maxage=1800, stale-while-revalidate=3600',
      },
    })
  } catch (err) {
    console.error('[feed.atom] Failed:', err)
    const empty = `<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
  <id>${SITE_URL}/</id>
  <title>Registra Brasil</title>
  <link rel="self" type="application/atom+xml" href="${SITE_URL}/feed.atom"/>
  <updated>${updated}</updated>
</feed>`
    return new Response(empty, {
      headers: {
        'Content-Type': 'application/atom+xml; charset=utf-8',
        'Cache-Control': 'no-store',
      },
    })
  }
}
