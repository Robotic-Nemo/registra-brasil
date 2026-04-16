'use client'

import { useState, useEffect } from 'react'

export function useLocalStorage<T>(key: string, defaultValue: T): [T, (v: T) => void] {
  // Initialize with defaultValue to avoid hydration mismatch
  const [value, setValue] = useState<T>(defaultValue)

  // After mount, read from localStorage
  useEffect(() => {
    try {
      const stored = window.localStorage.getItem(key)
      if (stored !== null) {
        setValue(JSON.parse(stored) as T)
      }
    } catch {
      // Ignore parse errors or unavailable storage
    }
  }, [key])

  const setStoredValue = (v: T) => {
    try {
      window.localStorage.setItem(key, JSON.stringify(v))
    } catch {
      // Ignore write errors (e.g. private browsing quota)
    }
    setValue(v)
  }

  return [value, setStoredValue]
}
