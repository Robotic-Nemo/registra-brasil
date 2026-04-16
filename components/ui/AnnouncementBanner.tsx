'use client'

import { useState } from 'react'
import { X, Info } from 'lucide-react'

interface Props {
  id: string
  message: string
  href?: string
  variant?: 'info' | 'warning'
}

const variants = {
  info: 'bg-blue-600 text-white',
  warning: 'bg-amber-500 text-amber-950',
} as const

/**
 * A dismissible site-wide announcement banner.
 * Uses localStorage to remember dismissal by id.
 */
export function AnnouncementBanner({ id, message, href, variant = 'info' }: Props) {
  const [dismissed, setDismissed] = useState(() => {
    if (typeof window === 'undefined') return false
    return localStorage.getItem(`banner-${id}`) === 'dismissed'
  })

  if (dismissed) return null

  function dismiss() {
    localStorage.setItem(`banner-${id}`, 'dismissed')
    setDismissed(true)
  }

  const content = href ? (
    <a href={href} className="underline underline-offset-2 hover:opacity-80">{message}</a>
  ) : (
    <span>{message}</span>
  )

  return (
    <div className={`${variants[variant]} text-sm py-2 px-4`} role="status">
      <div className="max-w-7xl mx-auto flex items-center justify-between gap-4">
        <div className="flex items-center gap-2">
          <Info className="w-4 h-4 flex-shrink-0" />
          {content}
        </div>
        <button onClick={dismiss} aria-label="Fechar aviso" className="hover:opacity-70">
          <X className="w-4 h-4" />
        </button>
      </div>
    </div>
  )
}
