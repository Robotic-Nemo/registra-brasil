import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'edge'
export const revalidate = 600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

const FIELD_LABELS: Record<string, string> = {
  summary: 'Resumo',
  full_quote: 'Citação literal',
  statement_date: 'Data',
  venue: 'Local',
  event_name: 'Evento',
  verification_status: 'Status',
  primary_source_url: 'URL da fonte',
  primary_source_type: 'Tipo de fonte',
  editor_notes: 'Notas editoriais',
  severity_score: 'Severidade',
  minors_involved: 'Envolve menores',
  slug: 'Slug',
}

function esc(s: string): string {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&apos;')
}

export async function GET() {
  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('statement_revisions') as any)
    .select('id, revision_number, changed_fields, reason, actor, created_at, statement_id, statements(slug, summary, politicians(common_name))')
    .order('created_at', { ascending: false })
    .limit(50)

  const items = ((data ?? []) as any[])
    .filter((r) => r.statements)
    .map((r) => {
      const stmt = r.statements
      const link = `${SITE_URL}/declaracao/${stmt.slug ?? r.statement_id}/historico`
      const pol = stmt.politicians?.common_name ?? '—'
      const fields = Object.keys(r.changed_fields).map((f) => FIELD_LABELS[f] ?? f).join(', ')
      const title = `[rev ${r.revision_number}] ${pol}: ${stmt.summary.slice(0, 100)}`
      const desc = `Campos alterados: ${fields}${r.reason ? ` — ${r.reason}` : ''}`
      return `    <item>
      <title>${esc(title)}</title>
      <link>${esc(link)}</link>
      <guid isPermaLink="false">rev:${r.id}</guid>
      <pubDate>${new Date(r.created_at).toUTCString()}</pubDate>
      <description>${esc(desc)}</description>
      <author>${esc(r.actor ?? 'admin')}</author>
    </item>`
    })
    .join('\n')

  const selfUrl = `${SITE_URL}/atualizacoes/feed.xml`
  const rss = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>Atualizações e correções — Registra Brasil</title>
    <link>${SITE_URL}/atualizacoes</link>
    <description>Log público de toda edição feita em declarações do arquivo.</description>
    <language>pt-BR</language>
    <lastBuildDate>${new Date().toUTCString()}</lastBuildDate>
    <atom:link href="${esc(selfUrl)}" rel="self" type="application/rss+xml"/>
${items}
  </channel>
</rss>`

  return new Response(rss, {
    headers: {
      'Content-Type': 'application/rss+xml; charset=utf-8',
      'Cache-Control': 'public, s-maxage=600, stale-while-revalidate=300',
    },
  })
}
