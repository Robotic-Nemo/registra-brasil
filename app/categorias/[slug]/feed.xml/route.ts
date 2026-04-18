import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'edge'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

function esc(s: string): string {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&apos;')
}

/**
 * Per-category RSS — journalists subscribe to a single topic without
 * pulling the firehose /feed.xml.
 */
export async function GET(
  _req: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const { slug } = await params
  const supabase = getSupabaseServiceClient()

  const { data: category } = await (supabase.from('categories') as any)
    .select('id, slug, label_pt, description_pt')
    .eq('slug', slug)
    .maybeSingle()

  if (!category) return new Response('Not found', { status: 404 })

  const { data: joinRows } = await (supabase.from('statement_categories') as any)
    .select('statements(id, slug, summary, full_quote, context, statement_date, primary_source_url, verification_status, politicians(common_name, party, state))')
    .eq('category_id', category.id)
    .order('statements(statement_date)', { ascending: false })
    .limit(50)

  const items = ((joinRows ?? []) as Array<{ statements: any }>)
    .map((r) => r.statements)
    .filter((s) => s && s.verification_status !== 'removed')
    .map((s) => {
      const link = `${SITE_URL}/declaracao/${s.slug ?? s.id}`
      const polName = s.politicians?.common_name ?? ''
      const party = s.politicians?.party ? ` (${s.politicians.party}${s.politicians.state ? '-' + s.politicians.state : ''})` : ''
      const content = [
        `<h2>${esc(s.summary)}</h2>`,
        s.full_quote ? `<blockquote>${esc(s.full_quote)}</blockquote>` : '',
        s.context ? `<p><strong>Contexto:</strong> ${esc(s.context)}</p>` : '',
        `<p><a href="${esc(s.primary_source_url)}">Fonte primária</a></p>`,
      ].filter(Boolean).join('\n')

      return `    <item>
      <title>${esc(polName + party + ': ' + s.summary.slice(0, 140))}</title>
      <link>${esc(link)}</link>
      <guid isPermaLink="true">${esc(link)}</guid>
      <pubDate>${new Date(s.statement_date).toUTCString()}</pubDate>
      <description>${esc(s.summary)}</description>
      <content:encoded><![CDATA[${content}]]></content:encoded>
      <author>${esc(polName)}</author>
    </item>`
    }).join('\n')

  const selfUrl = `${SITE_URL}/categorias/${category.slug}/feed.xml`
  const rss = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:content="http://purl.org/rss/1.0/modules/content/">
  <channel>
    <title>${esc(category.label_pt)} — Registra Brasil</title>
    <link>${SITE_URL}/categorias/${esc(category.slug)}</link>
    <description>${esc(category.description_pt ?? `Declarações da categoria ${category.label_pt}`)}</description>
    <language>pt-BR</language>
    <lastBuildDate>${new Date().toUTCString()}</lastBuildDate>
    <atom:link href="${esc(selfUrl)}" rel="self" type="application/rss+xml"/>
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
