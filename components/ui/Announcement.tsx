'use client'

import { useState } from 'react'
import { X, Megaphone } from 'lucide-react'

interface AnnouncementProps {
  message: string
  /** Optional link */
  href?: string
  linkText?: string
  /** Storage key for dismissal persistence */
  storageKey?: string
  variant?: 'info' | 'warning' | 'success'
}

const variants = {
  info: 'bg-blue-600 text-white',
  warning: 'bg-yellow-500 text-yellow-900',
  success: 'bg-green-600 text-white',
}

export function Announcement({
  message,
  href,
  linkText = 'Saiba mais',
  storageKey,
  variant = 'info',
}: AnnouncementProps) {
  const [dismissed, setDismissed] = useState(() => {
    if (!storageKey || typeof window === 'undefined') return false
    try {
      return localStorage.getItem(`announcement:${storageKey}`) === 'dismissed'
    } catch {
      return false
    }
  })

  if (dismissed) return null

  function handleDismiss() {
    setDismissed(true)
    if (storageKey) {
      try {
        localStorage.setItem(`announcement:${storageKey}`, 'dismissed')
      } catch {
        // Storage unavailable
      }
    }
  }

  return (
    <div className={`relative px-4 py-2.5 text-sm text-center ${variants[variant]}`} role="alert">
      <div className="flex items-center justify-center gap-2">
        <Megaphone className="h-4 w-4 shrink-0" aria-hidden="true" />
        <span>{message}</span>
        {href && (
          <a
            href={href}
            className="underline font-medium hover:no-underline ml-1"
          >
            {linkText}
          </a>
        )}
      </div>
      <button
        onClick={handleDismiss}
        className="absolute right-2 top-1/2 -translate-y-1/2 p-1 opacity-70 hover:opacity-100 transition-opacity"
        aria-label="Fechar anuncio"
      >
        <X className="h-4 w-4" />
      </button>
    </div>
  )
}
