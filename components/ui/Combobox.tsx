'use client'

import { useState, useRef, useEffect } from 'react'

interface ComboboxOption {
  value: string
  label: string
  description?: string
}

interface ComboboxProps {
  options: ComboboxOption[]
  value: string
  onChange: (value: string) => void
  placeholder?: string
  label?: string
  className?: string
}

export function Combobox({
  options,
  value,
  onChange,
  placeholder = 'Selecionar...',
  label,
  className = '',
}: ComboboxProps) {
  const [query, setQuery] = useState('')
  const [isOpen, setIsOpen] = useState(false)
  const [activeIndex, setActiveIndex] = useState(-1)
  const inputRef = useRef<HTMLInputElement>(null)
  const listRef = useRef<HTMLUListElement>(null)

  const selectedOption = options.find(o => o.value === value)

  const filtered = query
    ? options.filter(o =>
        o.label.toLowerCase().includes(query.toLowerCase()) ||
        o.description?.toLowerCase().includes(query.toLowerCase())
      )
    : options

  const handleSelect = (opt: ComboboxOption) => {
    onChange(opt.value)
    setQuery('')
    setIsOpen(false)
    setActiveIndex(-1)
  }

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === 'ArrowDown') {
      e.preventDefault()
      setActiveIndex(prev => Math.min(prev + 1, filtered.length - 1))
    } else if (e.key === 'ArrowUp') {
      e.preventDefault()
      setActiveIndex(prev => Math.max(prev - 1, -1))
    } else if (e.key === 'Enter' && activeIndex >= 0 && filtered[activeIndex]) {
      e.preventDefault()
      handleSelect(filtered[activeIndex])
    } else if (e.key === 'Escape') {
      setIsOpen(false)
    }
  }

  // Close on click outside
  useEffect(() => {
    const handleClick = (e: MouseEvent) => {
      if (inputRef.current && !inputRef.current.parentElement?.contains(e.target as Node)) {
        setIsOpen(false)
      }
    }
    document.addEventListener('mousedown', handleClick)
    return () => document.removeEventListener('mousedown', handleClick)
  }, [])

  return (
    <div className={`relative ${className}`}>
      {label && <label className="text-sm font-medium text-zinc-700 block mb-1">{label}</label>}
      <input
        ref={inputRef}
        type="text"
        value={isOpen ? query : (selectedOption?.label ?? '')}
        onChange={(e) => { setQuery(e.target.value); setIsOpen(true); setActiveIndex(-1) }}
        onFocus={() => { setIsOpen(true); setQuery('') }}
        onKeyDown={handleKeyDown}
        placeholder={placeholder}
        className="w-full px-3 py-2 text-sm border border-zinc-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none"
        role="combobox"
        aria-expanded={isOpen}
        aria-autocomplete="list"
        aria-controls="combobox-list"
      />

      {isOpen && filtered.length > 0 && (
        <ul
          ref={listRef}
          id="combobox-list"
          className="absolute z-20 mt-1 w-full bg-white border border-zinc-200 rounded-lg shadow-lg max-h-48 overflow-y-auto"
          role="listbox"
        >
          {filtered.map((opt, i) => (
            <li
              key={opt.value}
              className={`px-3 py-2 cursor-pointer text-sm ${
                i === activeIndex ? 'bg-blue-50 text-blue-700' : 'text-zinc-700 hover:bg-zinc-50'
              } ${value === opt.value ? 'font-semibold' : ''}`}
              onClick={() => handleSelect(opt)}
              onMouseEnter={() => setActiveIndex(i)}
              role="option"
              aria-selected={value === opt.value}
            >
              {opt.label}
              {opt.description && (
                <span className="block text-xs text-zinc-400">{opt.description}</span>
              )}
            </li>
          ))}
        </ul>
      )}

      {isOpen && filtered.length === 0 && query && (
        <div className="absolute z-20 mt-1 w-full bg-white border border-zinc-200 rounded-lg shadow-lg p-3 text-sm text-zinc-500">
          Nenhum resultado
        </div>
      )}
    </div>
  )
}
