'use client'

import { useEffect, useState } from 'react'

const SHORTCUTS = [
  { keys: ['/', '?'], description: 'Abrir busca' },
  { keys: ['g', 'h'], description: 'Ir para início' },
  { keys: ['g', 'p'], description: 'Ir para políticos' },
  { keys: ['g', 'e'], description: 'Ir para estatísticas' },
  { keys: ['g', 'c'], description: 'Ir para categorias' },
  { keys: ['g', 'm'], description: 'Ir para comparar' },
  { keys: ['g', 'r'], description: 'Ir para recentes' },
  { keys: ['g', 't'], description: 'Ir para linha do tempo' },
  { keys: ['t'], description: 'Voltar ao topo' },
  { keys: ['Esc'], description: 'Fechar diálogo' },
  { keys: ['Shift', '?'], description: 'Mostrar atalhos' },
]

export function KeyboardShortcutsOverlay() {
  const [isOpen, setIsOpen] = useState(false)

  useEffect(() => {
    function handleKeyDown(e: KeyboardEvent) {
      if (e.key === '?' && e.shiftKey) {
        e.preventDefault()
        setIsOpen(prev => !prev)
      }
      if (e.key === 'Escape' && isOpen) {
        setIsOpen(false)
      }
    }

    window.addEventListener('keydown', handleKeyDown)
    return () => window.removeEventListener('keydown', handleKeyDown)
  }, [isOpen])

  if (!isOpen) return null

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 backdrop-blur-sm"
      onClick={() => setIsOpen(false)}
      role="dialog"
      aria-modal="true"
      aria-label="Atalhos de teclado"
    >
      <div
        className="bg-white rounded-xl shadow-2xl w-full max-w-md mx-4 p-6"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="flex items-center justify-between mb-4">
          <h2 className="text-lg font-bold text-zinc-900">Atalhos de Teclado</h2>
          <button
            onClick={() => setIsOpen(false)}
            className="text-zinc-400 hover:text-zinc-600 text-xl leading-none"
            aria-label="Fechar"
          >
            ×
          </button>
        </div>
        <div className="space-y-2">
          {SHORTCUTS.map(({ keys, description }) => (
            <div key={keys.join('+')} className="flex items-center justify-between py-1.5">
              <span className="text-sm text-zinc-600">{description}</span>
              <div className="flex items-center gap-1">
                {keys.map((key, i) => (
                  <span key={i}>
                    {i > 0 && <span className="text-zinc-300 mx-0.5">+</span>}
                    <kbd className="inline-block min-w-[24px] text-center px-1.5 py-0.5 bg-zinc-100 border border-zinc-300 rounded text-xs font-mono text-zinc-700">
                      {key}
                    </kbd>
                  </span>
                ))}
              </div>
            </div>
          ))}
        </div>
        <p className="text-xs text-zinc-400 mt-4 text-center">
          Pressione <kbd className="px-1 py-0.5 bg-zinc-100 border border-zinc-200 rounded text-[10px] font-mono">Shift + ?</kbd> para mostrar/esconder
        </p>
      </div>
    </div>
  )
}
