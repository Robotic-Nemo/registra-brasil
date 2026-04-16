'use client'

import { useState, useTransition } from 'react'
import { CheckCircle, XCircle, Loader2 } from 'lucide-react'
import type { VerificationStatus } from '@/types/database'

interface BulkActionsProps {
  selectedIds: string[]
  onAction: (ids: string[], action: VerificationStatus) => Promise<void>
  onClearSelection: () => void
}

/**
 * Toolbar for bulk actions on selected statements.
 * Shows action buttons when statements are selected.
 */
export function BulkActions({ selectedIds, onAction, onClearSelection }: BulkActionsProps) {
  const [isPending, startTransition] = useTransition()
  const [lastAction, setLastAction] = useState<string | null>(null)

  if (selectedIds.length === 0) return null

  const handleAction = (status: VerificationStatus, label: string) => {
    setLastAction(label)
    startTransition(async () => {
      await onAction(selectedIds, status)
      onClearSelection()
      setLastAction(null)
    })
  }

  return (
    <div className="sticky top-0 z-10 bg-blue-50 border border-blue-200 rounded-lg px-4 py-3 flex items-center justify-between gap-4">
      <p className="text-sm text-blue-800 font-medium">
        {selectedIds.length} {selectedIds.length === 1 ? 'declaracao selecionada' : 'declaracoes selecionadas'}
      </p>

      <div className="flex items-center gap-2">
        {isPending && (
          <span className="flex items-center gap-1.5 text-sm text-blue-600">
            <Loader2 className="w-4 h-4 animate-spin" />
            {lastAction}...
          </span>
        )}

        <button
          type="button"
          onClick={() => handleAction('verified', 'Verificando')}
          disabled={isPending}
          className="inline-flex items-center gap-1.5 px-3 py-1.5 text-sm font-medium text-green-700 bg-green-100 hover:bg-green-200 rounded-lg transition-colors disabled:opacity-50"
        >
          <CheckCircle className="w-4 h-4" />
          Verificar
        </button>

        <button
          type="button"
          onClick={() => handleAction('removed', 'Rejeitando')}
          disabled={isPending}
          className="inline-flex items-center gap-1.5 px-3 py-1.5 text-sm font-medium text-red-700 bg-red-100 hover:bg-red-200 rounded-lg transition-colors disabled:opacity-50"
        >
          <XCircle className="w-4 h-4" />
          Rejeitar
        </button>

        <button
          type="button"
          onClick={onClearSelection}
          disabled={isPending}
          className="px-3 py-1.5 text-sm text-gray-600 hover:text-gray-900 hover:bg-gray-100 rounded-lg transition-colors disabled:opacity-50"
        >
          Limpar
        </button>
      </div>
    </div>
  )
}
