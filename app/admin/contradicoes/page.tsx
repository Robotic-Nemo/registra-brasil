import Link from 'next/link'
import { ArrowLeft, GitCompare } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { CreateForm } from './CreateForm'
import { RowActions } from './RowActions'

export const dynamic = 'force-dynamic'

const SEV_LABEL: Record<number, string> = { 1: 'Leve', 2: 'Moderada', 3: 'Relevante', 4: 'Grave' }

function fmt(iso: string): string {
  return new Date(iso).toLocaleDateString('pt-BR', { year: 'numeric', month: 'short', day: '2-digit' })
}

export default async function AdminContradicoesPage() {
  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('contradiction_pairs') as any)
    .select(`
      id, headline, severity, is_published, created_at,
      politicians ( common_name, party, state ),
      low:statements!contradiction_pairs_statement_low_id_fkey ( summary, statement_date ),
      high:statements!contradiction_pairs_statement_high_id_fkey ( summary, statement_date )
    `)
    .order('created_at', { ascending: false })
    .limit(200)

  type Row = {
    id: string
    headline: string
    severity: number
    is_published: boolean
    created_at: string
    politicians: { common_name: string; party: string | null; state: string | null } | null
    low: { summary: string; statement_date: string } | null
    high: { summary: string; statement_date: string } | null
  }
  const rows = ((data ?? []) as Row[])

  return (
    <main className="max-w-6xl mx-auto px-4 py-6">
      <nav className="mb-4 text-sm">
        <Link href="/admin" className="inline-flex items-center gap-1 text-gray-600 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-100">
          <ArrowLeft className="h-4 w-4" />
          Admin
        </Link>
      </nav>
      <header className="mb-6 flex items-center gap-2">
        <GitCompare className="h-5 w-5 text-indigo-600" />
        <h1 className="text-2xl font-bold text-gray-900 dark:text-gray-100">
          Contradições
        </h1>
      </header>

      <section className="mb-8">
        <CreateForm />
      </section>

      <section>
        <h2 className="mb-3 text-sm font-semibold text-gray-900 dark:text-gray-100">
          Registradas ({rows.length})
        </h2>
        {rows.length === 0 ? (
          <p className="text-sm text-gray-500">Nenhuma contradição cadastrada.</p>
        ) : (
          <ul className="divide-y divide-gray-100 rounded-xl border border-gray-200 dark:divide-gray-800 dark:border-gray-800">
            {rows.map((r) => (
              <li key={r.id} className="p-4">
                <div className="flex flex-wrap items-start justify-between gap-3">
                  <div className="min-w-0 flex-1">
                    <Link
                      href={`/contradicoes/${r.id}`}
                      className="font-medium text-indigo-700 hover:underline dark:text-indigo-300"
                    >
                      {r.headline}
                    </Link>
                    <div className="mt-1 text-xs text-gray-500 dark:text-gray-400">
                      {r.politicians?.common_name ?? '—'}
                      {r.politicians?.party && ` · ${r.politicians.party}`}
                      {' · Gravidade '}
                      {SEV_LABEL[r.severity]}
                      {' · criada '}
                      {fmt(r.created_at)}
                    </div>
                    {r.low && r.high && (
                      <div className="mt-2 grid grid-cols-1 gap-2 text-xs text-gray-600 md:grid-cols-2 dark:text-gray-400">
                        <div>
                          <span className="font-semibold">A ({fmt(r.low.statement_date)}):</span>{' '}
                          {r.low.summary.slice(0, 140)}…
                        </div>
                        <div>
                          <span className="font-semibold">B ({fmt(r.high.statement_date)}):</span>{' '}
                          {r.high.summary.slice(0, 140)}…
                        </div>
                      </div>
                    )}
                  </div>
                  <RowActions id={r.id} isPublished={r.is_published} />
                </div>
              </li>
            ))}
          </ul>
        )}
      </section>
    </main>
  )
}
