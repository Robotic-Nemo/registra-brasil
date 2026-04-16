'use client'

import { useEffect, useRef } from 'react'

/**
 * Hook for declarative setInterval
 */
export function useInterval(callback: () => void, delay: number | null): void {
  const callbackRef = useRef(callback)
  callbackRef.current = callback

  useEffect(() => {
    if (delay === null) return
    if (!Number.isFinite(delay) || delay <= 0) return

    const id = setInterval(() => callbackRef.current(), delay)
    return () => clearInterval(id)
  }, [delay])
}
