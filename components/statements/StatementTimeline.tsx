'use client'

import { useState, useCallback, useMemo } from 'react'
import Link from 'next/link'
import { CategoryTag } from './CategoryTag'
import { VerificationBadge } from './VerificationBadge'
import { formatDatePtBR } from '@/lib/utils/date'
import type { StatementWithRelations } from '@/types/database'

interface Props {
  statements: StatementWithRelations[]
  initialLimit?: number
  loadMoreIncrement?: number
}

const DEFAULT_INITIAL_LIMIT = 20
const DEFAULT_INCREMENT = 20

export function StatementTimeline({
  statements,
  initialLimit = DEFAULT_INITIAL_LIMIT,
  loadMoreIncrement = DEFAULT_INCREMENT,
}: Props) {
  const [visibleCount, setVisibleCount] = useState(initialLimit)

  const loadMore = useCallback(() => {
    setVisibleCount((prev) => Math.min(prev + loadMoreIncrement, statements.length))
  }, [loadMoreIncrement, statements.length])

  if (statements.length === 0) {
    return <p className="text-gray-400 text-sm py-6 text-center">Nenhuma declaracao encontrada.</p>
  }

  const hasMore = visibleCount < statements.length

  // Group visible slice by year — memoize so re-renders don't redo the scan.
  const grouped = useMemo(() => {
    const map = new Map<string, StatementWithRelations[]>()
    for (let i = 0; i < Math.min(visibleCount, statements.length); i++) {
      const s = statements[i]
      const year = s.statement_date.slice(0, 4)
      if (!map.has(year)) map.set(year, [])
      map.get(year)!.push(s)
    }
    return map
  }, [statements, visibleCount])

  return (
    <div className="relative">
      {/* Vertical line */}
      <div className="absolute left-4 top-0 bottom-0 w-px bg-gray-200" aria-hidden="true" />

      {Array.from(grouped.entries()).map(([year, stmts]) => (
        <div key={year} className="mb-8">
          <div className="relative flex items-center mb-4">
            <div className="w-8 h-8 rounded-full bg-blue-600 text-white flex items-center justify-center text-xs font-bold z-10">
              {year.slice(2)}
            </div>
            <span className="ml-3 text-sm font-semibold text-gray-500">{year}</span>
          </div>

          <div className="ml-10 flex flex-col gap-3">
            {stmts.map((s) => {
              const href = `/declaracao/${s.slug ?? s.id}`
              return (
                <Link
                  key={s.id}
                  href={href}
                  className="group block bg-white border border-gray-200 rounded-lg p-4 hover:border-blue-300 hover:shadow-sm transition-all"
                >
                  <div className="flex items-start justify-between gap-2 mb-1">
                    <time className="text-xs text-gray-400" dateTime={s.statement_date}>
                      {formatDatePtBR(s.statement_date, s.statement_date_approx)}
                    </time>
                    <VerificationBadge status={s.verification_status} />
                  </div>
                  <p className="text-sm text-gray-800 group-hover:text-blue-900 line-clamp-2">
                    {s.summary}
                  </p>
                  {s.statement_categories.length > 0 && (
                    <div className="flex flex-wrap gap-1 mt-2">
                      {s.statement_categories.slice(0, 3).map((sc) => (
                        <CategoryTag key={sc.categories.slug} category={sc.categories} size="sm" />
                      ))}
                    </div>
                  )}
                </Link>
              )
            })}
          </div>
        </div>
      ))}

      {hasMore && (
        <div className="relative z-10 flex justify-center mt-4">
          <button
            type="button"
            onClick={loadMore}
            className="px-4 py-2 text-sm font-medium text-blue-700 bg-blue-50 rounded-lg hover:bg-blue-100 transition-colors border border-blue-200 focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-1 focus-visible:ring-blue-500"
            aria-label={`Carregar mais declarações (${statements.length - visibleCount} restantes)`}
          >
            Carregar mais ({statements.length - visibleCount} restantes)
          </button>
        </div>
      )}
    </div>
  )
}
