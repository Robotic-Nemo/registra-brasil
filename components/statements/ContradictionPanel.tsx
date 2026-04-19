import Link from 'next/link'
import { GitCompare } from 'lucide-react'
import type { ContradictionPairFull } from '@/lib/contradictions/queries'

function fmt(iso: string): string {
  return new Date(iso).toLocaleDateString('pt-BR', { year: 'numeric', month: 'short', day: '2-digit' })
}

export function ContradictionPanel({
  pairs,
  currentStatementId,
}: {
  pairs: ContradictionPairFull[]
  currentStatementId: string
}) {
  if (pairs.length === 0) return null
  return (
    <section
      aria-label="Contradições registradas"
      className="my-6 rounded-xl border border-rose-200 bg-rose-50/60 p-5 dark:border-rose-900/50 dark:bg-rose-950/20"
    >
      <header className="mb-3 flex items-center gap-2">
        <GitCompare className="h-5 w-5 text-rose-700 dark:text-rose-300" />
        <h2 className="text-sm font-semibold text-rose-900 dark:text-rose-200">
          Contradições editoriais ({pairs.length})
        </h2>
      </header>
      <p className="mb-4 text-xs text-rose-900/80 dark:text-rose-200/80">
        Outros registros do próprio político foram marcados como contraditórios em
        relação a este.
      </p>
      <ul className="flex flex-col gap-3">
        {pairs.map((p) => {
          const other = p.statement_low.id === currentStatementId
            ? p.statement_high
            : p.statement_low
          return (
            <li key={p.id}>
              <Link
                href={`/contradicoes/${p.id}`}
                className="block rounded-lg border border-rose-200 bg-white p-3 hover:border-rose-400 hover:shadow-sm dark:border-rose-900/60 dark:bg-gray-900 dark:hover:border-rose-500"
              >
                <div className="text-sm font-medium text-rose-900 dark:text-rose-200">
                  {p.headline}
                </div>
                <div className="mt-1 text-xs text-gray-600 dark:text-gray-400">
                  Contrapõe-se a{' '}
                  <span className="font-medium text-gray-800 dark:text-gray-200">
                    {fmt(other.statement_date)}:
                  </span>{' '}
                  “{other.summary.slice(0, 120)}{other.summary.length > 120 ? '…' : ''}”
                </div>
              </Link>
            </li>
          )
        })}
      </ul>
    </section>
  )
}
