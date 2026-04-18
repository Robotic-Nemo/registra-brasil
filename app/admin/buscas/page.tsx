import Link from 'next/link'
import { ArrowLeft, Search, AlertTriangle } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const dynamic = 'force-dynamic'

interface PageProps {
  searchParams: Promise<{ days?: string }>
}

export default async function AdminBuscasPage({ searchParams }: PageProps) {
  const { days: daysParam } = await searchParams
  const days = Math.min(90, Math.max(1, parseInt(daysParam ?? '7', 10) || 7))
  const since = new Date(Date.now() - days * 86400_000).toISOString().slice(0, 10)

  const supabase = getSupabaseServiceClient()

  const { data } = await (supabase.from('search_queries') as any)
    .select('q_normalized, hits, last_result_count, last_seen_at')
    .gte('day', since)
    .order('hits', { ascending: false })
    .limit(500)

  type Row = { q_normalized: string; hits: number; last_result_count: number | null; last_seen_at: string }
  const rows = (data ?? []) as Row[]

  // Aggregate across days (same query term might have rows per day).
  const byQuery = new Map<string, { q: string; hits: number; lastResults: number | null; lastSeen: string }>()
  for (const r of rows) {
    const ex = byQuery.get(r.q_normalized) ?? { q: r.q_normalized, hits: 0, lastResults: r.last_result_count, lastSeen: r.last_seen_at }
    ex.hits += r.hits
    if (r.last_seen_at > ex.lastSeen) {
      ex.lastSeen = r.last_seen_at
      ex.lastResults = r.last_result_count
    }
    byQuery.set(r.q_normalized, ex)
  }

  const sorted = [...byQuery.values()].sort((a, b) => b.hits - a.hits)
  const zeroResults = sorted.filter((r) => r.lastResults === 0).slice(0, 50)
  const topQueries = sorted.slice(0, 100)

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-6">
        <Link href="/admin" className="p-1.5 rounded hover:bg-gray-100"><ArrowLeft className="w-5 h-5 text-gray-500" /></Link>
        <h1 className="text-xl font-bold text-gray-900 flex items-center gap-2">
          <Search className="w-5 h-5 text-blue-700" />
          Buscas dos leitores
        </h1>
      </div>

      <div className="flex gap-2 mb-5 text-xs">
        {[7, 30, 90].map((d) => (
          <Link
            key={d}
            href={`/admin/buscas?days=${d}`}
            className={`px-3 py-1.5 rounded-full border ${days === d ? 'bg-blue-600 border-blue-600 text-white' : 'border-gray-300 text-gray-700 hover:bg-gray-50'}`}
          >
            Últimos {d} dias
          </Link>
        ))}
      </div>

      <p className="text-xs text-gray-500 mb-5">
        Sem PII: apenas o termo de busca normalizado (sem acentos, minúsculas) e a contagem
        agregada. {sorted.length} termos únicos no período.
      </p>

      <section className="mb-10">
        <h2 className="text-sm font-semibold text-gray-900 mb-3">Top {topQueries.length} buscas</h2>
        {topQueries.length === 0 ? (
          <p className="text-sm text-gray-600">Ainda sem dados.</p>
        ) : (
          <ol className="bg-white border border-gray-200 rounded-lg divide-y divide-gray-100">
            {topQueries.map((r, i) => {
              const zero = r.lastResults === 0
              return (
                <li key={r.q} className="flex items-center gap-3 px-3 py-2 text-sm">
                  <span className="w-8 text-right text-xs text-gray-500 tabular-nums">{i + 1}.</span>
                  <Link href={`/buscar?q=${encodeURIComponent(r.q)}`} className="flex-1 min-w-0 font-mono text-xs text-blue-700 hover:underline truncate">
                    {r.q}
                  </Link>
                  {zero && (
                    <span className="text-[10px] font-medium px-1.5 py-0.5 rounded bg-red-100 text-red-800 inline-flex items-center gap-1">
                      <AlertTriangle className="w-3 h-3" aria-hidden="true" />
                      zero resultados
                    </span>
                  )}
                  <span className="text-xs text-gray-500 tabular-nums w-16 text-right">{r.hits} hit{r.hits === 1 ? '' : 's'}</span>
                </li>
              )
            })}
          </ol>
        )}
      </section>

      {zeroResults.length > 0 && (
        <section className="mb-10">
          <h2 className="text-sm font-semibold text-gray-900 mb-3 flex items-center gap-1.5">
            <AlertTriangle className="w-4 h-4 text-red-600" aria-hidden="true" />
            Buscas sem resultado ({zeroResults.length})
          </h2>
          <p className="text-xs text-gray-600 mb-2">
            Estes termos foram buscados mas não tinham cobertura no acervo — oportunidades
            editoriais.
          </p>
          <ul className="bg-red-50 border border-red-200 rounded-lg divide-y divide-red-100">
            {zeroResults.map((r) => (
              <li key={r.q} className="flex items-center gap-3 px-3 py-2 text-sm">
                <Link href={`/buscar?q=${encodeURIComponent(r.q)}`} className="flex-1 min-w-0 font-mono text-xs text-red-800 hover:underline truncate">
                  {r.q}
                </Link>
                <span className="text-xs text-red-700 tabular-nums">{r.hits} tentativa{r.hits === 1 ? '' : 's'}</span>
              </li>
            ))}
          </ul>
        </section>
      )}
    </main>
  )
}
