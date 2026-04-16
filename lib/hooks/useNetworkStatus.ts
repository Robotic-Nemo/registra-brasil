'use client'

import { useState, useEffect } from 'react'

interface NetworkStatus {
  online: boolean
  slow: boolean
  effectiveType: string | null
  downlink: number | null
}

interface NetworkInformation {
  effectiveType?: string
  downlink?: number
  addEventListener?: (type: string, listener: () => void) => void
  removeEventListener?: (type: string, listener: () => void) => void
}

/**
 * Detects network status including slow connections.
 */
export function useNetworkStatus(): NetworkStatus {
  const [status, setStatus] = useState<NetworkStatus>({
    online: true,
    slow: false,
    effectiveType: null,
    downlink: null,
  })

  useEffect(() => {
    function update() {
      const conn = (navigator as unknown as { connection?: NetworkInformation }).connection
      const online = navigator.onLine
      const effectiveType = conn?.effectiveType ?? null
      const downlink = conn?.downlink ?? null
      const slow = effectiveType === '2g' || effectiveType === 'slow-2g' || (downlink !== null && downlink < 0.5)

      setStatus({ online, slow, effectiveType, downlink })
    }

    update()

    window.addEventListener('online', update)
    window.addEventListener('offline', update)

    const conn = (navigator as unknown as { connection?: NetworkInformation }).connection
    conn?.addEventListener?.('change', update)

    return () => {
      window.removeEventListener('online', update)
      window.removeEventListener('offline', update)
      conn?.removeEventListener?.('change', update)
    }
  }, [])

  return status
}
