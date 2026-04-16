'use client'

import { useEffect, useCallback, type ReactNode } from 'react'
import { X } from 'lucide-react'

type DrawerSide = 'left' | 'right'

interface DrawerProps {
  open: boolean
  onClose: () => void
  children: ReactNode
  title?: string
  side?: DrawerSide
  className?: string
}

const slideClasses: Record<DrawerSide, string> = {
  left: 'left-0 top-0 bottom-0',
  right: 'right-0 top-0 bottom-0',
}

export function Drawer({
  open,
  onClose,
  children,
  title,
  side = 'right',
  className = '',
}: DrawerProps) {
  const handleEscape = useCallback(
    (e: KeyboardEvent) => {
      if (e.key === 'Escape') onClose()
    },
    [onClose]
  )

  useEffect(() => {
    if (!open) return
    document.addEventListener('keydown', handleEscape)
    document.body.style.overflow = 'hidden'
    return () => {
      document.removeEventListener('keydown', handleEscape)
      document.body.style.overflow = ''
    }
  }, [open, handleEscape])

  if (!open) return null

  return (
    <div className="fixed inset-0 z-50" role="dialog" aria-modal="true" aria-label={title ?? 'Painel'}>
      {/* Backdrop */}
      <div className="absolute inset-0 bg-black/40" onClick={onClose} aria-hidden="true" />

      {/* Panel */}
      <div
        className={`absolute ${slideClasses[side]} w-80 max-w-[85vw] bg-white shadow-xl flex flex-col ${className}`}
      >
        {/* Header */}
        <div className="flex items-center justify-between px-4 py-3 border-b border-gray-200">
          {title && <h2 className="font-semibold text-gray-900 text-sm">{title}</h2>}
          <button
            onClick={onClose}
            aria-label="Fechar painel"
            className="ml-auto p-1 rounded-md text-gray-400 hover:text-gray-600 hover:bg-gray-100 transition-colors"
          >
            <X className="w-5 h-5" />
          </button>
        </div>

        {/* Content */}
        <div className="flex-1 overflow-y-auto p-4">{children}</div>
      </div>
    </div>
  )
}
