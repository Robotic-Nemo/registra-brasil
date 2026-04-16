'use client'

import { useRef, useEffect } from 'react'
import { Clock, TrendingUp, Search } from 'lucide-react'

interface SearchSuggestionsProps {
  recentSearches: string[]
  popularSearches?: string[]
  onSelect: (query: string) => void
  onClearRecent?: () => void
  visible: boolean
}

export function SearchSuggestions({
  recentSearches,
  popularSearches = [],
  onSelect,
  onClearRecent,
  visible,
}: SearchSuggestionsProps) {
  const ref = useRef<HTMLDivElement>(null)

  useEffect(() => {
    if (!visible) return
    function handleKey(e: KeyboardEvent) {
      if (e.key === 'Escape') {
        ;(document.activeElement as HTMLElement)?.blur()
      }
    }
    document.addEventListener('keydown', handleKey)
    return () => document.removeEventListener('keydown', handleKey)
  }, [visible])

  if (!visible || (recentSearches.length === 0 && popularSearches.length === 0)) {
    return null
  }

  return (
    <div
      ref={ref}
      role="listbox"
      aria-label="Sugestões de busca"
      className="absolute top-full left-0 right-0 mt-1 bg-white border border-gray-200 rounded-lg shadow-lg z-40 overflow-hidden"
    >
      {recentSearches.length > 0 && (
        <div className="p-2">
          <div className="flex items-center justify-between px-2 mb-1">
            <span className="text-xs font-semibold text-gray-500 uppercase tracking-wider flex items-center gap-1.5">
              <Clock className="w-3 h-3" />
              Buscas recentes
            </span>
            {onClearRecent && (
              <button
                type="button"
                onClick={onClearRecent}
                className="text-xs text-gray-400 hover:text-gray-600"
              >
                Limpar
              </button>
            )}
          </div>
          {recentSearches.map((q) => (
            <button
              key={q}
              type="button"
              role="option"
              onClick={() => onSelect(q)}
              className="flex items-center gap-2 w-full px-2 py-1.5 text-sm text-gray-700 rounded hover:bg-gray-50 text-left"
            >
              <Search className="w-3.5 h-3.5 text-gray-400 flex-shrink-0" />
              {q}
            </button>
          ))}
        </div>
      )}

      {popularSearches.length > 0 && (
        <div className="p-2 border-t border-gray-100">
          <span className="text-xs font-semibold text-gray-500 uppercase tracking-wider px-2 mb-1 flex items-center gap-1.5">
            <TrendingUp className="w-3 h-3" />
            Populares
          </span>
          {popularSearches.map((q) => (
            <button
              key={q}
              type="button"
              role="option"
              onClick={() => onSelect(q)}
              className="flex items-center gap-2 w-full px-2 py-1.5 text-sm text-gray-700 rounded hover:bg-gray-50 text-left"
            >
              <TrendingUp className="w-3.5 h-3.5 text-gray-400 flex-shrink-0" />
              {q}
            </button>
          ))}
        </div>
      )}
    </div>
  )
}
