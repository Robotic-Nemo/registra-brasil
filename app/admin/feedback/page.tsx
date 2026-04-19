import Link from 'next/link'
import { ArrowLeft, MessageSquareWarning } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { StatusMenu } from './StatusMenu'

export const dynamic = 'force-dynamic'

interface PageProps {
  searchParams: Promise<{ status?: string }>
}

const KIND_LABELS: Record<string, string> = {
  typo: 'Erro de digitação',
  broken_link: 'Link quebrado',
  wrong_info: 'Informação incorreta',
  accessibility: 'Acessibilidade',
  other: 'Outro',
}

function fmt(iso: string): string {
  return new Date(iso).toLocaleString('pt-BR', {
    year: 'numeric', month: 'short', day: '2-digit', hour: '2-digit', minute: '2-digit',
  })
}

export default async function AdminFeedbackPage({ searchParams }: PageProps) {
  const { status: statusFilter = 'open' } = await searchParams
  const supabase = getSupabaseServiceClient()

  const [listRes, summaryRes] = await Promise.all([
    (supabase.from('page_issues') as any)
      .select('*')
      .eq('status', statusFilter)
      .order('created_at', { ascending: false })
      .limit(200),
    (supabase.rpc as any)('page_issues_summary'),
  ])

  type Row = {
    id: string
    url: string
    kind: string
    message: string
    email: string | null
    user_agent: string | null
    status: string
    resolved_at: string | null
    created_at: string
  }
  const rows = ((listRes.data ?? []) as Row[])

  const summary = new Map<string, number>()
  for (const r of (summaryRes.data ?? []) as Array<{ status: string; total: number | string }>) {
    summary.set(r.status, Number(r.total))
  }

  const counts = {
    open: summary.get('open') ?? 0,
    acknowledged: summary.get('acknowledged') ?? 0,
    resolved: summary.get('resolved') ?? 0,
    spam: summary.get('spam') ?? 0,
  }

  return (
    <main className="max-w-6xl mx-auto px-4 py-6">
      <nav className="mb-4 text-sm">
        <Link href="/admin" className="inline-flex items-center gap-1 text-gray-600 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-100">
          <ArrowLeft className="h-4 w-4" />
          Admin
        </Link>
      </nav>
      <header className="mb-6 flex items-center gap-2">
        <MessageSquareWarning className="h-5 w-5 text-indigo-600" />
        <h1 className="text-2xl font-bold text-gray-900 dark:text-gray-100">
          Reportes de leitores
        </h1>
      </header>

      <nav className="mb-6 flex flex-wrap gap-2">
        {(['open', 'acknowledged', 'resolved', 'spam'] as const).map((s) => (
          <Link
            key={s}
            href={`/admin/feedback?status=${s}`}
            className={`rounded-full border px-3 py-1 text-xs font-medium ${
              statusFilter === s
                ? 'border-indigo-500 bg-indigo-50 text-indigo-800 dark:border-indigo-400 dark:bg-indigo-950/40 dark:text-indigo-200'
                : 'border-gray-300 bg-white text-gray-700 hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300'
            }`}
          >
            {s} ({counts[s]})
          </Link>
        ))}
      </nav>

      {rows.length === 0 ? (
        <p className="text-sm text-gray-500">Nenhum reporte com esse status.</p>
      ) : (
        <ul className="divide-y divide-gray-100 rounded-xl border border-gray-200 dark:divide-gray-800 dark:border-gray-800">
          {rows.map((r) => (
            <li key={r.id} className="p-4">
              <div className="mb-2 flex flex-wrap items-center gap-2 text-xs text-gray-500 dark:text-gray-400">
                <time dateTime={r.created_at}>{fmt(r.created_at)}</time>
                <span aria-hidden>·</span>
                <span className="rounded-full bg-gray-100 px-2 py-0.5 dark:bg-gray-800">
                  {KIND_LABELS[r.kind] ?? r.kind}
                </span>
                <span aria-hidden>·</span>
                <Link href={r.url} className="font-mono text-indigo-700 hover:underline dark:text-indigo-300">
                  {r.url}
                </Link>
                <span className="ml-auto">
                  <StatusMenu id={r.id} status={r.status} />
                </span>
              </div>
              <p className="whitespace-pre-wrap text-sm text-gray-800 dark:text-gray-200">
                {r.message}
              </p>
              {(r.email || r.user_agent) && (
                <div className="mt-2 text-[11px] text-gray-500 dark:text-gray-500">
                  {r.email && <>email: {r.email} · </>}
                  {r.user_agent && <span className="truncate">UA: {r.user_agent.slice(0, 120)}</span>}
                </div>
              )}
            </li>
          ))}
        </ul>
      )}
    </main>
  )
}
