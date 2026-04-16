'use client'

import { useState, useCallback } from 'react'

/**
 * Hook for toggling a boolean state
 */
export function useToggle(initialValue = false): [boolean, () => void, (value: boolean) => void] {
  const [value, setValue] = useState(initialValue)

  const toggle = useCallback(() => setValue(v => !v), [])
  const set = useCallback((v: boolean) => setValue(v), [])

  return [value, toggle, set]
}
