'use client'

import { useRef } from 'react'
import { Calendar } from 'lucide-react'

interface DatePickerProps {
  value: string
  onChange: (value: string) => void
  label?: string
  min?: string
  max?: string
  disabled?: boolean
  className?: string
  'aria-label'?: string
}

export function DatePicker({
  value,
  onChange,
  label,
  min,
  max,
  disabled = false,
  className = '',
  'aria-label': ariaLabel,
}: DatePickerProps) {
  const inputRef = useRef<HTMLInputElement>(null)

  function formatDisplay(dateStr: string): string {
    if (!dateStr) return ''
    try {
      const [year, month, day] = dateStr.split('-')
      return `${day}/${month}/${year}`
    } catch {
      return dateStr
    }
  }

  return (
    <div className={`flex flex-col gap-1 ${className}`}>
      {label && (
        <label className="text-sm font-medium text-gray-700">{label}</label>
      )}
      <div className="relative">
        <input
          ref={inputRef}
          type="date"
          value={value}
          onChange={(e) => onChange(e.target.value)}
          min={min}
          max={max}
          disabled={disabled}
          aria-label={ariaLabel ?? label}
          lang="pt-BR"
          className="w-full text-sm border border-gray-300 rounded-lg pl-9 pr-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent disabled:opacity-50 disabled:cursor-not-allowed"
        />
        <Calendar
          className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400 pointer-events-none"
          aria-hidden="true"
        />
      </div>
      {value && (
        <span className="text-xs text-gray-400">{formatDisplay(value)}</span>
      )}
    </div>
  )
}
