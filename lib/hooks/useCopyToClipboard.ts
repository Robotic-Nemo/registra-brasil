'use client'

import { useState, useCallback, useRef, useEffect } from 'react'
import { copyToClipboard } from '@/lib/utils/clipboard'

/**
 * Hook for copying text to clipboard with a temporary "copied" state.
 */
export function useCopyToClipboard(resetDelay = 2000) {
  const [copied, setCopied] = useState(false)
  const timerRef = useRef<ReturnType<typeof setTimeout> | null>(null)

  // Clean up timer on unmount
  useEffect(() => {
    return () => {
      if (timerRef.current) clearTimeout(timerRef.current)
    }
  }, [])

  const copy = useCallback(async (text: string) => {
    const success = await copyToClipboard(text)
    if (success) {
      setCopied(true)
      if (timerRef.current) clearTimeout(timerRef.current)
      timerRef.current = setTimeout(() => setCopied(false), resetDelay)
    }
    return success
  }, [resetDelay])

  return { copied, copy }
}
