'use client'

import { useState, useMemo } from 'react'
import type { StatementWithRelations } from '@/types/database'
import { StatementGrid } from './StatementGrid'
import { SearchInput } from '@/components/ui/SearchInput'
import { useDebounce } from '@/lib/hooks/useDebounce'

interface Props {
  statements: StatementWithRelations[]
  showSearch?: boolean
}

export function StatementFilters({ statements, showSearch = true }: Props) {
  const [query, setQuery] = useState('')
  const [sortBy, setSortBy] = useState<'date' | 'relevance'>('date')
  const debouncedQuery = useDebounce(query, 300)

  const filtered = useMemo(() => {
    let results = statements

    if (debouncedQuery.length >= 2) {
      const q = debouncedQuery.toLowerCase()
      results = results.filter(
        (s) =>
          s.summary.toLowerCase().includes(q) ||
          s.full_quote?.toLowerCase().includes(q) ||
          s.context?.toLowerCase().includes(q)
      )
    }

    if (sortBy === 'date') {
      results = [...results].sort((a, b) => b.statement_date.localeCompare(a.statement_date))
    }

    return results
  }, [statements, debouncedQuery, sortBy])

  return (
    <div>
      {showSearch && (
        <div className="flex items-center gap-3 mb-4">
          <SearchInput
            value={query}
            onChange={setQuery}
            placeholder="Filtrar declarações..."
            className="flex-1"
          />
          <select
            value={sortBy}
            onChange={(e) => setSortBy(e.target.value as 'date' | 'relevance')}
            className="text-sm border border-gray-300 rounded-lg px-2 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
            aria-label="Ordenar por"
          >
            <option value="date">Mais recentes</option>
            <option value="relevance">Relevância</option>
          </select>
        </div>
      )}
      <p className="text-xs text-gray-400 mb-3">
        {filtered.length} declaração{filtered.length !== 1 ? 'ões' : ''}
        {debouncedQuery && ` para "${debouncedQuery}"`}
      </p>
      <StatementGrid statements={filtered} />
    </div>
  )
}
