'use client'

import { useState } from 'react'
import { Tag, Check, AlertCircle, RefreshCw } from 'lucide-react'

interface CategoryOption {
  id: string
  label_pt: string
  color_hex: string
}

interface BatchCategoryAssignProps {
  selectedIds: string[]
  categories: CategoryOption[]
  onComplete?: () => void
}

export function BatchCategoryAssign({ selectedIds, categories, onComplete }: BatchCategoryAssignProps) {
  const [selectedCategory, setSelectedCategory] = useState('')
  const [isPrimary, setIsPrimary] = useState(false)
  const [processing, setProcessing] = useState(false)
  const [result, setResult] = useState<{ success: number; failed: number } | null>(null)

  async function handleAssign() {
    if (selectedIds.length === 0 || !selectedCategory) return
    setProcessing(true)
    setResult(null)

    try {
      const res = await fetch('/api/admin/batch-category', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          statementIds: selectedIds,
          categoryId: selectedCategory,
          isPrimary,
        }),
      })
      const data = await res.json()
      setResult({ success: data.success ?? 0, failed: data.failed ?? 0 })
      onComplete?.()
    } catch {
      setResult({ success: 0, failed: selectedIds.length })
    }
    setProcessing(false)
  }

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      <h3 className="text-sm font-semibold text-gray-700 mb-3 flex items-center gap-2">
        <Tag className="w-4 h-4" />
        Atribuir categoria em lote
      </h3>

      {selectedIds.length === 0 ? (
        <p className="text-sm text-gray-500">Selecione declaracoes para atribuir categoria.</p>
      ) : (
        <div className="space-y-3">
          <p className="text-sm text-gray-600">
            {selectedIds.length} declaracao(es) selecionada(s)
          </p>

          <div className="flex flex-wrap items-center gap-3">
            <select
              value={selectedCategory}
              onChange={(e) => setSelectedCategory(e.target.value)}
              className="px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              <option value="">Selecione uma categoria</option>
              {categories.map((cat) => (
                <option key={cat.id} value={cat.id}>{cat.label_pt}</option>
              ))}
            </select>

            <label className="inline-flex items-center gap-2 text-sm text-gray-600">
              <input
                type="checkbox"
                checked={isPrimary}
                onChange={(e) => setIsPrimary(e.target.checked)}
                className="rounded border-gray-300 text-blue-600 focus:ring-blue-500"
              />
              Categoria primaria
            </label>

            <button
              onClick={handleAssign}
              disabled={processing || !selectedCategory}
              className="inline-flex items-center gap-2 px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 disabled:opacity-50 transition-colors"
            >
              {processing ? (
                <RefreshCw className="w-4 h-4 animate-spin" />
              ) : (
                <Check className="w-4 h-4" />
              )}
              {processing ? 'Atribuindo...' : 'Atribuir'}
            </button>
          </div>

          {result && (
            <div className={`flex items-center gap-2 text-sm ${result.failed > 0 ? 'text-yellow-600' : 'text-green-600'}`}>
              {result.failed > 0 ? <AlertCircle className="w-4 h-4" /> : <Check className="w-4 h-4" />}
              {result.success} atribuido(s), {result.failed} com erro
            </div>
          )}
        </div>
      )}
    </div>
  )
}
