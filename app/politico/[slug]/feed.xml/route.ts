import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'edge'
export const revalidate = 3600

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
 * Per-politician RSS feed. Journalists and researchers can subscribe
 * to a single politician without polling the catalog-wide /feed.xml.
 */
export async function GET(
  _req: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const { slug } = await params
  const supabase = getSupabaseServiceClient()

  const { data: politician } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name, full_name, party, state')
    .eq('slug', slug)
    .maybeSingle()

  if (!politician) {
    return new Response('Not found', { status: 404 })
  }

  const { data: rows } = await (supabase.from('statements') as any)
    .select('id, slug, summary, full_quote, context, statement_date, primary_source_url, primary_source_type, venue, event_name, created_at, verification_status')
    .eq('politician_id', politician.id)
    .neq('verification_status', 'removed')
    .order('statement_date', { ascending: false })
    .limit(50)

  const items = (rows ?? []).map((s: any) => {
    const link = `${SITE_URL}/declaracao/${s.slug ?? s.id}`
    const contentParts = [
      `<h2>${escapeXml(s.summary)}</h2>`,
      s.full_quote ? `<blockquote>${escapeXml(s.full_quote)}</blockquote>` : '',
      s.context ? `<p><strong>Contexto:</strong> ${escapeXml(s.context)}</p>` : '',
      s.venue ? `<p><strong>Local:</strong> ${escapeXml(s.venue)}${s.event_name ? ` — ${escapeXml(s.event_name)}` : ''}</p>` : '',
      `<p><a href="${escapeXml(s.primary_source_url)}">Fonte primária</a></p>`,
    ].filter(Boolean)

    return `    <item>
      <title>${escapeXml(s.summary.slice(0, 140))}</title>
      <link>${escapeXml(link)}</link>
      <guid isPermaLink="true">${escapeXml(link)}</guid>
      <pubDate>${new Date(s.statement_date).toUTCString()}</pubDate>
      <description>${escapeXml(s.summary)}</description>
      <content:encoded><![CDATA[${contentParts.join('\n')}]]></content:encoded>
      <author>${escapeXml(politician.common_name)}</author>
      <category>${escapeXml(s.verification_status)}</category>
    </item>`
  })

  const selfUrl = `${SITE_URL}/politico/${politician.slug}/feed.xml`
  const title = `${politician.common_name} — Registra Brasil`
  const desc = `Declarações registradas de ${politician.common_name} (${politician.party}${politician.state ? '-' + politician.state : ''})`

  const rss = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:content="http://purl.org/rss/1.0/modules/content/">
  <channel>
    <title>${escapeXml(title)}</title>
    <link>${SITE_URL}/politico/${escapeXml(politician.slug)}</link>
    <description>${escapeXml(desc)}</description>
    <language>pt-BR</language>
    <lastBuildDate>${new Date().toUTCString()}</lastBuildDate>
    <atom:link href="${escapeXml(selfUrl)}" rel="self" type="application/rss+xml"/>
${items.join('\n')}
  </channel>
</rss>`

  return new Response(rss, {
    headers: {
      'Content-Type': 'application/rss+xml; charset=utf-8',
      'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=600',
    },
  })
}
