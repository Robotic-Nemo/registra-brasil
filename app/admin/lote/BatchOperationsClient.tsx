'use client'

import { useState } from 'react'
import { BatchStatusChange } from '@/components/admin/BatchStatusChange'
import { BatchCategoryAssign } from '@/components/admin/BatchCategoryAssign'

interface StatementItem {
  id: string
  summary: string
  verification_status: string
  statement_date: string
  politician_name: string
}

interface BatchOperationsClientProps {
  statements: StatementItem[]
  categories: { id: string; label_pt: string; color_hex: string }[]
}

export function BatchOperationsClient({ statements, categories }: BatchOperationsClientProps) {
  const [selectedIds, setSelectedIds] = useState<Set<string>>(new Set())
  const [statusFilter, setStatusFilter] = useState('')

  const filtered = statements.filter((s) => !statusFilter || s.verification_status === statusFilter)

  function toggleSelect(id: string) {
    setSelectedIds((prev) => {
      const next = new Set(prev)
      if (next.has(id)) next.delete(id)
      else next.add(id)
      return next
    })
  }

  function toggleAll() {
    if (selectedIds.size === filtered.length) {
      setSelectedIds(new Set())
    } else {
      setSelectedIds(new Set(filtered.map((s) => s.id)))
    }
  }

  const selectedArr = Array.from(selectedIds)

  return (
    <div className="space-y-4">
      {/* Actions */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
        <BatchStatusChange selectedIds={selectedArr} />
        <BatchCategoryAssign selectedIds={selectedArr} categories={categories} />
      </div>

      {/* Statement selection */}
      <div className="bg-white border border-gray-200 rounded-xl overflow-hidden">
        <div className="px-4 py-3 border-b border-gray-100 flex items-center gap-3">
          <label className="inline-flex items-center gap-2">
            <input
              type="checkbox"
              checked={selectedIds.size === filtered.length && filtered.length > 0}
              onChange={toggleAll}
              className="rounded border-gray-300 text-blue-600 focus:ring-blue-500"
            />
            <span className="text-sm text-gray-600">
              {selectedIds.size > 0 ? `${selectedIds.size} selecionada(s)` : 'Selecionar todas'}
            </span>
          </label>

          <select
            value={statusFilter}
            onChange={(e) => { setStatusFilter(e.target.value); setSelectedIds(new Set()) }}
            className="ml-auto px-2 py-1 text-xs border border-gray-200 rounded-lg"
          >
            <option value="">Todos os status</option>
            <option value="unverified">Nao verificada</option>
            <option value="verified">Verificada</option>
            <option value="disputed">Disputada</option>
          </select>
        </div>

        <div className="max-h-96 overflow-y-auto divide-y divide-gray-50">
          {filtered.map((stmt) => (
            <label
              key={stmt.id}
              className="flex items-center gap-3 px-4 py-2.5 hover:bg-gray-50 cursor-pointer transition-colors"
            >
              <input
                type="checkbox"
                checked={selectedIds.has(stmt.id)}
                onChange={() => toggleSelect(stmt.id)}
                className="rounded border-gray-300 text-blue-600 focus:ring-blue-500"
              />
              <div className="min-w-0 flex-1">
                <p className="text-sm text-gray-900 truncate">{stmt.summary}</p>
                <p className="text-xs text-gray-500">
                  {stmt.politician_name} &middot;{' '}
                  {new Date(stmt.statement_date).toLocaleDateString('pt-BR')}
                </p>
              </div>
              <span className={`text-[10px] font-medium px-2 py-0.5 rounded-full ${
                stmt.verification_status === 'verified' ? 'bg-green-100 text-green-700' :
                stmt.verification_status === 'disputed' ? 'bg-orange-100 text-orange-700' :
                'bg-yellow-100 text-yellow-700'
              }`}>
                {stmt.verification_status}
              </span>
            </label>
          ))}
        </div>

        {filtered.length === 0 && (
          <div className="px-4 py-8 text-center text-sm text-gray-500">
            Nenhuma declaracao encontrada.
          </div>
        )}
      </div>
    </div>
  )
}
