'use client'

import { useCallback, useRef } from 'react'
import { preloadRoute } from '@/lib/utils/preload-data'

/**
 * Returns an onMouseEnter handler that prefetches a route.
 * Debounces to avoid excessive prefetching on rapid hover.
 */
export function usePrefetchOnHover(path: string) {
  const prefetched = useRef(false)

  const onMouseEnter = useCallback(() => {
    if (prefetched.current) return
    prefetched.current = true
    preloadRoute(path)
  }, [path])

  return { onMouseEnter }
}
