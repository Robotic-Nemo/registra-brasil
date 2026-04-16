'use client'

import { useState, useCallback, useEffect } from 'react'

const STORAGE_KEY = 'registra-brasil:search-history'
const MAX_ITEMS = 10

function readFromStorage(): string[] {
  if (typeof window === 'undefined') return []
  try {
    const raw = localStorage.getItem(STORAGE_KEY)
    if (!raw) return []
    const parsed = JSON.parse(raw)
    return Array.isArray(parsed) ? parsed.filter((s): s is string => typeof s === 'string').slice(0, MAX_ITEMS) : []
  } catch {
    return []
  }
}

function writeToStorage(items: string[]) {
  try {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(items.slice(0, MAX_ITEMS)))
  } catch {
    // Storage full or unavailable — ignore
  }
}

/**
 * Hook to manage search history in localStorage.
 * Stores up to 10 recent search queries, most recent first.
 */
export function useSearchHistory() {
  const [history, setHistory] = useState<string[]>([])

  // Hydrate from localStorage on mount
  useEffect(() => {
    setHistory(readFromStorage())
  }, [])

  const addSearch = useCallback((query: string) => {
    const trimmed = query.trim()
    if (!trimmed) return
    setHistory((prev) => {
      const filtered = prev.filter((item) => item.toLowerCase() !== trimmed.toLowerCase())
      const next = [trimmed, ...filtered].slice(0, MAX_ITEMS)
      writeToStorage(next)
      return next
    })
  }, [])

  const removeSearch = useCallback((query: string) => {
    setHistory((prev) => {
      const next = prev.filter((item) => item !== query)
      writeToStorage(next)
      return next
    })
  }, [])

  const clearHistory = useCallback(() => {
    setHistory([])
    try {
      localStorage.removeItem(STORAGE_KEY)
    } catch {
      // ignore
    }
  }, [])

  return { history, addSearch, removeSearch, clearHistory } as const
}
