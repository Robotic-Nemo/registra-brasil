'use client'

export type SortOption = 'relevancia' | 'data' | 'politico'

interface SearchSortProps {
  value: SortOption
  onChange: (value: SortOption) => void
}

const OPTIONS: { value: SortOption; label: string }[] = [
  { value: 'relevancia', label: 'Relevancia' },
  { value: 'data', label: 'Data (mais recente)' },
  { value: 'politico', label: 'Politico (A-Z)' },
]

/**
 * Sort dropdown for search results.
 */
export function SearchSort({ value, onChange }: SearchSortProps) {
  return (
    <div className="flex items-center gap-2">
      <label htmlFor="search-sort" className="text-sm text-gray-500 whitespace-nowrap">
        Ordenar por:
      </label>
      <select
        id="search-sort"
        value={value}
        onChange={(e) => onChange(e.target.value as SortOption)}
        className="text-sm border border-gray-200 rounded-lg px-2 py-1.5 bg-white focus:outline-none focus:ring-2 focus:ring-blue-500"
      >
        {OPTIONS.map((opt) => (
          <option key={opt.value} value={opt.value}>
            {opt.label}
          </option>
        ))}
      </select>
    </div>
  )
}
