'use client'

import { useState } from 'react'
import { Keyboard, X } from 'lucide-react'
import { ShortcutHint } from './ShortcutHint'

interface ShortcutEntry {
  keys: string[]
  description: string
}

const globalShortcuts: ShortcutEntry[] = [
  { keys: ['/'], description: 'Abrir busca' },
  { keys: ['Esc'], description: 'Fechar dialogo' },
  { keys: ['?'], description: 'Mostrar atalhos' },
  { keys: ['g', 'h'], description: 'Ir para inicio' },
]

interface KeyboardGuideProps {
  shortcuts?: ShortcutEntry[]
}

export function KeyboardGuide({ shortcuts = [] }: KeyboardGuideProps) {
  const [open, setOpen] = useState(false)

  const allShortcuts = [...globalShortcuts, ...shortcuts]

  return (
    <>
      <button
        onClick={() => setOpen(true)}
        className="p-2 text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors"
        aria-label="Guia de atalhos do teclado"
      >
        <Keyboard className="h-5 w-5" aria-hidden="true" />
      </button>

      {open && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50" role="dialog" aria-label="Atalhos do teclado">
          <div className="bg-white dark:bg-gray-800 rounded-xl shadow-2xl max-w-md w-full mx-4 p-6">
            <div className="flex items-center justify-between mb-4">
              <h2 className="text-lg font-semibold text-gray-900 dark:text-white">Atalhos do teclado</h2>
              <button
                onClick={() => setOpen(false)}
                className="p-1 text-gray-400 hover:text-gray-600 dark:hover:text-gray-300"
                aria-label="Fechar"
              >
                <X className="h-5 w-5" />
              </button>
            </div>
            <ul className="space-y-2">
              {allShortcuts.map((s, i) => (
                <li key={i} className="flex items-center justify-between py-1.5">
                  <span className="text-sm text-gray-600 dark:text-gray-400">{s.description}</span>
                  <ShortcutHint keys={s.keys} />
                </li>
              ))}
            </ul>
          </div>
        </div>
      )}
    </>
  )
}
