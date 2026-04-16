'use client'

import { useState, useRef } from 'react'

interface TagInputProps {
  value: string[]
  onChange: (tags: string[]) => void
  placeholder?: string
  maxTags?: number
  suggestions?: string[]
  className?: string
}

export function TagInput({
  value,
  onChange,
  placeholder = 'Adicionar tag...',
  maxTags = 10,
  suggestions = [],
  className = '',
}: TagInputProps) {
  const [input, setInput] = useState('')
  const [showSuggestions, setShowSuggestions] = useState(false)
  const inputRef = useRef<HTMLInputElement>(null)

  const addTag = (tag: string) => {
    const trimmed = tag.trim().toLowerCase()
    if (trimmed && !value.includes(trimmed) && value.length < maxTags) {
      onChange([...value, trimmed])
      setInput('')
    }
  }

  const removeTag = (tag: string) => {
    onChange(value.filter(t => t !== tag))
  }

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if ((e.key === 'Enter' || e.key === ',') && input.trim()) {
      e.preventDefault()
      addTag(input)
    } else if (e.key === 'Backspace' && !input && value.length > 0) {
      removeTag(value[value.length - 1])
    }
  }

  const filteredSuggestions = suggestions.filter(
    s => s.toLowerCase().includes(input.toLowerCase()) && !value.includes(s.toLowerCase())
  )

  return (
    <div className={className}>
      <div
        className="flex flex-wrap items-center gap-1.5 p-2 border border-zinc-300 rounded-lg focus-within:ring-2 focus-within:ring-blue-500 focus-within:border-blue-500"
        onClick={() => inputRef.current?.focus()}
      >
        {value.map(tag => (
          <span
            key={tag}
            className="inline-flex items-center gap-1 px-2 py-0.5 bg-blue-100 text-blue-700 text-xs font-medium rounded-full"
          >
            {tag}
            <button
              type="button"
              onClick={(e) => { e.stopPropagation(); removeTag(tag) }}
              className="text-blue-400 hover:text-blue-600 font-bold"
              aria-label={`Remover tag ${tag}`}
            >
              ×
            </button>
          </span>
        ))}
        <input
          ref={inputRef}
          type="text"
          value={input}
          onChange={(e) => { setInput(e.target.value); setShowSuggestions(true) }}
          onKeyDown={handleKeyDown}
          onBlur={() => setTimeout(() => setShowSuggestions(false), 200)}
          placeholder={value.length === 0 ? placeholder : ''}
          className="flex-1 min-w-[100px] text-sm outline-none bg-transparent"
          disabled={value.length >= maxTags}
          aria-label="Adicionar tag"
        />
      </div>

      {showSuggestions && input && filteredSuggestions.length > 0 && (
        <div className="mt-1 border border-zinc-200 rounded-lg bg-white shadow-sm max-h-32 overflow-y-auto">
          {filteredSuggestions.slice(0, 5).map(suggestion => (
            <button
              key={suggestion}
              type="button"
              className="w-full text-left px-3 py-1.5 text-sm hover:bg-zinc-50"
              onMouseDown={(e) => { e.preventDefault(); addTag(suggestion) }}
            >
              {suggestion}
            </button>
          ))}
        </div>
      )}

      {value.length >= maxTags && (
        <p className="text-xs text-zinc-400 mt-1">Máximo de {maxTags} tags atingido</p>
      )}
    </div>
  )
}
