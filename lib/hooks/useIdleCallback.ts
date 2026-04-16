'use client'

import { useEffect, useRef, useCallback } from 'react'

/**
 * Hook to schedule work during idle periods using requestIdleCallback
 * Falls back to setTimeout on unsupported browsers
 */
export function useIdleCallback(
  callback: () => void,
  options: { timeout?: number; enabled?: boolean } = {}
) {
  const { timeout = 2000, enabled = true } = options
  const callbackRef = useRef(callback)
  callbackRef.current = callback

  const schedule = useCallback(() => {
    if (typeof requestIdleCallback !== 'undefined') {
      const id = requestIdleCallback(() => callbackRef.current(), { timeout })
      return () => cancelIdleCallback(id)
    }
    // Fallback
    const id = setTimeout(() => callbackRef.current(), 100)
    return () => clearTimeout(id)
  }, [timeout])

  useEffect(() => {
    if (!enabled) return
    const cancel = schedule()
    return cancel
  }, [enabled, schedule])
}
