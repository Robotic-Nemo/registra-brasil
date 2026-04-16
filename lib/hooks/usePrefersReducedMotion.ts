'use client'

import { useState, useEffect } from 'react'

/**
 * Returns true if the user prefers reduced motion (OS accessibility setting).
 */
export function usePrefersReducedMotion(): boolean {
  const [prefersReduced, setPrefersReduced] = useState(false)

  useEffect(() => {
    const mql = window.matchMedia('(prefers-reduced-motion: reduce)')
    setPrefersReduced(mql.matches)

    function onChange(e: MediaQueryListEvent) {
      setPrefersReduced(e.matches)
    }
    mql.addEventListener('change', onChange)
    return () => mql.removeEventListener('change', onChange)
  }, [])

  return prefersReduced
}
