'use client'

import { useEffect, useId, useRef, useCallback, type ReactNode } from 'react'
import { X } from 'lucide-react'
import { useFocusTrap } from '@/lib/hooks/useFocusTrap'

interface Props {
  open: boolean
  onClose: () => void
  title?: string
  /** Accessible description for the modal content. */
  description?: string
  children: ReactNode
  size?: 'sm' | 'md' | 'lg'
}

const sizeMap = {
  sm: 'max-w-sm',
  md: 'max-w-lg',
  lg: 'max-w-2xl',
} as const

export function Modal({ open, onClose, title, description, children, size = 'md' }: Props) {
  const dialogRef = useRef<HTMLDivElement>(null)
  const previousFocusRef = useRef<HTMLElement | null>(null)
  const titleId = useId()
  const descId = useId()
  useFocusTrap(dialogRef, open)

  const handleEscape = useCallback((e: KeyboardEvent) => {
    if (e.key === 'Escape') onClose()
  }, [onClose])

  // Capture previously focused element and restore on close OR unmount.
  useEffect(() => {
    if (open) {
      previousFocusRef.current = document.activeElement as HTMLElement | null
      // Cleanup runs when `open` flips to false OR when the component unmounts.
      return () => {
        if (previousFocusRef.current) {
          previousFocusRef.current.focus()
          previousFocusRef.current = null
        }
      }
    }
  }, [open])

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
    <div
      className="fixed inset-0 z-50 flex items-center justify-center p-4"
      role="dialog"
      aria-modal="true"
      aria-labelledby={title ? titleId : undefined}
      aria-describedby={description ? descId : undefined}
    >
      <div
        className="absolute inset-0 bg-black/50"
        onClick={onClose}
        aria-hidden="true"
      />
      <div
        ref={dialogRef}
        className={`relative bg-white rounded-xl shadow-xl w-full ${sizeMap[size]} max-h-[90vh] overflow-y-auto`}
      >
        {title && (
          <div className="flex items-center justify-between px-5 py-4 border-b border-gray-200">
            <h2 id={titleId} className="font-semibold text-gray-900">{title}</h2>
            <button
              type="button"
              onClick={onClose}
              aria-label="Fechar"
              className="text-gray-400 hover:text-gray-600 focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-1 focus-visible:ring-blue-500 rounded"
            >
              <X className="w-5 h-5" aria-hidden="true" />
            </button>
          </div>
        )}
        {description && (
          <p id={descId} className="sr-only">{description}</p>
        )}
        <div className="p-5">{children}</div>
      </div>
    </div>
  )
}
