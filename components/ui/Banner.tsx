'use client'

import { useState } from 'react'
import { X, Info, AlertTriangle, Megaphone } from 'lucide-react'
import type { ReactNode } from 'react'

type BannerVariant = 'info' | 'warning' | 'announcement'

interface BannerProps {
  children: ReactNode
  variant?: BannerVariant
  dismissible?: boolean
  storageKey?: string
}

const VARIANT_CONFIG = {
  info: {
    bg: 'bg-blue-50 border-blue-200 text-blue-800',
    Icon: Info,
  },
  warning: {
    bg: 'bg-amber-50 border-amber-200 text-amber-800',
    Icon: AlertTriangle,
  },
  announcement: {
    bg: 'bg-indigo-50 border-indigo-200 text-indigo-800',
    Icon: Megaphone,
  },
} as const

export function Banner({ children, variant = 'info', dismissible = true, storageKey }: BannerProps) {
  const [dismissed, setDismissed] = useState(() => {
    if (!storageKey || typeof window === 'undefined') return false
    try {
      return localStorage.getItem(`banner:${storageKey}`) === '1'
    } catch {
      return false
    }
  })

  if (dismissed) return null

  const { bg, Icon } = VARIANT_CONFIG[variant]

  function handleDismiss() {
    setDismissed(true)
    if (storageKey) {
      try {
        localStorage.setItem(`banner:${storageKey}`, '1')
      } catch {
        // ignore
      }
    }
  }

  return (
    <div
      role="banner"
      className={`w-full border-b px-4 py-2.5 flex items-center gap-3 text-sm ${bg}`}
    >
      <Icon className="w-4 h-4 flex-shrink-0" />
      <span className="flex-1">{children}</span>
      {dismissible && (
        <button
          type="button"
          onClick={handleDismiss}
          aria-label="Fechar banner"
          className="flex-shrink-0 opacity-60 hover:opacity-100"
        >
          <X className="w-4 h-4" />
        </button>
      )}
    </div>
  )
}
