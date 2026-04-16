'use client'

import { Bookmark } from 'lucide-react'
import { useBookmarks } from '@/lib/hooks/useBookmarks'

interface BookmarkButtonProps {
  id: string
  type: 'statement' | 'politician'
  title: string
  slug: string
  className?: string
}

export function BookmarkButton({ id, type, title, slug, className = '' }: BookmarkButtonProps) {
  const { isBookmarked, toggleBookmark } = useBookmarks()
  const bookmarked = isBookmarked(id, type)

  return (
    <button
      onClick={() => toggleBookmark({ id, type, title, slug })}
      className={`inline-flex items-center gap-1.5 px-3 py-1.5 text-sm rounded-lg border transition-all ${
        bookmarked
          ? 'bg-yellow-50 border-yellow-300 text-yellow-700 dark:bg-yellow-900/20 dark:border-yellow-700 dark:text-yellow-400'
          : 'bg-white border-gray-200 text-gray-600 hover:border-gray-300 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:border-gray-600'
      } ${className}`}
      aria-pressed={bookmarked}
      aria-label={bookmarked ? `Remover ${title} dos favoritos` : `Adicionar ${title} aos favoritos`}
    >
      <Bookmark
        className={`h-4 w-4 ${bookmarked ? 'fill-current' : ''}`}
        aria-hidden="true"
      />
      <span>{bookmarked ? 'Salvo' : 'Salvar'}</span>
    </button>
  )
}
