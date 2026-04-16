'use client'

import { BRAZILIAN_STATES } from '@/lib/constants/states'
import type { ExploreFilters } from '@/lib/hooks/useExploreFilters'

interface Props {
  filters: ExploreFilters
  onFilterChange: (key: keyof ExploreFilters, value: string | undefined) => void
  parties: string[]
  categories: { slug: string; label: string }[]
}

export function FilterPanel({ filters, onFilterChange, parties, categories }: Props) {
  return (
    <div className="bg-white border border-gray-200 rounded-xl p-4 space-y-4">
      <h2 className="font-semibold text-gray-900 text-sm">Filtros</h2>

      {/* Search */}
      <div>
        <label htmlFor="filter-q" className="block text-xs font-medium text-gray-600 mb-1">
          Busca
        </label>
        <input
          id="filter-q"
          type="search"
          value={filters.q ?? ''}
          onChange={(e) => onFilterChange('q', e.target.value || undefined)}
          placeholder="Buscar declaracoes..."
          className="w-full rounded-lg border border-gray-300 px-3 py-1.5 text-sm focus:border-blue-500 focus:ring-1 focus:ring-blue-500 outline-none"
        />
      </div>

      {/* Party */}
      <div>
        <label htmlFor="filter-partido" className="block text-xs font-medium text-gray-600 mb-1">
          Partido
        </label>
        <select
          id="filter-partido"
          value={filters.partido ?? ''}
          onChange={(e) => onFilterChange('partido', e.target.value || undefined)}
          className="w-full rounded-lg border border-gray-300 px-3 py-1.5 text-sm"
        >
          <option value="">Todos os partidos</option>
          {parties.map((p) => (
            <option key={p} value={p}>{p}</option>
          ))}
        </select>
      </div>

      {/* State */}
      <div>
        <label htmlFor="filter-estado" className="block text-xs font-medium text-gray-600 mb-1">
          Estado
        </label>
        <select
          id="filter-estado"
          value={filters.estado ?? ''}
          onChange={(e) => onFilterChange('estado', e.target.value || undefined)}
          className="w-full rounded-lg border border-gray-300 px-3 py-1.5 text-sm"
        >
          <option value="">Todos os estados</option>
          {BRAZILIAN_STATES.map((s) => (
            <option key={s.uf} value={s.uf}>{s.name} ({s.uf})</option>
          ))}
        </select>
      </div>

      {/* Category */}
      <div>
        <label htmlFor="filter-categoria" className="block text-xs font-medium text-gray-600 mb-1">
          Categoria
        </label>
        <select
          id="filter-categoria"
          value={filters.categoria ?? ''}
          onChange={(e) => onFilterChange('categoria', e.target.value || undefined)}
          className="w-full rounded-lg border border-gray-300 px-3 py-1.5 text-sm"
        >
          <option value="">Todas as categorias</option>
          {categories.map((c) => (
            <option key={c.slug} value={c.slug}>{c.label}</option>
          ))}
        </select>
      </div>

      {/* Status */}
      <div>
        <label htmlFor="filter-status" className="block text-xs font-medium text-gray-600 mb-1">
          Status
        </label>
        <select
          id="filter-status"
          value={filters.status ?? ''}
          onChange={(e) => onFilterChange('status', e.target.value || undefined)}
          className="w-full rounded-lg border border-gray-300 px-3 py-1.5 text-sm"
        >
          <option value="">Todos</option>
          <option value="verified">Verificada</option>
          <option value="unverified">Nao verificada</option>
          <option value="disputed">Disputada</option>
        </select>
      </div>

      {/* Date range */}
      <div className="grid grid-cols-2 gap-2">
        <div>
          <label htmlFor="filter-de" className="block text-xs font-medium text-gray-600 mb-1">
            De
          </label>
          <input
            id="filter-de"
            type="date"
            value={filters.de ?? ''}
            onChange={(e) => onFilterChange('de', e.target.value || undefined)}
            className="w-full rounded-lg border border-gray-300 px-2 py-1.5 text-sm"
          />
        </div>
        <div>
          <label htmlFor="filter-ate" className="block text-xs font-medium text-gray-600 mb-1">
            Ate
          </label>
          <input
            id="filter-ate"
            type="date"
            value={filters.ate ?? ''}
            onChange={(e) => onFilterChange('ate', e.target.value || undefined)}
            className="w-full rounded-lg border border-gray-300 px-2 py-1.5 text-sm"
          />
        </div>
      </div>
    </div>
  )
}
