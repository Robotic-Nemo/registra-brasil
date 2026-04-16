'use client'

import { Eye } from 'lucide-react'
import { useHighContrast } from '@/lib/hooks/useHighContrast'

interface ContrastToggleProps {
  className?: string
}

export function ContrastToggle({ className = '' }: ContrastToggleProps) {
  const { enabled, toggle } = useHighContrast()

  return (
    <button
      onClick={toggle}
      className={`inline-flex items-center gap-1.5 px-3 py-1.5 text-sm rounded-lg border transition-all ${
        enabled
          ? 'bg-gray-900 border-gray-700 text-white'
          : 'bg-white border-gray-200 text-gray-600 hover:border-gray-300 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400'
      } ${className}`}
      aria-pressed={enabled}
      aria-label={enabled ? 'Desativar alto contraste' : 'Ativar alto contraste'}
    >
      <Eye className="h-4 w-4" aria-hidden="true" />
      <span>Alto contraste</span>
    </button>
  )
}
