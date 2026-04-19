import Link from 'next/link'
import { ArrowLeft, Eye } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { AddForm } from './AddForm'
import { RowActions } from './RowActions'

export const dynamic = 'force-dynamic'

const PRIORITY_LABEL: Record<number, string> = {
  1: 'Baixa', 2: 'Média', 3: 'Alta', 4: 'Crítica',
}
const PRIORITY_CLASS: Record<number, string> = {
  1: 'bg-gray-100 text-gray-700 dark:bg-gray-800 dark:text-gray-200',
  2: 'bg-blue-100 text-blue-800 dark:bg-blue-950/40 dark:text-blue-200',
  3: 'bg-amber-100 text-amber-900 dark:bg-amber-950/40 dark:text-amber-200',
  4: 'bg-rose-100 text-rose-900 dark:bg-rose-950/40 dark:text-rose-200',
}

function fmt(iso: string): string {
  return new Date(iso).toLocaleDateString('pt-BR', { year: 'numeric', month: 'short', day: '2-digit' })
}

export default async function AdminWatchlistPage() {
  const supabase = getSupabaseServiceClient()

  const [listRes, activityRes] = await Promise.all([
    (supabase.from('admin_watchlist') as any)
      .select('politician_id, priority, reason, added_by, created_at, politicians:politician_id(slug, common_name, party, state, photo_url)')
      .order('priority', { ascending: false })
      .order('created_at', { ascending: false }),
    (supabase.rpc as any)('watchlist_recent_activity', { window_days: 7, result_limit: 50 }),
  ])

  type Row = {
    politician_id: string
    priority: number
    reason: string | null
    added_by: string | null
    created_at: string
    politicians: { slug: string; common_name: string; party: string | null; state: string | null; photo_url: string | null } | null
  }
  type Activity = {
    statement_id: string
    statement_slug: string | null
    summary: string
    statement_date: string
    verification_status: string
    politician_slug: string
    politician_name: string
    priority: number
    reason: string | null
  }
  const rows = ((listRes.data ?? []) as Row[])
  const activity = ((activityRes.data ?? []) as Activity[])

  return (
    <main className="max-w-6xl mx-auto px-4 py-6">
      <nav className="mb-4 text-sm">
        <Link href="/admin" className="inline-flex items-center gap-1 text-gray-600 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-100">
          <ArrowLeft className="h-4 w-4" /> Admin
        </Link>
      </nav>
      <header className="mb-6 flex items-center gap-2">
        <Eye className="h-5 w-5 text-indigo-600" />
        <h1 className="text-2xl font-bold text-gray-900 dark:text-gray-100">Watchlist editorial</h1>
      </header>

      <section className="mb-8">
        <AddForm />
      </section>

      <section className="mb-10">
        <h2 className="mb-3 text-sm font-semibold text-gray-900 dark:text-gray-100">
          Políticos monitorados ({rows.length})
        </h2>
        {rows.length === 0 ? (
          <p className="text-sm text-gray-500">
            Ninguém na watchlist ainda. Cole o UUID de um político acima.
          </p>
        ) : (
          <ul className="divide-y divide-gray-100 rounded-xl border border-gray-200 dark:divide-gray-800 dark:border-gray-800">
            {rows.map((r) => (
              <li key={r.politician_id} className="p-4">
                <div className="flex items-center gap-3">
                  <span className={`rounded-full px-2 py-0.5 text-[11px] font-semibold ${PRIORITY_CLASS[r.priority]}`}>
                    {PRIORITY_LABEL[r.priority]}
                  </span>
                  <Link
                    href={`/politico/${r.politicians?.slug ?? ''}`}
                    className="font-medium text-indigo-700 hover:underline dark:text-indigo-300"
                  >
                    {r.politicians?.common_name ?? r.politician_id.slice(0, 8)}
                  </Link>
                  <span className="text-xs text-gray-500 dark:text-gray-400">
                    {r.politicians?.party}
                    {r.politicians?.state ? `-${r.politicians.state}` : ''} · adicionado em {fmt(r.created_at)}
                    {r.added_by ? ` por ${r.added_by}` : ''}
                  </span>
                  <span className="ml-auto">
                    <RowActions id={r.politician_id} priority={r.priority} />
                  </span>
                </div>
                {r.reason && (
                  <p className="mt-1 pl-16 text-xs italic text-gray-600 dark:text-gray-400">
                    {r.reason}
                  </p>
                )}
              </li>
            ))}
          </ul>
        )}
      </section>

      <section>
        <h2 className="mb-3 text-sm font-semibold text-gray-900 dark:text-gray-100">
          Atividade recente dos monitorados — 7 dias ({activity.length})
        </h2>
        {activity.length === 0 ? (
          <p className="text-sm text-gray-500">Nenhum novo registro na janela.</p>
        ) : (
          <ul className="divide-y divide-gray-100 rounded-xl border border-gray-200 dark:divide-gray-800 dark:border-gray-800">
            {activity.map((a) => (
              <li key={a.statement_id} className="p-3">
                <div className="flex items-start gap-3">
                  <span className={`mt-0.5 rounded-full px-2 py-0.5 text-[10px] font-semibold ${PRIORITY_CLASS[a.priority]}`}>
                    P{a.priority}
                  </span>
                  <div className="min-w-0 flex-1">
                    <Link
                      href={`/declaracao/${a.statement_slug ?? a.statement_id}`}
                      className="block font-medium text-indigo-700 hover:underline dark:text-indigo-300"
                    >
                      {a.summary.slice(0, 160)}
                      {a.summary.length > 160 ? '…' : ''}
                    </Link>
                    <div className="text-xs text-gray-500 dark:text-gray-400">
                      <Link href={`/politico/${a.politician_slug}`} className="hover:underline">
                        {a.politician_name}
                      </Link>
                      {' · '}
                      {fmt(a.statement_date)}
                      {' · '}
                      <span className={a.verification_status === 'verified' ? 'text-emerald-700 dark:text-emerald-300' : 'text-amber-700 dark:text-amber-300'}>
                        {a.verification_status}
                      </span>
                    </div>
                  </div>
                </div>
              </li>
            ))}
          </ul>
        )}
      </section>
    </main>
  )
}
