import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'edge'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export async function GET() {
  const supabase = getSupabaseServiceClient()

  const { data: statements } = await supabase
    .from('statements')
    .select(`
      id, slug, summary, full_quote, context, statement_date, created_at,
      politicians (common_name, party, slug)
    `)
    .eq('verification_status', 'verified')
    .order('created_at', { ascending: false })
    .limit(50)

  const items = (statements ?? []).map((s: Record<string, unknown>) => {
    const pol = s.politicians as { common_name: string; party: string; slug: string } | null
    const polName = pol ? `${pol.common_name} (${pol.party})` : 'Desconhecido'
    const url = `${SITE_URL}/declaracao/${(s.slug as string | null) ?? s.id}`

    return `  <entry>
    <title>${escapeXml(s.summary as string)}</title>
    <link href="${url}" rel="alternate" type="text/html"/>
    <id>${url}</id>
    <updated>${new Date(s.created_at as string).toISOString()}</updated>
    <published>${new Date(s.statement_date as string).toISOString()}</published>
    <author><name>${escapeXml(polName)}</name></author>
    <summary type="text">${escapeXml(s.summary as string)}</summary>
    ${s.full_quote ? `<content type="html">${escapeXml(s.full_quote as string)}</content>` : ''}
  </entry>`
  })

  const feed = `<?xml version="1.0" encoding="utf-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
  <title>Registra Brasil</title>
  <subtitle>Declarações verificadas de políticos brasileiros</subtitle>
  <link href="${SITE_URL}/atom.xml" rel="self" type="application/atom+xml"/>
  <link href="${SITE_URL}" rel="alternate" type="text/html"/>
  <id>${SITE_URL}/</id>
  <updated>${new Date().toISOString()}</updated>
  <generator>Registra Brasil</generator>
  <icon>${SITE_URL}/favicon.ico</icon>
${items.join('\n')}
</feed>`

  return new Response(feed, {
    headers: {
      'Content-Type': 'application/atom+xml; charset=utf-8',
      'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=1800',
    },
  })
}

function escapeXml(str: string): string {
  return str
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;')
}
