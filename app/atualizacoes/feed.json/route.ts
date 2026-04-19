import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'nodejs'
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

/**
 * GET /atualizacoes/feed.json — JSON Feed 1.1 of the public correction
 * log (counterpart to /atualizacoes/feed.xml RSS).
 */
export async function GET() {
  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('statement_revisions') as any)
    .select('id, revision_number, changed_fields, reason, actor, created_at, statement_id, statements(slug, summary, politicians(common_name))')
    .order('created_at', { ascending: false })
    .limit(50)

  type Row = {
    id: string; revision_number: number; changed_fields: Record<string, unknown>
    reason: string | null; actor: string | null; created_at: string; statement_id: string
    statements: { slug: string | null; summary: string; politicians: { common_name: string } | null } | null
  }
  const rows = ((data ?? []) as Row[]).filter((r) => r.statements)

  const items = rows.map((r) => {
    const stmt = r.statements!
    const url = `${SITE_URL}/declaracao/${stmt.slug ?? r.statement_id}/historico`
    const fields = Object.keys(r.changed_fields ?? {})
      .map((f) => FIELD_LABELS[f] ?? f)
      .join(', ')
    return {
      id: `rev:${r.id}`,
      url,
      title: `[rev ${r.revision_number}] ${stmt.politicians?.common_name ?? '—'}: ${stmt.summary.slice(0, 100)}`,
      summary: `Campos alterados: ${fields}${r.reason ? ` — ${r.reason}` : ''}`,
      content_html: `<p><strong>Campos alterados:</strong> ${escapeHtml(fields)}</p>${r.reason ? `<p><strong>Motivo:</strong> ${escapeHtml(r.reason)}</p>` : ''}`,
      date_published: new Date(r.created_at).toISOString(),
      authors: [{ name: r.actor ?? 'admin' }],
      tags: ['revisão', ...Object.keys(r.changed_fields ?? {})],
    }
  })

  const feed = {
    version: 'https://jsonfeed.org/version/1.1',
    title: 'Registra Brasil — Atualizações',
    home_page_url: `${SITE_URL}/atualizacoes`,
    feed_url: `${SITE_URL}/atualizacoes/feed.json`,
    description: 'Log público de correções editoriais.',
    language: 'pt-BR',
    items,
  }
  return new Response(JSON.stringify(feed), {
    headers: {
      'Content-Type': 'application/feed+json; charset=utf-8',
      'Cache-Control': 'public, max-age=300, s-maxage=600, stale-while-revalidate=3600',
    },
  })
}

function escapeHtml(s: string): string {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
}
