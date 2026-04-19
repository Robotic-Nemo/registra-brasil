import Link from 'next/link'
import Image from 'next/image'
import { TrendingUp } from 'lucide-react'
import { computeWeeklyRecap, currentWeek } from '@/lib/weekly-recap/compute'

export async function WeeklySpotlight() {
  const { start, end } = currentWeek()
  const recap = await computeWeeklyRecap(start, end)
  if (recap.totalStatements === 0) return null

  const top3 = recap.topByseverity.slice(0, 3)
  const topPols = recap.topPoliticians.slice(0, 3)

  return (
    <section className="max-w-7xl mx-auto px-4 py-8">
      <header className="mb-5 flex flex-wrap items-center justify-between gap-3">
        <h2 className="flex items-center gap-2 text-lg font-semibold text-gray-900 dark:text-gray-100">
          <TrendingUp className="h-5 w-5 text-indigo-600" aria-hidden />
          Esta semana
          <span className="text-xs font-normal text-gray-500 dark:text-gray-400">
            · Semana {recap.isoWeek}
          </span>
        </h2>
        <Link href="/esta-semana" className="text-sm text-indigo-700 hover:underline">
          Ver o recap completo →
        </Link>
      </header>

      <div className="grid grid-cols-1 gap-4 md:grid-cols-3">
        <div className="md:col-span-2 rounded-xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-gray-900">
          <p className="mb-3 text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Top por gravidade
          </p>
          {top3.length === 0 ? (
            <p className="text-sm text-gray-500">Ainda nada nesta janela.</p>
          ) : (
            <ol className="flex flex-col gap-2.5">
              {top3.map((s, i) => (
                <li key={s.id} className="flex items-start gap-2 text-sm">
                  <span className="shrink-0 rounded bg-gray-100 px-1.5 py-0.5 text-[11px] font-bold tabular-nums text-gray-700 dark:bg-gray-800 dark:text-gray-300">
                    #{i + 1}
                  </span>
                  <div className="min-w-0 flex-1">
                    <Link
                      href={`/declaracao/${s.slug ?? s.id}`}
                      className="block font-medium text-indigo-700 hover:underline dark:text-indigo-300"
                    >
                      {s.summary.slice(0, 140)}{s.summary.length > 140 ? '…' : ''}
                    </Link>
                    <span className="text-xs text-gray-500 dark:text-gray-400">
                      <Link href={`/politico/${s.politician_slug}`} className="hover:underline">
                        {s.politician_name}
                      </Link>
                      {' · '}
                      {new Date(s.statement_date + 'T12:00:00Z').toLocaleDateString('pt-BR', { day: '2-digit', month: 'short' })}
                    </span>
                  </div>
                </li>
              ))}
            </ol>
          )}
        </div>

        <div className="rounded-xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-gray-900">
          <p className="mb-3 text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Mais ativos · {recap.totalStatements} registros
          </p>
          {topPols.length === 0 ? (
            <p className="text-sm text-gray-500">—</p>
          ) : (
            <ul className="flex flex-col gap-2">
              {topPols.map((p) => (
                <li key={p.slug}>
                  <Link href={`/politico/${p.slug}`} className="flex items-center gap-2 rounded px-1 py-0.5 hover:bg-gray-50 dark:hover:bg-gray-800">
                    {p.photo_url ? (
                      <Image src={p.photo_url} alt="" width={24} height={24} unoptimized className="h-6 w-6 shrink-0 rounded-full object-cover" />
                    ) : (
                      <span className="h-6 w-6 shrink-0 rounded-full bg-gray-200 dark:bg-gray-800" />
                    )}
                    <span className="min-w-0 flex-1 truncate text-sm text-gray-900 dark:text-gray-100">
                      {p.common_name}
                    </span>
                    <span className="shrink-0 text-sm font-semibold tabular-nums text-indigo-700 dark:text-indigo-300">
                      {p.count}
                    </span>
                  </Link>
                </li>
              ))}
            </ul>
          )}
        </div>
      </div>
    </section>
  )
}
