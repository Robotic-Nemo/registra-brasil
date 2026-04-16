'use client'

import { useCallback } from 'react'
import { useLocalStorage } from './useLocalStorage'

export interface RecentlyViewedItem {
  id: string
  type: 'statement' | 'politician'
  title: string
  slug: string
  viewedAt: string
}

const MAX_ITEMS = 20
const STORAGE_KEY = 'registra-brasil:recently-viewed'

export function useRecentlyViewed() {
  const [items, setItems] = useLocalStorage<RecentlyViewedItem[]>(STORAGE_KEY, [])

  const addItem = useCallback(
    (item: Omit<RecentlyViewedItem, 'viewedAt'>) => {
      const filtered = items.filter((i) => !(i.id === item.id && i.type === item.type))
      setItems([{ ...item, viewedAt: new Date().toISOString() }, ...filtered].slice(0, MAX_ITEMS))
    },
    [items, setItems]
  )

  const removeItem = useCallback(
    (id: string, type: 'statement' | 'politician') => {
      setItems(items.filter((i) => !(i.id === id && i.type === type)))
    },
    [items, setItems]
  )

  const clearAll = useCallback(() => {
    setItems([])
  }, [setItems])

  return { items, addItem, removeItem, clearAll }
}
