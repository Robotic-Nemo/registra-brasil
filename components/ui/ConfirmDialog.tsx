'use client'

import { useEffect, useRef } from 'react'
import { Modal } from './Modal'

interface Props {
  open: boolean
  onClose: () => void
  onConfirm: () => void
  title: string
  message: string
  confirmLabel?: string
  cancelLabel?: string
  variant?: 'danger' | 'default'
}

export function ConfirmDialog({
  open,
  onClose,
  onConfirm,
  title,
  message,
  confirmLabel = 'Confirmar',
  cancelLabel = 'Cancelar',
  variant = 'default',
}: Props) {
  const confirmClass = variant === 'danger'
    ? 'bg-red-600 text-white hover:bg-red-700 focus-visible:ring-red-500'
    : 'bg-blue-600 text-white hover:bg-blue-700 focus-visible:ring-blue-500'

  // Move focus to the cancel button on open (safer default than confirming destructive actions).
  const cancelRef = useRef<HTMLButtonElement>(null)
  useEffect(() => {
    if (open) {
      // Defer to allow Modal render.
      const t = setTimeout(() => cancelRef.current?.focus(), 0)
      return () => clearTimeout(t)
    }
  }, [open])

  return (
    <Modal open={open} onClose={onClose} title={title} size="sm">
      <p className="text-sm text-gray-600 mb-5" id="confirm-dialog-message">
        {message}
      </p>
      <div
        className="flex items-center justify-end gap-3"
        role="group"
        aria-describedby="confirm-dialog-message"
      >
        <button
          ref={cancelRef}
          type="button"
          onClick={onClose}
          className="px-4 py-2 text-sm font-medium text-gray-700 border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-1 focus-visible:ring-gray-400"
        >
          {cancelLabel}
        </button>
        <button
          type="button"
          onClick={() => { onConfirm(); onClose() }}
          className={`px-4 py-2 text-sm font-medium rounded-lg transition-colors focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-1 ${confirmClass}`}
          aria-label={variant === 'danger' ? `${confirmLabel} (ação destrutiva)` : confirmLabel}
        >
          {confirmLabel}
        </button>
      </div>
    </Modal>
  )
}
