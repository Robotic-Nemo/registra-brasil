'use client'

import { Bookmark } from 'lucide-react'
import { useBookmarks } from '@/lib/hooks/useBookmarks'

interface BookmarkButtonProps {
  id: string
  type: 'statement' | 'politician'
  title: string
  slug: string
  /** Minimal icon-only variant for card headers. */
  compact?: boolean
  className?: string
}

export function BookmarkButton({ id, type, title, slug, compact = false, className = '' }: BookmarkButtonProps) {
  const { isBookmarked, toggleBookmark } = useBookmarks()
  const bookmarked = isBookmarked(id, type)

  if (compact) {
    return (
      <button
        type="button"
        onClick={(e) => { e.preventDefault(); e.stopPropagation(); toggleBookmark({ id, type, title, slug }) }}
        className={`inline-flex items-center justify-center p-1.5 rounded-md transition-all ${
          bookmarked ? 'text-yellow-600 hover:bg-yellow-50' : 'text-gray-400 hover:text-yellow-600 hover:bg-gray-50'
        } ${className}`}
        aria-pressed={bookmarked}
        aria-label={bookmarked ? `Remover ${title} dos favoritos` : `Salvar ${title} nos favoritos`}
        title={bookmarked ? 'Remover dos favoritos' : 'Salvar nos favoritos'}
      >
        <Bookmark className={`h-4 w-4 ${bookmarked ? 'fill-current' : ''}`} aria-hidden="true" />
      </button>
    )
  }

  return (
    <button
      type="button"
      onClick={() => toggleBookmark({ id, type, title, slug })}
      className={`inline-flex items-center gap-1.5 px-3 py-1.5 text-sm rounded-lg border transition-all focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500 ${
        bookmarked
          ? 'bg-yellow-50 border-yellow-300 text-yellow-700'
          : 'bg-white border-gray-200 text-gray-600 hover:border-gray-300'
      } ${className}`}
      aria-pressed={bookmarked}
      aria-label={bookmarked ? `Remover ${title} dos favoritos` : `Adicionar ${title} aos favoritos`}
    >
      <Bookmark className={`h-4 w-4 ${bookmarked ? 'fill-current' : ''}`} aria-hidden="true" />
      <span>{bookmarked ? 'Salvo' : 'Salvar'}</span>
    </button>
  )
}
