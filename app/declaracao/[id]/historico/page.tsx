import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowLeft, History } from 'lucide-react'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'

export const revalidate = 300

const TRACKED_LABELS: Record<string, string> = {
  summary: 'Resumo',
  full_quote: 'Citação literal',
  statement_date: 'Data',
  venue: 'Local',
  event_name: 'Evento',
  verification_status: 'Status de verificação',
  primary_source_url: 'URL da fonte',
  primary_source_type: 'Tipo de fonte',
  editor_notes: 'Notas editoriais',
  severity_score: 'Severidade',
  minors_involved: 'Envolve menores',
  slug: 'Slug',
}

interface PageProps {
  params: Promise<{ id: string }>
}

interface Revision {
  id: string
  revision_number: number
  changed_fields: Record<string, { before: unknown; after: unknown }>
  reason: string | null
  actor: string | null
  created_at: string
}

function formatValue(v: unknown): string {
  if (v === null || v === undefined) return '—'
  if (typeof v === 'string') return v.length > 200 ? v.slice(0, 200) + '…' : v
  if (typeof v === 'boolean') return v ? 'sim' : 'não'
  return String(v)
}

export default async function StatementHistoryPage({ params }: PageProps) {
  const { id } = await params
  const supabase = await getSupabaseServerClient()

  // Resolve by slug or UUID
  const { data: byUuid } = await (supabase.from('statements') as any)
    .select('id, slug, summary, politicians(common_name, slug)')
    .or(`id.eq.${id},slug.eq.${id}`)
    .maybeSingle()

  if (!byUuid) return notFound()

  const { data: revs } = await (supabase.from('statement_revisions') as any)
    .select('id, revision_number, changed_fields, reason, actor, created_at')
    .eq('statement_id', byUuid.id)
    .order('revision_number', { ascending: false })

  const revisions = (revs ?? []) as Revision[]

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <Breadcrumbs
        items={[
          byUuid.politicians?.slug ? { label: byUuid.politicians.common_name, href: `/politico/${byUuid.politicians.slug}` } : { label: 'Declaração' },
          { label: 'Histórico' },
        ]}
      />

      <Link
        href={`/declaracao/${byUuid.slug ?? byUuid.id}`}
        className="inline-flex items-center gap-1 text-sm text-blue-700 hover:underline mb-4"
      >
        <ArrowLeft className="w-4 h-4" /> Voltar à declaração
      </Link>

      <h1 className="text-2xl font-bold text-gray-900 flex items-center gap-2 mb-2">
        <History className="w-6 h-6 text-blue-700" aria-hidden="true" />
        Histórico de revisões
      </h1>
      <p className="text-sm text-gray-600 mb-6">
        Cada alteração editorial feita nesta declaração é registrada publicamente. O log é
        append-only — correções nunca são silenciosas.
      </p>
      <p className="text-xs text-gray-500 mb-8">
        <strong>{byUuid.summary}</strong>
      </p>

      {revisions.length === 0 ? (
        <p className="text-sm text-gray-600 bg-gray-50 border border-gray-200 rounded-lg p-4">
          Nenhuma revisão registrada. O conteúdo permanece como publicado originalmente.
        </p>
      ) : (
        <ol className="flex flex-col gap-4">
          {revisions.map((r) => (
            <li key={r.id} className="bg-white border border-gray-200 rounded-lg p-4">
              <div className="flex items-center justify-between mb-2">
                <span className="text-xs font-semibold text-gray-700">
                  Revisão #{r.revision_number}
                </span>
                <time className="text-xs text-gray-500" dateTime={r.created_at}>
                  {new Date(r.created_at).toLocaleString('pt-BR', { dateStyle: 'medium', timeStyle: 'short' })}
                </time>
              </div>
              {r.reason && (
                <p className="text-sm text-gray-700 mb-3 italic">{r.reason}</p>
              )}
              <dl className="space-y-3">
                {Object.entries(r.changed_fields).map(([field, diff]) => (
                  <div key={field} className="border border-gray-100 rounded p-3 bg-gray-50">
                    <dt className="text-xs font-semibold text-gray-700 mb-1">
                      {TRACKED_LABELS[field] ?? field}
                    </dt>
                    <dd className="grid grid-cols-1 sm:grid-cols-2 gap-2 text-sm">
                      <div>
                        <span className="text-[10px] uppercase tracking-wider text-red-600 block mb-0.5">Antes</span>
                        <span className="text-gray-900 line-through decoration-red-300">{formatValue(diff.before)}</span>
                      </div>
                      <div>
                        <span className="text-[10px] uppercase tracking-wider text-green-700 block mb-0.5">Depois</span>
                        <span className="text-gray-900">{formatValue(diff.after)}</span>
                      </div>
                    </dd>
                  </div>
                ))}
              </dl>
              <p className="text-xs text-gray-500 mt-3">
                Registrado por: {r.actor ?? 'admin'}
              </p>
            </li>
          ))}
        </ol>
      )}
    </main>
  )
}
