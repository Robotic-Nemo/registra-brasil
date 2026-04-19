'use client'

import { Printer } from 'lucide-react'

export function PrintButton({ label = 'Imprimir' }: { label?: string }) {
  return (
    <button
      type="button"
      onClick={() => window.print()}
      className="no-print inline-flex items-center gap-1 text-gray-500 hover:text-gray-900"
    >
      <Printer className="h-3.5 w-3.5" aria-hidden />
      {label}
    </button>
  )
}
