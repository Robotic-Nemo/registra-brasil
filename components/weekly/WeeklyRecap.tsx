import Link from 'next/link'
import Image from 'next/image'
import type { WeeklyRecap } from '@/lib/weekly-recap/compute'

function fmtDateShort(iso: string): string {
  return new Date(iso + 'T12:00:00Z').toLocaleDateString('pt-BR', {
    day: '2-digit', month: 'short',
  })
}

export function WeeklyRecapView({ recap }: { recap: WeeklyRecap }) {
  const dateRange = `${fmtDateShort(recap.weekStart)} – ${fmtDateShort(recap.weekEnd)}`
  return (
    <article>
      <header className="mb-6">
        <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
          Recap semanal
        </p>
        <h2 className="mt-1 text-2xl font-bold text-gray-900 dark:text-gray-100">
          Semana {recap.isoWeek} · {dateRange}
        </h2>
        <p className="mt-1 text-sm text-gray-600 dark:text-gray-300">
          {recap.totalStatements.toLocaleString('pt-BR')} declarações registradas nesta janela.
        </p>
      </header>

      <section className="mb-8">
        <h3 className="mb-3 text-sm font-semibold uppercase tracking-wider text-gray-700 dark:text-gray-300">
          Top por gravidade
        </h3>
        {recap.topByseverity.length === 0 ? (
          <p className="text-sm text-gray-500">Sem registros na janela.</p>
        ) : (
          <ol className="flex flex-col gap-3">
            {recap.topByseverity.map((s, i) => (
              <li key={s.id} className="flex gap-3 rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
                <span className="shrink-0 rounded-full bg-gray-100 px-2 py-1 text-xs font-bold tabular-nums text-gray-700 dark:bg-gray-800 dark:text-gray-300">
                  #{i + 1}
                </span>
                <div className="min-w-0 flex-1">
                  <Link
                    href={`/declaracao/${s.slug ?? s.id}`}
                    className="block font-medium text-indigo-700 hover:underline dark:text-indigo-300"
                  >
                    {s.summary.slice(0, 180)}{s.summary.length > 180 ? '…' : ''}
                  </Link>
                  <div className="mt-1 text-xs text-gray-500 dark:text-gray-400">
                    <Link href={`/politico/${s.politician_slug}`} className="hover:underline">
                      {s.politician_name}
                    </Link>
                    {' · '}{fmtDateShort(s.statement_date)}
                    {s.severity_score !== null && <> · gravidade {s.severity_score}</>}
                  </div>
                  {s.categories.length > 0 && (
                    <div className="mt-1 flex flex-wrap gap-1">
                      {s.categories.slice(0, 3).map((c) => (
                        <Link
                          key={c.slug}
                          href={`/categorias/${c.slug}`}
                          className="rounded-full px-2 py-0.5 text-[10px] font-medium"
                          style={{
                            backgroundColor: (c.color_hex ?? '#6b7280') + '22',
                            color: c.color_hex ?? '#374151',
                          }}
                        >
                          {c.label_pt}
                        </Link>
                      ))}
                    </div>
                  )}
                </div>
              </li>
            ))}
          </ol>
        )}
      </section>

      <section className="mb-8 grid grid-cols-1 gap-6 md:grid-cols-2">
        <div className="rounded-xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-gray-900">
          <h3 className="mb-3 text-sm font-semibold uppercase tracking-wider text-gray-700 dark:text-gray-300">
            Políticos mais ativos
          </h3>
          {recap.topPoliticians.length === 0 ? (
            <p className="text-xs text-gray-500">—</p>
          ) : (
            <ul className="flex flex-col gap-2">
              {recap.topPoliticians.map((p) => (
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
                    <span className="text-xs text-gray-500 dark:text-gray-400">
                      {p.party}{p.state ? `-${p.state}` : ''}
                    </span>
                    <span className="text-sm font-semibold tabular-nums text-indigo-700 dark:text-indigo-300">
                      {p.count}
                    </span>
                  </Link>
                </li>
              ))}
            </ul>
          )}
        </div>

        <div className="rounded-xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-gray-900">
          <h3 className="mb-3 text-sm font-semibold uppercase tracking-wider text-gray-700 dark:text-gray-300">
            Temas da semana
          </h3>
          {recap.topCategories.length === 0 ? (
            <p className="text-xs text-gray-500">—</p>
          ) : (
            <ul className="flex flex-col gap-2">
              {recap.topCategories.map((c) => (
                <li key={c.slug}>
                  <Link href={`/categorias/${c.slug}`} className="flex items-center gap-2">
                    <span
                      aria-hidden
                      className="h-2.5 w-2.5 rounded-full"
                      style={{ backgroundColor: c.color_hex ?? '#9ca3af' }}
                    />
                    <span className="min-w-0 flex-1 truncate text-sm text-gray-900 dark:text-gray-100">
                      {c.label_pt}
                    </span>
                    <span className="text-sm font-semibold tabular-nums text-indigo-700 dark:text-indigo-300">
                      {c.count}
                    </span>
                  </Link>
                </li>
              ))}
            </ul>
          )}
        </div>
      </section>
    </article>
  )
}
