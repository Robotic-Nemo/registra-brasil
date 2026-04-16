'use client'

import type { ExploreFilters } from '@/lib/hooks/useExploreFilters'

interface Props {
  filters: ExploreFilters
  onRemove: (key: keyof ExploreFilters) => void
  onClearAll: () => void
}

const FILTER_LABELS: Record<string, string> = {
  partido: 'Partido',
  estado: 'Estado',
  categoria: 'Categoria',
  de: 'De',
  ate: 'Ate',
  status: 'Status',
  q: 'Busca',
}

const STATUS_LABELS: Record<string, string> = {
  verified: 'Verificada',
  unverified: 'Nao verificada',
  disputed: 'Disputada',
}

export function FilterChips({ filters, onRemove, onClearAll }: Props) {
  const activeFilters = Object.entries(filters).filter(
    ([key, value]) => value !== undefined && key !== 'ordem' && key !== 'visualizacao' && key !== 'pagina'
  )

  if (activeFilters.length === 0) return null

  return (
    <div className="flex flex-wrap items-center gap-2">
      {activeFilters.map(([key, value]) => {
        const label = FILTER_LABELS[key] ?? key
        const displayValue = key === 'status' ? STATUS_LABELS[value as string] ?? value : value

        return (
          <button
            key={key}
            onClick={() => onRemove(key as keyof ExploreFilters)}
            className="inline-flex items-center gap-1 text-xs bg-blue-50 text-blue-700 border border-blue-200 rounded-full px-2.5 py-1 hover:bg-blue-100 transition-colors"
            aria-label={`Remover filtro ${label}`}
          >
            <span className="font-medium">{label}:</span>
            <span className="max-w-[120px] truncate">{String(displayValue)}</span>
            <svg className="w-3 h-3 ml-0.5" viewBox="0 0 12 12" fill="none" stroke="currentColor" strokeWidth="2">
              <path d="M3 3l6 6M9 3l-6 6" />
            </svg>
          </button>
        )
      })}
      {activeFilters.length > 1 && (
        <button
          onClick={onClearAll}
          className="text-xs text-gray-500 hover:text-gray-700 underline"
        >
          Limpar todos
        </button>
      )}
    </div>
  )
}
