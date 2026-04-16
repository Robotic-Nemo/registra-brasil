'use client'

import { Settings } from 'lucide-react'
import { useState } from 'react'
import { TextSizeControl } from '@/components/ui/TextSizeControl'
import { ContrastToggle } from '@/components/ui/ContrastToggle'

export function A11yToolbar() {
  const [open, setOpen] = useState(false)

  return (
    <div className="relative">
      <button
        onClick={() => setOpen(!open)}
        className="p-2 text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors"
        aria-label="Ferramentas de acessibilidade"
        aria-expanded={open}
        aria-controls="a11y-toolbar-panel"
      >
        <Settings className="h-5 w-5" aria-hidden="true" />
      </button>

      {open && (
        <div
          id="a11y-toolbar-panel"
          className="absolute right-0 top-full mt-2 w-72 bg-white dark:bg-gray-800 rounded-xl shadow-xl border border-gray-200 dark:border-gray-700 p-4 space-y-4 z-50"
          role="dialog"
          aria-label="Opcoes de acessibilidade"
        >
          <h3 className="text-sm font-semibold text-gray-700 dark:text-gray-300">Acessibilidade</h3>
          <div className="space-y-3">
            <div>
              <label className="text-xs text-gray-500 dark:text-gray-400 mb-1 block">Tamanho do texto</label>
              <TextSizeControl />
            </div>
            <div>
              <label className="text-xs text-gray-500 dark:text-gray-400 mb-1 block">Contraste</label>
              <ContrastToggle />
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
