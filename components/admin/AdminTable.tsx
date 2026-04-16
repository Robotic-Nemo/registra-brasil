'use client'

import { useState } from 'react'

interface Column<T> {
  key: string
  label: string
  render?: (item: T) => React.ReactNode
  sortable?: boolean
  className?: string
}

interface AdminTableProps<T extends { id: string }> {
  columns: Column<T>[]
  data: T[]
  selectable?: boolean
  onSelectionChange?: (ids: string[]) => void
  emptyMessage?: string
}

export function AdminTable<T extends { id: string }>({
  columns,
  data,
  selectable = false,
  onSelectionChange,
  emptyMessage = 'Nenhum item encontrado.',
}: AdminTableProps<T>) {
  const [selectedIds, setSelectedIds] = useState<Set<string>>(new Set())

  const toggleSelect = (id: string) => {
    const next = new Set(selectedIds)
    if (next.has(id)) {
      next.delete(id)
    } else {
      next.add(id)
    }
    setSelectedIds(next)
    onSelectionChange?.(Array.from(next))
  }

  const toggleAll = () => {
    if (selectedIds.size === data.length) {
      setSelectedIds(new Set())
      onSelectionChange?.([])
    } else {
      const all = new Set(data.map(d => d.id))
      setSelectedIds(all)
      onSelectionChange?.(Array.from(all))
    }
  }

  if (data.length === 0) {
    return <p className="text-sm text-zinc-500 text-center py-8">{emptyMessage}</p>
  }

  return (
    <div className="overflow-x-auto border border-zinc-200 rounded-lg">
      <table className="w-full text-sm">
        <thead>
          <tr className="bg-zinc-50 border-b border-zinc-200">
            {selectable && (
              <th className="p-3 w-10">
                <input
                  type="checkbox"
                  checked={selectedIds.size === data.length}
                  onChange={toggleAll}
                  aria-label="Selecionar todos"
                />
              </th>
            )}
            {columns.map((col) => (
              <th
                key={col.key}
                className={`p-3 text-left text-xs font-semibold text-zinc-600 uppercase ${col.className ?? ''}`}
              >
                {col.label}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {data.map((item) => (
            <tr
              key={item.id}
              className={`border-b border-zinc-100 hover:bg-zinc-50 transition-colors ${
                selectedIds.has(item.id) ? 'bg-blue-50' : ''
              }`}
            >
              {selectable && (
                <td className="p-3">
                  <input
                    type="checkbox"
                    checked={selectedIds.has(item.id)}
                    onChange={() => toggleSelect(item.id)}
                    aria-label={`Selecionar item ${item.id}`}
                  />
                </td>
              )}
              {columns.map((col) => (
                <td key={col.key} className={`p-3 ${col.className ?? ''}`}>
                  {col.render
                    ? col.render(item)
                    : String((item as Record<string, unknown>)[col.key] ?? '')}
                </td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>

      {selectable && selectedIds.size > 0 && (
        <div className="bg-blue-50 border-t border-blue-200 px-4 py-2 text-sm text-blue-700">
          {selectedIds.size} item(ns) selecionado(s)
        </div>
      )}
    </div>
  )
}
