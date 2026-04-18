import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'edge'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

function esc(s: string): string {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&apos;')
}

export async function GET(
  _req: NextRequest,
  { params }: { params: Promise<{ uf: string }> },
) {
  const { uf } = await params
  const ufUpper = uf.toUpperCase()
  if (!/^[A-Z]{2}$/.test(ufUpper)) return new Response('Bad UF', { status: 400 })

  const supabase = getSupabaseServiceClient()

  const { data: polIds } = await (supabase.from('politicians') as any)
    .select('id')
    .eq('state', ufUpper)
    .eq('is_active', true)

  const ids = ((polIds ?? []) as { id: string }[]).map((p) => p.id)
  if (ids.length === 0) return new Response('No data', { status: 404 })

  const { data: rows } = await (supabase.from('statements') as any)
    .select('id, slug, summary, full_quote, statement_date, primary_source_url, verification_status, politicians(common_name, party, state)')
    .in('politician_id', ids)
    .neq('verification_status', 'removed')
    .order('statement_date', { ascending: false })
    .limit(50)

  const items = ((rows ?? []) as any[]).map((s) => {
    const link = `${SITE_URL}/declaracao/${s.slug ?? s.id}`
    const pol = s.politicians ? `${s.politicians.common_name} (${s.politicians.party}-${s.politicians.state})` : ''
    return `    <item>
      <title>${esc(pol + ': ' + s.summary.slice(0, 140))}</title>
      <link>${esc(link)}</link>
      <guid isPermaLink="true">${esc(link)}</guid>
      <pubDate>${new Date(s.statement_date).toUTCString()}</pubDate>
      <description>${esc(s.summary)}</description>
      <author>${esc(s.politicians?.common_name ?? '')}</author>
    </item>`
  }).join('\n')

  const selfUrl = `${SITE_URL}/estados/${ufUpper}/feed.xml`
  const rss = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>Declarações de políticos de ${esc(ufUpper)} — Registra Brasil</title>
    <link>${SITE_URL}/estados/${esc(ufUpper)}</link>
    <description>Declarações de parlamentares e governantes ligados a ${esc(ufUpper)}.</description>
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
