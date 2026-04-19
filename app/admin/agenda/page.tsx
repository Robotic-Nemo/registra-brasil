import Link from 'next/link'
import { ArrowLeft, Calendar } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { kindLabel } from '@/lib/agenda/queries'
import { CreateForm } from './CreateForm'
import { RowActions } from './RowActions'

export const dynamic = 'force-dynamic'

function fmt(iso: string): string {
  return new Date(iso).toLocaleString('pt-BR', {
    year: 'numeric', month: 'short', day: '2-digit', hour: '2-digit', minute: '2-digit',
  })
}

export default async function AdminAgendaPage() {
  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('political_events') as any)
    .select('id, title, summary, event_date, location, kind, is_published, created_at, politicians:politician_id(common_name)')
    .order('event_date', { ascending: false })
    .limit(200)

  type Row = {
    id: string
    title: string
    summary: string
    event_date: string
    location: string | null
    kind: string
    is_published: boolean
    created_at: string
    politicians?: { common_name: string } | null
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
        <Calendar className="h-5 w-5 text-indigo-600" />
        <h1 className="text-2xl font-bold text-gray-900 dark:text-gray-100">
          Agenda política
        </h1>
      </header>

      <section className="mb-8">
        <CreateForm />
      </section>

      <section>
        <h2 className="mb-3 text-sm font-semibold text-gray-900 dark:text-gray-100">
          Eventos registrados ({rows.length})
        </h2>
        {rows.length === 0 ? (
          <p className="text-sm text-gray-500">Nenhum evento criado.</p>
        ) : (
          <ul className="divide-y divide-gray-100 rounded-xl border border-gray-200 dark:divide-gray-800 dark:border-gray-800">
            {rows.map((r) => (
              <li key={r.id} className="p-4">
                <div className="flex flex-wrap items-start justify-between gap-3">
                  <div className="min-w-0 flex-1">
                    <div className="text-xs text-gray-500 dark:text-gray-400">
                      {fmt(r.event_date)} · {kindLabel(r.kind)}
                      {r.location && ` · ${r.location}`}
                      {r.politicians?.common_name && ` · ${r.politicians.common_name}`}
                    </div>
                    <h3 className="mt-0.5 font-medium text-gray-900 dark:text-gray-100">{r.title}</h3>
                    <p className="mt-1 line-clamp-2 text-sm text-gray-600 dark:text-gray-400">
                      {r.summary}
                    </p>
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
