'use client'

import { Printer } from 'lucide-react'

interface PrintButtonProps {
  className?: string
}

export function PrintButton({ className = '' }: PrintButtonProps) {
  return (
    <button
      onClick={() => window.print()}
      className={`inline-flex items-center gap-1.5 px-3 py-1.5 text-sm rounded-lg border border-gray-200 bg-white text-gray-600 hover:border-gray-300 hover:bg-gray-50 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:border-gray-600 dark:hover:bg-gray-700 transition-colors ${className}`}
      aria-label="Imprimir pagina"
    >
      <Printer className="h-4 w-4" aria-hidden="true" />
      <span>Imprimir</span>
    </button>
  )
}
