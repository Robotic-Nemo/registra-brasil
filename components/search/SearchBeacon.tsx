'use client'

import { useEffect } from 'react'

interface Props {
  q: string
  results: number
}

/**
 * Fires a fire-and-forget beacon to /api/search-beacon after hydration
 * recording the *submitted* query + result count. No-op for empty
 * queries. Uses sendBeacon when available (survives navigation).
 */
export function SearchBeacon({ q, results }: Props) {
  useEffect(() => {
    const trimmed = q.trim()
    if (trimmed.length < 2) return

    const payload = JSON.stringify({ q: trimmed, results })
    try {
      if (typeof navigator !== 'undefined' && typeof navigator.sendBeacon === 'function') {
        const blob = new Blob([payload], { type: 'application/json' })
        navigator.sendBeacon('/api/search-beacon', blob)
        return
      }
    } catch { /* fall through */ }

    // Fallback: plain fetch, fire-and-forget.
    fetch('/api/search-beacon', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: payload,
      keepalive: true,
    }).catch(() => {})
  }, [q, results])

  return null
}
