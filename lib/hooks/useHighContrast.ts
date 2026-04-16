'use client'

import { useCallback, useEffect } from 'react'
import { useLocalStorage } from './useLocalStorage'

const STORAGE_KEY = 'registra-brasil:high-contrast'

export function useHighContrast() {
  const [enabled, setEnabled] = useLocalStorage<boolean>(STORAGE_KEY, false)

  useEffect(() => {
    if (enabled) {
      document.documentElement.classList.add('high-contrast')
    } else {
      document.documentElement.classList.remove('high-contrast')
    }
  }, [enabled])

  const toggle = useCallback(() => {
    setEnabled(!enabled)
  }, [enabled, setEnabled])

  return { enabled, toggle, setEnabled }
}
