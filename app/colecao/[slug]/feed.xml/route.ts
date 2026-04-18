import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'edge'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

function escapeXml(s: string): string {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&apos;')
}

export async function GET(
  _req: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const { slug } = await params
  const supabase = getSupabaseServiceClient()

  const { data: collection } = await (supabase.from('collections') as any)
    .select('id, slug, title, subtitle, description')
    .eq('slug', slug)
    .eq('is_published', true)
    .maybeSingle()

  if (!collection) return new Response('Not found', { status: 404 })

  const { data: rows } = await (supabase.from('collection_statements') as any)
    .select('position, statement_id, statements(id, slug, summary, statement_date, primary_source_url, politicians(common_name))')
    .eq('collection_id', collection.id)
    .order('position', { ascending: true })
    .limit(50)

  const items = ((rows ?? []) as Array<{ statements: any }>)
    .map((r) => r.statements)
    .filter(Boolean)
    .map((s) => {
      const link = `${SITE_URL}/declaracao/${s.slug ?? s.id}`
      const title = `${s.politicians?.common_name ?? ''}: ${s.summary}`.slice(0, 180)
      return `    <item>
      <title>${escapeXml(title)}</title>
      <link>${escapeXml(link)}</link>
      <guid isPermaLink="true">${escapeXml(link)}</guid>
      <pubDate>${new Date(s.statement_date).toUTCString()}</pubDate>
      <description>${escapeXml(s.summary)}</description>
    </item>`
    })
    .join('\n')

  const selfUrl = `${SITE_URL}/colecao/${collection.slug}/feed.xml`
  const rss = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>${escapeXml(collection.title)} — Registra Brasil</title>
    <link>${SITE_URL}/colecao/${escapeXml(collection.slug)}</link>
    <description>${escapeXml(collection.subtitle ?? collection.description ?? '')}</description>
    <language>pt-BR</language>
    <lastBuildDate>${new Date().toUTCString()}</lastBuildDate>
    <atom:link href="${escapeXml(selfUrl)}" rel="self" type="application/rss+xml"/>
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
