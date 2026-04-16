'use client'

import { useRouter, usePathname, useSearchParams } from 'next/navigation'
import { useState, useEffect, useCallback, useRef, memo } from 'react'
import { Search, X, User, FileText } from 'lucide-react'
import { useDebounce } from '@/lib/hooks/useDebounce'

interface SearchBarProps {
  initialValue?: string
  placeholder?: string
  autoFocus?: boolean
}

interface Suggestion {
  type: 'politician' | 'statement'
  label: string
  href: string
}

interface SuggestionItemProps {
  suggestion: Suggestion
  index: number
  isActive: boolean
  onSelect: (href: string) => void
  onHover: (index: number) => void
}

const SuggestionItem = memo(function SuggestionItem({
  suggestion,
  index,
  isActive,
  onSelect,
  onHover,
}: SuggestionItemProps) {
  return (
    <li
      id={`suggestion-${index}`}
      role="option"
      aria-selected={isActive}
      className={`flex items-center gap-2 px-3 py-2 text-sm cursor-pointer ${
        isActive ? 'bg-blue-50 text-blue-900' : 'text-gray-700 hover:bg-gray-50'
      }`}
      onMouseDown={(e) => {
        e.preventDefault()
        onSelect(suggestion.href)
      }}
      onMouseEnter={() => onHover(index)}
    >
      {suggestion.type === 'politician' ? (
        <User className="w-3.5 h-3.5 text-gray-400 flex-shrink-0" />
      ) : (
        <FileText className="w-3.5 h-3.5 text-gray-400 flex-shrink-0" />
      )}
      <span className="truncate">{suggestion.label}</span>
    </li>
  )
})

export function SearchBar({ initialValue = '', placeholder = 'Buscar declarações...', autoFocus }: SearchBarProps) {
  const router = useRouter()
  const pathname = usePathname()
  const searchParams = useSearchParams()
  const [value, setValue] = useState(initialValue)
  const [suggestions, setSuggestions] = useState<Suggestion[]>([])
  const [showSuggestions, setShowSuggestions] = useState(false)
  const [activeIndex, setActiveIndex] = useState(-1)
  const debounced = useDebounce(value, 400)
  const suggestDebounced = useDebounce(value, 250)
  const inputRef = useRef<HTMLInputElement>(null)
  const wrapperRef = useRef<HTMLDivElement>(null)

  const onSelectSuggestion = useCallback((href: string) => {
    setShowSuggestions(false)
    router.push(href)
  }, [router])

  const onHoverSuggestion = useCallback((index: number) => {
    setActiveIndex(index)
  }, [])

  const navigate = useCallback(
    (q: string) => {
      const params = new URLSearchParams(searchParams.toString())
      if (q) {
        params.set('q', q)
      } else {
        params.delete('q')
      }
      params.delete('page')
      const target = pathname === '/' ? '/buscar' : pathname
      const qs = params.toString()
      router.push(qs ? `${target}?${qs}` : target)
    },
    [router, pathname, searchParams]
  )

  useEffect(() => {
    if (debounced !== initialValue) navigate(debounced)
  }, [debounced, navigate, initialValue])

  // Fetch suggestions
  useEffect(() => {
    if (suggestDebounced.length < 2) {
      setSuggestions([])
      return
    }
    let cancelled = false
    fetch(`/api/suggest?q=${encodeURIComponent(suggestDebounced)}`)
      .then((r) => r.json())
      .then((data: Suggestion[]) => {
        if (!cancelled) {
          setSuggestions(data)
          setActiveIndex(-1)
        }
      })
      .catch(() => {
        if (!cancelled) setSuggestions([])
      })
    return () => { cancelled = true }
  }, [suggestDebounced])

  // Close on outside click
  useEffect(() => {
    function handleClick(e: MouseEvent) {
      if (wrapperRef.current && !wrapperRef.current.contains(e.target as Node)) {
        setShowSuggestions(false)
      }
    }
    document.addEventListener('mousedown', handleClick)
    return () => document.removeEventListener('mousedown', handleClick)
  }, [])

  function handleKeyDown(e: React.KeyboardEvent) {
    if (showSuggestions && suggestions.length > 0) {
      if (e.key === 'ArrowDown') {
        e.preventDefault()
        setActiveIndex((i) => (i + 1) % suggestions.length)
        return
      }
      if (e.key === 'ArrowUp') {
        e.preventDefault()
        setActiveIndex((i) => (i <= 0 ? suggestions.length - 1 : i - 1))
        return
      }
      if (e.key === 'Enter' && activeIndex >= 0) {
        e.preventDefault()
        setShowSuggestions(false)
        router.push(suggestions[activeIndex].href)
        return
      }
    }
    if (e.key === 'Enter') {
      e.preventDefault()
      setShowSuggestions(false)
      navigate(value)
    }
    if (e.key === 'Escape') {
      setShowSuggestions(false)
      inputRef.current?.blur()
    }
  }

  const hasSuggestions = showSuggestions && suggestions.length > 0

  return (
    <div className="relative flex-1" ref={wrapperRef}>
      <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400 pointer-events-none" aria-hidden="true" />
      <input
        ref={inputRef}
        type="search"
        name="q"
        value={value}
        onChange={(e) => { setValue(e.target.value); setShowSuggestions(true) }}
        onFocus={() => setShowSuggestions(true)}
        onKeyDown={handleKeyDown}
        placeholder={placeholder}
        autoFocus={autoFocus}
        autoComplete="off"
        autoCapitalize="none"
        enterKeyHint="search"
        inputMode="search"
        spellCheck={false}
        role="combobox"
        aria-expanded={hasSuggestions}
        aria-controls="search-suggestions"
        aria-activedescendant={activeIndex >= 0 ? `suggestion-${activeIndex}` : undefined}
        aria-label="Buscar declarações"
        data-testid="search-input"
        className="w-full pl-9 pr-9 py-2.5 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
      />
      {value ? (
        <button
          onClick={() => { setValue(''); navigate(''); setSuggestions([]) }}
          className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600"
          aria-label="Limpar busca"
        >
          <X className="w-4 h-4" />
        </button>
      ) : (
        <kbd className="absolute right-3 top-1/2 -translate-y-1/2 hidden sm:inline-block text-xs text-gray-400 bg-gray-100 px-1.5 py-0.5 rounded border border-gray-200 font-mono pointer-events-none">
          /
        </kbd>
      )}

      {/* Suggestions dropdown */}
      {hasSuggestions && (
        <ul
          id="search-suggestions"
          role="listbox"
          className="absolute top-full left-0 right-0 mt-1 bg-white border border-gray-200 rounded-lg shadow-lg z-50 overflow-hidden"
        >
          {suggestions.map((s, i) => (
            <SuggestionItem
              key={`${s.type}-${s.href}`}
              suggestion={s}
              index={i}
              isActive={i === activeIndex}
              onSelect={onSelectSuggestion}
              onHover={onHoverSuggestion}
            />
          ))}
        </ul>
      )}
    </div>
  )
}
