'use client'

import { useState, useEffect, useCallback } from 'react'
import SubscribeForm from './SubscribeForm'

interface SubscribePopupProps {
  /** Delay in milliseconds before showing the popup. Default: 15000 (15s). */
  delayMs?: number
  /** Storage key to track dismissal. */
  storageKey?: string
}

/**
 * Delayed popup with newsletter subscribe form.
 * Respects dismissal via localStorage.
 */
export default function SubscribePopup({ delayMs = 15_000, storageKey = 'rb-newsletter-dismissed' }: SubscribePopupProps) {
  const [visible, setVisible] = useState(false)

  useEffect(() => {
    if (typeof window === 'undefined') return

    const dismissed = localStorage.getItem(storageKey)
    if (dismissed) return

    const timer = setTimeout(() => setVisible(true), delayMs)
    return () => clearTimeout(timer)
  }, [delayMs, storageKey])

  const dismiss = useCallback(() => {
    setVisible(false)
    try {
      localStorage.setItem(storageKey, '1')
    } catch {
      // localStorage may be unavailable
    }
  }, [storageKey])

  if (!visible) return null

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 p-4">
      <div className="relative w-full max-w-md rounded-xl bg-white p-6 shadow-xl">
        <button
          onClick={dismiss}
          aria-label="Fechar"
          className="absolute right-3 top-3 text-gray-400 hover:text-gray-600"
        >
          <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
            <path
              fillRule="evenodd"
              d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
              clipRule="evenodd"
            />
          </svg>
        </button>

        <SubscribeForm onSuccess={dismiss} />
      </div>
    </div>
  )
}
