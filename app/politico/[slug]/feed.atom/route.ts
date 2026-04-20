import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'edge'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

function escapeXml(str: string): string {
  return str
    .replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;').replace(/'/g, '&apos;')
}

/**
 * Per-politician Atom 1.0 feed. Sibling to feed.xml (RSS 2.0)
 * for aggregators that prefer Atom (Feedly, Inoreader, NetNewsWire).
 */
export async function GET(
  _req: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const { slug } = await params
  if (!SLUG_RE.test(slug)) return new Response('slug inválido', { status: 400 })

  const supabase = getSupabaseServiceClient()
  const { data: politician } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name, party, state')
    .eq('slug', slug)
    .maybeSingle()
  if (!politician) return new Response('not found', { status: 404 })

  const { data: rows } = await (supabase.from('statements') as any)
    .select('id, slug, summary, full_quote, context, statement_date, updated_at, primary_source_url, venue, event_name, verification_status')
    .eq('politician_id', politician.id)
    .neq('verification_status', 'removed')
    .order('statement_date', { ascending: false })
    .limit(50)

  const updated = new Date().toISOString()
  const selfUrl = `${SITE_URL}/politico/${politician.slug}/feed.atom`
  const htmlUrl = `${SITE_URL}/politico/${politician.slug}`
  const title = `${politician.common_name} — Registra Brasil`

  const entries = ((rows ?? []) as Array<any>).map((s) => {
    const link = `${SITE_URL}/declaracao/${s.slug ?? s.id}`
    const published = new Date(s.statement_date).toISOString()
    const modified = s.updated_at ? new Date(s.updated_at).toISOString() : published
    const parts = [
      `<h2>${escapeXml(s.summary)}</h2>`,
      s.full_quote ? `<blockquote>${escapeXml(s.full_quote)}</blockquote>` : '',
      s.context ? `<p><strong>Contexto:</strong> ${escapeXml(s.context)}</p>` : '',
      s.venue ? `<p><strong>Local:</strong> ${escapeXml(s.venue)}${s.event_name ? ` — ${escapeXml(s.event_name)}` : ''}</p>` : '',
      s.primary_source_url ? `<p><a href="${escapeXml(s.primary_source_url)}">Fonte primária</a></p>` : '',
    ].filter(Boolean)
    const content = `<![CDATA[${parts.join('\n')}]]>`
    return `  <entry>
    <id>${escapeXml(link)}</id>
    <title>${escapeXml(s.summary.slice(0, 140))}</title>
    <link rel="alternate" type="text/html" href="${escapeXml(link)}"/>
    <published>${published}</published>
    <updated>${modified}</updated>
    <author><name>${escapeXml(politician.common_name)}</name></author>
    <summary>${escapeXml(s.summary)}</summary>
    <content type="html">${content}</content>
    <category term="${escapeXml(s.verification_status)}"/>
  </entry>`
  })

  const atom = `<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
  <id>${htmlUrl}</id>
  <title>${escapeXml(title)}</title>
  <subtitle>Declarações de ${escapeXml(politician.common_name)}${politician.party ? ` (${escapeXml(politician.party)}${politician.state ? '-' + escapeXml(politician.state) : ''})` : ''}</subtitle>
  <link rel="self" type="application/atom+xml" href="${escapeXml(selfUrl)}"/>
  <link rel="alternate" type="text/html" href="${escapeXml(htmlUrl)}"/>
  <updated>${updated}</updated>
${entries.join('\n')}
</feed>`

  return new Response(atom, {
    headers: {
      'Content-Type': 'application/atom+xml; charset=utf-8',
      'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=600',
    },
  })
}
