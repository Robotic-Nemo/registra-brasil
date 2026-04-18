import Link from 'next/link'
import { ArrowLeft, Shield, History, Upload, Inbox, FolderKanban, Flag } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const dynamic = 'force-dynamic'

interface AuditEvent {
  when: string
  kind: 'revision' | 'import' | 'submission' | 'collection' | 'reaction'
  title: string
  detail: string
  href: string
  actor?: string
}

const iconFor = (kind: AuditEvent['kind']) => {
  switch (kind) {
    case 'revision': return <History className="w-4 h-4 text-blue-700" aria-hidden="true" />
    case 'import': return <Upload className="w-4 h-4 text-green-700" aria-hidden="true" />
    case 'submission': return <Inbox className="w-4 h-4 text-amber-600" aria-hidden="true" />
    case 'collection': return <FolderKanban className="w-4 h-4 text-purple-700" aria-hidden="true" />
    case 'reaction': return <Flag className="w-4 h-4 text-red-600" aria-hidden="true" />
  }
}

export default async function AuditoriaPage() {
  const supabase = getSupabaseServiceClient()

  const [revisions, imports, submissions, collections] = await Promise.all([
    (supabase.from('statement_revisions') as any)
      .select('id, revision_number, reason, actor, created_at, statement_id, statements(slug, summary)')
      .order('created_at', { ascending: false })
      .limit(40),
    (supabase.from('import_batches') as any)
      .select('id, source_filename, row_count_created, row_count_total, status, note, created_at, created_by')
      .order('created_at', { ascending: false })
      .limit(20),
    (supabase.from('statement_submissions') as any)
      .select('id, summary, status, reviewed_at, reviewed_by, created_at, politician_name_raw, politicians(common_name)')
      .order('created_at', { ascending: false })
      .limit(30),
    (supabase.from('collections') as any)
      .select('id, slug, title, is_published, updated_at, published_at')
      .order('updated_at', { ascending: false })
      .limit(20),
  ])

  const events: AuditEvent[] = []

  for (const r of (revisions.data ?? []) as any[]) {
    if (!r.statements) continue
    events.push({
      when: r.created_at,
      kind: 'revision',
      title: `Revisão #${r.revision_number}`,
      detail: r.statements.summary?.slice(0, 120) ?? '—',
      href: `/declaracao/${r.statements.slug ?? r.statement_id}/historico`,
      actor: r.actor ?? 'admin',
    })
  }

  for (const b of (imports.data ?? []) as any[]) {
    events.push({
      when: b.created_at,
      kind: 'import',
      title: `${b.status === 'reverted' ? 'Lote revertido' : 'Lote importado'} (${b.row_count_created}/${b.row_count_total})`,
      detail: b.source_filename ?? b.note ?? '—',
      href: `/admin/importar/${b.id}`,
      actor: b.created_by ?? 'admin',
    })
  }

  for (const s of (submissions.data ?? []) as any[]) {
    const when = s.reviewed_at ?? s.created_at
    const pol = s.politicians?.common_name ?? s.politician_name_raw ?? '—'
    events.push({
      when,
      kind: 'submission',
      title: `Submissão: ${s.status}`,
      detail: `${pol}: ${s.summary?.slice(0, 100) ?? ''}`,
      href: `/admin/submissions?status=${s.status}`,
      actor: s.reviewed_by ?? 'público',
    })
  }

  for (const c of (collections.data ?? []) as any[]) {
    events.push({
      when: c.updated_at,
      kind: 'collection',
      title: c.is_published ? 'Coleção atualizada' : 'Coleção em rascunho',
      detail: c.title,
      href: `/admin/colecoes/${c.slug}`,
      actor: 'admin',
    })
  }

  events.sort((a, b) => (a.when < b.when ? 1 : -1))
  const recent = events.slice(0, 100)

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-6">
        <Link href="/admin" className="p-1.5 rounded hover:bg-gray-100">
          <ArrowLeft className="w-5 h-5 text-gray-500" />
        </Link>
        <h1 className="text-xl font-bold text-gray-900 flex items-center gap-2">
          <Shield className="w-5 h-5 text-blue-700" />
          Auditoria editorial
        </h1>
        <span className="ml-auto text-xs text-gray-500">{recent.length} eventos</span>
      </div>
      <p className="text-sm text-gray-600 mb-6 max-w-2xl">
        Feed unificado das últimas 100 ações editoriais: revisões em declarações, lotes
        importados/revertidos, submissões públicas aprovadas ou recusadas, coleções atualizadas.
      </p>

      <ol className="flex flex-col gap-2">
        {recent.map((e, i) => (
          <li key={i} className="bg-white border border-gray-200 rounded p-3 text-sm">
            <div className="flex items-center gap-2 mb-1">
              {iconFor(e.kind)}
              <Link href={e.href} className="font-semibold text-gray-900 hover:text-blue-700 hover:underline">
                {e.title}
              </Link>
              <span className="ml-auto text-xs text-gray-500">
                <time dateTime={e.when}>{new Date(e.when).toLocaleString('pt-BR', { dateStyle: 'short', timeStyle: 'short' })}</time>
                {e.actor ? ` · ${e.actor}` : ''}
              </span>
            </div>
            <p className="text-gray-700 text-sm">{e.detail}</p>
          </li>
        ))}
      </ol>
    </main>
  )
}
