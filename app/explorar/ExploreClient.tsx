'use client'

import { Suspense } from 'react'
import type { StatementWithRelations } from '@/types/database'
import { useExploreFilters } from '@/lib/hooks/useExploreFilters'
import { FilterPanel } from '@/components/explore/FilterPanel'
import { FilterChips } from '@/components/explore/FilterChips'
import { ResultsGrid } from '@/components/explore/ResultsGrid'
import { ResultsList } from '@/components/explore/ResultsList'
import { SortOptions } from '@/components/explore/SortOptions'
import { ViewSwitcher } from '@/components/explore/ViewSwitcher'
import { QuickStats } from '@/components/explore/QuickStats'
import { Pagination } from '@/components/ui/Pagination'

interface Props {
  statements: StatementWithRelations[]
  total: number
  parties: string[]
  categories: { slug: string; label: string }[]
}

export function ExploreClient({ statements, total, parties, categories }: Props) {
  const { filters, activeCount, setFilter, removeFilter, clearAll } = useExploreFilters()
  const viewMode = filters.visualizacao ?? 'grid'

  return (
    <Suspense>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 mb-2">Explorar Declaracoes</h1>
        <p className="text-gray-600">
          Filtre e explore as declaracoes registradas de politicos brasileiros.
        </p>
      </div>

      <div className="flex flex-col lg:flex-row gap-6">
        {/* Sidebar */}
        <aside className="lg:w-64 shrink-0">
          <FilterPanel
            filters={filters}
            onFilterChange={setFilter}
            parties={parties}
            categories={categories}
          />
        </aside>

        {/* Main content */}
        <div className="flex-1 min-w-0 space-y-4">
          <FilterChips filters={filters} onRemove={removeFilter} onClearAll={clearAll} />

          <div className="flex items-center justify-between gap-4">
            <QuickStats totalResults={total} activeFilters={activeCount} />
            <div className="flex items-center gap-3">
              <SortOptions
                value={filters.ordem ?? 'data-desc'}
                onChange={(v) => setFilter('ordem', v)}
              />
              <ViewSwitcher
                value={viewMode}
                onChange={(v) => setFilter('visualizacao', v)}
              />
            </div>
          </div>

          {viewMode === 'lista' ? (
            <ResultsList statements={statements} />
          ) : (
            <ResultsGrid statements={statements} />
          )}

          {total > 20 && (
            <div className="mt-6">
              <Pagination
                page={filters.pagina ?? 1}
                hasMore={(filters.pagina ?? 1) * 20 < total}
                total={total}
                totalPages={Math.ceil(total / 20)}
                paramName="pagina"
              />
            </div>
          )}
        </div>
      </div>
    </Suspense>
  )
}
