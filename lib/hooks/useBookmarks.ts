'use client'

import { useCallback } from 'react'
import { useLocalStorage } from './useLocalStorage'

export interface BookmarkItem {
  id: string
  type: 'statement' | 'politician'
  title: string
  slug: string
  addedAt: string
}

const STORAGE_KEY = 'registra-brasil:bookmarks'

export function useBookmarks() {
  const [bookmarks, setBookmarks] = useLocalStorage<BookmarkItem[]>(STORAGE_KEY, [])

  const addBookmark = useCallback(
    (item: Omit<BookmarkItem, 'addedAt'>) => {
      if (bookmarks.some((b) => b.id === item.id && b.type === item.type)) return
      setBookmarks([{ ...item, addedAt: new Date().toISOString() }, ...bookmarks])
    },
    [bookmarks, setBookmarks]
  )

  const removeBookmark = useCallback(
    (id: string, type: 'statement' | 'politician') => {
      setBookmarks(bookmarks.filter((b) => !(b.id === id && b.type === type)))
    },
    [bookmarks, setBookmarks]
  )

  const isBookmarked = useCallback(
    (id: string, type: 'statement' | 'politician') => {
      return bookmarks.some((b) => b.id === id && b.type === type)
    },
    [bookmarks]
  )

  const toggleBookmark = useCallback(
    (item: Omit<BookmarkItem, 'addedAt'>) => {
      if (isBookmarked(item.id, item.type)) {
        removeBookmark(item.id, item.type)
      } else {
        addBookmark(item)
      }
    },
    [isBookmarked, removeBookmark, addBookmark]
  )

  const clearAll = useCallback(() => {
    setBookmarks([])
  }, [setBookmarks])

  return { bookmarks, addBookmark, removeBookmark, isBookmarked, toggleBookmark, clearAll }
}
