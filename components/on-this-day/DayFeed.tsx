import Link from 'next/link'
import Image from 'next/image'
import type { DayStatement } from '@/lib/on-this-day/queries'

export function DayFeed({ rows }: { rows: DayStatement[] }) {
  if (rows.length === 0) {
    return <p className="text-sm text-gray-500">Nenhuma declaração registrada neste dia em anos anteriores.</p>
  }

  // Group by year
  const groups = new Map<number, DayStatement[]>()
  for (const r of rows) {
    const y = Number(r.statement_date.slice(0, 4))
    if (!groups.has(y)) groups.set(y, [])
    groups.get(y)!.push(r)
  }
  const years = [...groups.keys()].sort((a, b) => b - a)

  return (
    <div className="flex flex-col gap-8">
      {years.map((year) => (
        <section key={year}>
          <h2 className="sticky top-0 mb-3 bg-gray-50 py-1 text-lg font-bold text-gray-900 dark:bg-gray-950 dark:text-gray-100">
            {year}{' '}
            <span className="ml-2 text-xs font-normal text-gray-500">
              {groups.get(year)!.length} {groups.get(year)!.length === 1 ? 'declaração' : 'declarações'}
            </span>
          </h2>
          <ul className="flex flex-col gap-2">
            {groups.get(year)!.map((r) => (
              <li key={r.id} className="rounded-xl border border-gray-200 bg-white p-3 dark:border-gray-800 dark:bg-gray-900">
                <div className="flex items-start gap-3">
                  {r.politician_photo_url ? (
                    <Image src={r.politician_photo_url} alt="" width={32} height={32} unoptimized className="h-8 w-8 shrink-0 rounded-full object-cover" />
                  ) : <span className="h-8 w-8 shrink-0 rounded-full bg-gray-200 dark:bg-gray-800" />}
                  <div className="min-w-0 flex-1">
                    <Link
                      href={`/declaracao/${r.slug ?? r.id}`}
                      className="block text-sm font-medium text-indigo-700 hover:underline dark:text-indigo-300"
                    >
                      {r.summary.slice(0, 200)}{r.summary.length > 200 ? '…' : ''}
                    </Link>
                    <div className="mt-0.5 text-xs text-gray-500 dark:text-gray-400">
                      <Link href={`/politico/${r.politician_slug}`} className="hover:underline">
                        {r.politician_name}
                      </Link>
                      {r.politician_party && <> · {r.politician_party}{r.politician_state ? `-${r.politician_state}` : ''}</>}
                      {r.severity_score !== null && <> · sev {r.severity_score}</>}
                    </div>
                  </div>
                </div>
              </li>
            ))}
          </ul>
        </section>
      ))}
    </div>
  )
}
