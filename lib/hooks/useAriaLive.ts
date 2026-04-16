'use client'

import { useState, useCallback } from 'react'

/**
 * Manages aria-live announcements.
 * Returns [message, announce] — render message in an aria-live region.
 */
export function useAriaLive(): [string, (msg: string) => void] {
  const [message, setMessage] = useState('')

  const announce = useCallback((msg: string) => {
    // Clear first to ensure re-announcement of same message
    setMessage('')
    requestAnimationFrame(() => setMessage(msg))
  }, [])

  return [message, announce]
}
