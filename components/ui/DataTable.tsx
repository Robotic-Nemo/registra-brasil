'use client'

import { useState, useMemo } from 'react'

interface Column<T> {
  key: string
  label: string
  render?: (item: T) => React.ReactNode
  sortable?: boolean
  width?: string
}

interface DataTableProps<T> {
  columns: Column<T>[]
  data: T[]
  keyField?: string
  defaultSort?: { key: string; direction: 'asc' | 'desc' }
  searchable?: boolean
  searchPlaceholder?: string
  emptyMessage?: string
  className?: string
}

export function DataTable<T extends Record<string, unknown>>({
  columns,
  data,
  keyField = 'id',
  defaultSort,
  searchable = false,
  searchPlaceholder = 'Filtrar...',
  emptyMessage = 'Nenhum dado encontrado.',
  className = '',
}: DataTableProps<T>) {
  const [sort, setSort] = useState(defaultSort ?? { key: '', direction: 'asc' as const })
  const [search, setSearch] = useState('')

  const filteredData = useMemo(() => {
    let result = data

    if (search) {
      const q = search.toLowerCase()
      result = result.filter(item =>
        Object.values(item).some(v =>
          String(v ?? '').toLowerCase().includes(q)
        )
      )
    }

    if (sort.key) {
      result = [...result].sort((a, b) => {
        const aVal = String(a[sort.key] ?? '')
        const bVal = String(b[sort.key] ?? '')
        const cmp = aVal.localeCompare(bVal, 'pt-BR', { numeric: true })
        return sort.direction === 'asc' ? cmp : -cmp
      })
    }

    return result
  }, [data, search, sort])

  const toggleSort = (key: string) => {
    setSort(prev =>
      prev.key === key
        ? { key, direction: prev.direction === 'asc' ? 'desc' : 'asc' }
        : { key, direction: 'asc' }
    )
  }

  return (
    <div className={className}>
      {searchable && (
        <div className="mb-3">
          <input
            type="search"
            value={search}
            onChange={e => setSearch(e.target.value)}
            placeholder={searchPlaceholder}
            className="w-full max-w-sm px-3 py-2 text-sm border border-zinc-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none"
            aria-label="Filtrar dados"
          />
        </div>
      )}

      <div className="overflow-x-auto border border-zinc-200 rounded-lg">
        <table className="w-full text-sm">
          <thead>
            <tr className="bg-zinc-50 border-b border-zinc-200">
              {columns.map(col => (
                <th
                  key={col.key}
                  className={`p-3 text-left text-xs font-semibold text-zinc-600 uppercase ${
                    col.sortable ? 'cursor-pointer hover:bg-zinc-100 select-none' : ''
                  }`}
                  style={col.width ? { width: col.width } : undefined}
                  onClick={col.sortable ? () => toggleSort(col.key) : undefined}
                >
                  <span className="flex items-center gap-1">
                    {col.label}
                    {col.sortable && sort.key === col.key && (
                      <span className="text-blue-600">
                        {sort.direction === 'asc' ? '↑' : '↓'}
                      </span>
                    )}
                  </span>
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {filteredData.length === 0 ? (
              <tr>
                <td colSpan={columns.length} className="p-8 text-center text-zinc-500">
                  {emptyMessage}
                </td>
              </tr>
            ) : (
              filteredData.map(item => (
                <tr key={String(item[keyField])} className="border-b border-zinc-100 hover:bg-zinc-50">
                  {columns.map(col => (
                    <td key={col.key} className="p-3">
                      {col.render ? col.render(item) : String(item[col.key] ?? '')}
                    </td>
                  ))}
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>

      {filteredData.length > 0 && (
        <p className="text-xs text-zinc-400 mt-2">
          {filteredData.length === data.length
            ? `${data.length} registros`
            : `${filteredData.length} de ${data.length} registros`}
        </p>
      )}
    </div>
  )
}
