'use client'

import { useRef, useEffect } from 'react'

/**
 * Hook to track previous value of a state variable
 */
export function usePrevious<T>(value: T): T | undefined {
  const ref = useRef<T | undefined>(undefined)

  useEffect(() => {
    ref.current = value
  }, [value])

  return ref.current
}
