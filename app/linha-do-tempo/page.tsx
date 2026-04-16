import type { Metadata } from 'next'
import Link from 'next/link'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getGlobalTimeline } from '@/lib/supabase/queries/timeline'
import { formatDatePtBR } from '@/lib/utils/date'

export const metadata: Metadata = {
  title: 'Linha do Tempo | Registra Brasil',
  description: 'Linha do tempo cronológica das declarações verificadas de políticos brasileiros.',
}

export const revalidate = 1800

export default async function TimelinePage() {
  const supabase = getSupabaseServiceClient()
  const entries = await getGlobalTimeline(supabase, 50)

  // Group entries by month
  const grouped = new Map<string, typeof entries>()
  for (const entry of entries) {
    const monthKey = entry.date.slice(0, 7) // YYYY-MM
    const existing = grouped.get(monthKey) ?? []
    existing.push(entry)
    grouped.set(monthKey, existing)
  }

  const months = Array.from(grouped.entries())

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <h1 className="text-3xl font-bold text-zinc-900 mb-2">Linha do Tempo</h1>
      <p className="text-zinc-600 mb-8">
        Cronologia das declarações verificadas mais recentes.
      </p>

      {months.length === 0 ? (
        <p className="text-zinc-500 text-center py-12">Nenhuma declaração encontrada.</p>
      ) : (
        <div className="space-y-8">
          {months.map(([monthKey, items]) => {
            const [year, month] = monthKey.split('-')
            const monthNames = [
              'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
              'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro',
            ]
            const monthName = monthNames[parseInt(month) - 1]

            return (
              <section key={monthKey}>
                <h2 className="text-lg font-semibold text-zinc-800 mb-4 sticky top-16 bg-white/90 backdrop-blur py-2 z-10 border-b border-zinc-100">
                  {monthName} de {year}
                </h2>
                <div className="relative pl-6 border-l-2 border-blue-200 space-y-4">
                  {items.map((entry) => (
                    <div key={entry.id} className="relative">
                      <div className="absolute -left-[25px] top-1 w-3 h-3 rounded-full bg-blue-500 border-2 border-white" />
                      <div className="bg-white border border-zinc-200 rounded-lg p-4 hover:shadow-sm transition-shadow">
                        <div className="flex items-center gap-2 text-xs text-zinc-500 mb-1">
                          <time dateTime={entry.date}>{formatDatePtBR(entry.date)}</time>
                          {entry.categoryLabel && (
                            <span
                              className="px-1.5 py-0.5 rounded text-white text-[10px] font-medium"
                              style={{ backgroundColor: entry.categoryColor ?? '#6b7280' }}
                            >
                              {entry.categoryLabel}
                            </span>
                          )}
                        </div>
                        <Link
                          href={`/declaracao/${entry.id}`}
                          className="text-sm font-medium text-zinc-800 hover:text-blue-700 line-clamp-2"
                        >
                          {entry.summary}
                        </Link>
                        <Link
                          href={`/politico/${entry.politicianSlug}`}
                          className="text-xs text-blue-600 hover:underline mt-1 block"
                        >
                          {entry.politicianName}
                        </Link>
                      </div>
                    </div>
                  ))}
                </div>
              </section>
            )
          })}
        </div>
      )}
    </main>
  )
}
