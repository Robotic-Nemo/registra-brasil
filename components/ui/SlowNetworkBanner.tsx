'use client'

import { Wifi, WifiOff } from 'lucide-react'
import { useNetworkStatus } from '@/lib/hooks/useNetworkStatus'

export function SlowNetworkBanner() {
  const { online, slow } = useNetworkStatus()

  if (online && !slow) return null

  return (
    <div
      className={`fixed bottom-0 left-0 right-0 z-50 px-4 py-2 text-center text-sm font-medium ${
        !online
          ? 'bg-red-600 text-white'
          : 'bg-yellow-500 text-yellow-900'
      }`}
      role="alert"
      aria-live="polite"
    >
      {!online ? (
        <span className="inline-flex items-center gap-2">
          <WifiOff className="h-4 w-4" aria-hidden="true" />
          Voce esta offline. Algumas funcionalidades podem nao estar disponiveis.
        </span>
      ) : (
        <span className="inline-flex items-center gap-2">
          <Wifi className="h-4 w-4" aria-hidden="true" />
          Conexao lenta detectada. O conteudo pode demorar para carregar.
        </span>
      )}
    </div>
  )
}
