'use client'

interface Props {
  value: string
  onChange: (value: string) => void
}

const SORT_OPTIONS = [
  { value: 'data-desc', label: 'Mais recentes' },
  { value: 'data-asc', label: 'Mais antigas' },
  { value: 'politico', label: 'Politico (A-Z)' },
]

export function SortOptions({ value, onChange }: Props) {
  return (
    <div className="flex items-center gap-2">
      <label htmlFor="sort-select" className="text-xs text-gray-500">
        Ordenar:
      </label>
      <select
        id="sort-select"
        value={value || 'data-desc'}
        onChange={(e) => onChange(e.target.value)}
        className="rounded-lg border border-gray-300 px-2 py-1 text-sm bg-white"
      >
        {SORT_OPTIONS.map((opt) => (
          <option key={opt.value} value={opt.value}>
            {opt.label}
          </option>
        ))}
      </select>
    </div>
  )
}
