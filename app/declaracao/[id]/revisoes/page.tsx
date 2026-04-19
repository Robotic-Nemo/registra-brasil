import Link from 'next/link'
import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { History } from 'lucide-react'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getStatementById, getStatementBySlug } from '@/lib/supabase/queries/statements'
import { labelField } from '@/lib/moderation/feed'

export const revalidate = 600

interface PageProps {
  params: Promise<{ id: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { id } = await params
  const supabase = await getSupabaseServerClient()
  const s = (await getStatementBySlug(supabase, id)) ?? (await getStatementById(supabase, id))
  if (!s) return { title: 'Revisões não encontradas' }
  return {
    title: `Revisões — ${s.politicians.common_name} — Registra Brasil`,
    description: `Histórico público de revisões da declaração arquivada de ${s.politicians.common_name}.`,
    alternates: { canonical: `/declaracao/${id}/revisoes` },
    robots: { index: false, follow: true },
  }
}

function fmt(iso: string): string {
  return new Date(iso).toLocaleString('pt-BR', {
    year: 'numeric', month: 'short', day: '2-digit', hour: '2-digit', minute: '2-digit',
  })
}

// Redact free-text reason the same way public_revision_feed does.
function sanitize(reason: string | null): string {
  if (!reason) return ''
  return reason
    .replace(/[\w.+-]+@[\w-]+\.[\w.-]+/g, '[email]')
    .replace(/(\d{1,3}\.){3}\d{1,3}/g, '[ip]')
    .slice(0, 280)
}

export default async function StatementRevisionsPage({ params }: PageProps) {
  const { id } = await params
  const supabase = await getSupabaseServerClient()
  const statement = (await getStatementBySlug(supabase, id)) ?? (await getStatementById(supabase, id))
  if (!statement) notFound()

  const { data } = await (supabase.from('statement_revisions') as any)
    .select('id, revision_number, changed_fields, reason, created_at')
    .eq('statement_id', statement.id)
    .order('created_at', { ascending: false })
    .limit(200)

  type Row = {
    id: string
    revision_number: number
    changed_fields: Record<string, unknown> | null
    reason: string | null
    created_at: string
  }
  const rows = (data ?? []) as Row[]

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <nav className="mb-4 text-sm">
        <Link
          href={`/declaracao/${statement.slug ?? statement.id}`}
          className="text-indigo-700 hover:underline dark:text-indigo-300"
        >
          ← Voltar para a declaração
        </Link>
      </nav>

      <header className="mb-6 flex items-start gap-3">
        <History className="mt-1 h-6 w-6 shrink-0 text-indigo-600" aria-hidden />
        <div>
          <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Histórico editorial
          </p>
          <h1 className="mt-1 text-2xl md:text-3xl font-bold text-gray-900 dark:text-gray-100">
            Revisões desta declaração
          </h1>
          <p className="mt-1 text-sm text-gray-600 dark:text-gray-300">
            {statement.politicians.common_name} —{' '}
            <Link
              href={`/declaracao/${statement.slug ?? statement.id}`}
              className="underline"
            >
              {statement.summary.slice(0, 120)}{statement.summary.length > 120 ? '…' : ''}
            </Link>
          </p>
        </div>
      </header>

      {rows.length === 0 ? (
        <p className="rounded-lg border border-gray-200 bg-gray-50 p-4 text-sm text-gray-600 dark:border-gray-800 dark:bg-gray-900/40 dark:text-gray-400">
          Nenhuma revisão registrada. Este registro está no estado original em
          que foi publicado.
        </p>
      ) : (
        <ol className="relative flex flex-col gap-4 border-l border-gray-200 pl-6 dark:border-gray-800">
          {rows.map((r) => {
            const keys = r.changed_fields && typeof r.changed_fields === 'object'
              ? Object.keys(r.changed_fields as Record<string, unknown>)
              : []
            const reason = sanitize(r.reason)
            return (
              <li
                key={r.id}
                className="relative before:absolute before:-left-[27px] before:top-3 before:h-2.5 before:w-2.5 before:rounded-full before:bg-indigo-500 before:ring-4 before:ring-white dark:before:ring-gray-950"
              >
                <article className="rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
                  <header className="mb-2 flex flex-wrap items-center gap-2 text-xs text-gray-500 dark:text-gray-400">
                    <time dateTime={r.created_at}>{fmt(r.created_at)}</time>
                    <span aria-hidden>·</span>
                    <span>revisão #{r.revision_number}</span>
                  </header>
                  {keys.length > 0 && (
                    <div className="mb-2 flex flex-wrap gap-1.5">
                      {keys.map((k) => (
                        <span
                          key={k}
                          className="rounded-full bg-gray-100 px-2 py-0.5 text-[11px] text-gray-700 dark:bg-gray-800 dark:text-gray-300"
                        >
                          {labelField(k)}
                        </span>
                      ))}
                    </div>
                  )}
                  {reason && (
                    <p className="rounded border-l-2 border-indigo-300 bg-indigo-50/50 px-3 py-2 text-sm italic text-gray-700 dark:border-indigo-700 dark:bg-indigo-950/20 dark:text-gray-300">
                      “{reason}”
                    </p>
                  )}
                </article>
              </li>
            )
          })}
        </ol>
      )}

      <footer className="mt-8 rounded-lg border border-gray-200 bg-gray-50 p-4 text-sm text-gray-600 dark:border-gray-800 dark:bg-gray-900/40 dark:text-gray-400">
        <p>
          Valores anteriores dos campos ficam apenas no histórico interno da
          equipe editorial. Esta página mostra <em>quando</em> algo mudou,{' '}
          <em>quais</em> campos foram alterados e <em>por quê</em> — sem expor
          o estado antigo. Veja o{' '}
          <Link href="/registro-editorial" className="underline">
            registro editorial global
          </Link>{' '}
          para o feed completo.
        </p>
      </footer>
    </main>
  )
}
