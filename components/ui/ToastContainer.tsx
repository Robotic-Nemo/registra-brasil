'use client'

import { useState, useEffect, useCallback } from 'react'
import { CheckCircle, AlertCircle, AlertTriangle, Info, X } from 'lucide-react'
import { toastManager, subscribe, type ToastMessage } from '@/lib/hooks/useToast'

const ICONS = {
  success: CheckCircle,
  error: AlertCircle,
  warning: AlertTriangle,
  info: Info,
} as const

const VARIANT_CLASSES = {
  success: 'bg-green-50 border-green-200 text-green-800',
  error: 'bg-red-50 border-red-200 text-red-800',
  warning: 'bg-amber-50 border-amber-200 text-amber-800',
  info: 'bg-blue-50 border-blue-200 text-blue-800',
} as const

/**
 * Renders toasts from the imperative toastManager.
 * Place this once in your layout, separate from the context-based ToastProvider.
 */
export function ToastContainer() {
  const [toasts, setToasts] = useState<ToastMessage[]>([])

  useEffect(() => {
    return subscribe(setToasts)
  }, [])

  const dismiss = useCallback((id: string) => {
    toastManager.dismiss(id)
  }, [])

  if (toasts.length === 0) return null

  return (
    <div
      aria-live="polite"
      aria-label="Notificacoes"
      className="fixed top-4 right-4 z-50 flex flex-col gap-2 max-w-sm pointer-events-none"
    >
      {toasts.map((t) => {
        const Icon = ICONS[t.variant]
        return (
          <div
            key={t.id}
            role="status"
            className={`pointer-events-auto flex items-start gap-2 px-4 py-3 rounded-lg border shadow-lg text-sm animate-in slide-in-from-right ${VARIANT_CLASSES[t.variant]}`}
          >
            <Icon className="w-4 h-4 mt-0.5 flex-shrink-0" />
            <span className="flex-1">{t.message}</span>
            <button
              type="button"
              onClick={() => dismiss(t.id)}
              aria-label="Fechar"
              className="flex-shrink-0 opacity-60 hover:opacity-100"
            >
              <X className="w-4 h-4" />
            </button>
          </div>
        )
      })}
    </div>
  )
}
