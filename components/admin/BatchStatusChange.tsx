'use client'

import { useState } from 'react'
import { RefreshCw, Check, AlertCircle } from 'lucide-react'
import type { VerificationStatus } from '@/types/database'

interface BatchStatusChangeProps {
  selectedIds: string[]
  onComplete?: () => void
}

const STATUS_OPTIONS: { value: VerificationStatus; label: string; color: string }[] = [
  { value: 'verified', label: 'Verificada', color: 'text-green-600' },
  { value: 'unverified', label: 'Nao verificada', color: 'text-yellow-600' },
  { value: 'disputed', label: 'Disputada', color: 'text-orange-600' },
  { value: 'removed', label: 'Removida', color: 'text-red-600' },
]

export function BatchStatusChange({ selectedIds, onComplete }: BatchStatusChangeProps) {
  const [targetStatus, setTargetStatus] = useState<VerificationStatus>('verified')
  const [processing, setProcessing] = useState(false)
  const [result, setResult] = useState<{ success: number; failed: number } | null>(null)

  async function handleApply() {
    if (selectedIds.length === 0) return
    setProcessing(true)
    setResult(null)

    try {
      const res = await fetch('/api/admin/batch-status', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ ids: selectedIds, status: targetStatus }),
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
      <h3 className="text-sm font-semibold text-gray-700 mb-3">Alterar status em lote</h3>

      {selectedIds.length === 0 ? (
        <p className="text-sm text-gray-500">Selecione declaracoes para alterar o status.</p>
      ) : (
        <div className="space-y-3">
          <p className="text-sm text-gray-600">
            {selectedIds.length} declaracao(es) selecionada(s)
          </p>

          <div className="flex items-center gap-3">
            <select
              value={targetStatus}
              onChange={(e) => setTargetStatus(e.target.value as VerificationStatus)}
              className="px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              {STATUS_OPTIONS.map((opt) => (
                <option key={opt.value} value={opt.value}>{opt.label}</option>
              ))}
            </select>

            <button
              onClick={handleApply}
              disabled={processing}
              className="inline-flex items-center gap-2 px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 disabled:opacity-50 transition-colors"
            >
              {processing ? (
                <RefreshCw className="w-4 h-4 animate-spin" />
              ) : (
                <Check className="w-4 h-4" />
              )}
              {processing ? 'Aplicando...' : 'Aplicar'}
            </button>
          </div>

          {result && (
            <div className={`flex items-center gap-2 text-sm ${result.failed > 0 ? 'text-yellow-600' : 'text-green-600'}`}>
              {result.failed > 0 ? (
                <AlertCircle className="w-4 h-4" />
              ) : (
                <Check className="w-4 h-4" />
              )}
              {result.success} atualizado(s), {result.failed} com erro
            </div>
          )}
        </div>
      )}
    </div>
  )
}
