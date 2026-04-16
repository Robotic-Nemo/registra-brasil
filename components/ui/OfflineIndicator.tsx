'use client'

import { useIsOnline } from '@/lib/hooks/useIsOnline'

export function OfflineIndicator() {
  const isOnline = useIsOnline()

  if (isOnline) return null

  return (
    <div
      className="fixed bottom-4 left-1/2 -translate-x-1/2 z-50 bg-amber-600 text-white px-4 py-2 rounded-full shadow-lg text-sm font-medium flex items-center gap-2"
      role="alert"
      aria-live="polite"
    >
      <span className="w-2 h-2 rounded-full bg-amber-300 animate-pulse" />
      Sem conexão com a internet
    </div>
  )
}
