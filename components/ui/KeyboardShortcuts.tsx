'use client'

import { useEffect, useState } from 'react'

const SHORTCUTS = [
  { key: '/', description: 'Focar na busca' },
  { key: 'g h', description: 'Ir para início' },
  { key: 'g b', description: 'Ir para busca' },
  { key: 'g p', description: 'Ir para políticos' },
  { key: 'g c', description: 'Ir para categorias' },
  { key: 'g s', description: 'Ir para estatísticas' },
  { key: 'g m', description: 'Ir para comparar' },
  { key: 'g r', description: 'Ir para declarações recentes' },
  { key: 't', description: 'Voltar ao topo' },
  { key: '?', description: 'Mostrar atalhos' },
]

/**
 * Global keyboard shortcuts.
 */
export function KeyboardShortcuts() {
  const [showHelp, setShowHelp] = useState(false)
  const [pendingG, setPendingG] = useState(false)

  useEffect(() => {
    let gTimeout: ReturnType<typeof setTimeout> | null = null

    function handleKeyDown(e: KeyboardEvent) {
      const tag = (e.target as HTMLElement)?.tagName
      if (tag === 'INPUT' || tag === 'TEXTAREA' || tag === 'SELECT') return
      if (e.metaKey || e.ctrlKey || e.altKey) return

      if (e.key === '/') {
        e.preventDefault()
        const searchInput = document.querySelector<HTMLInputElement>(
          'input[type="search"], input[name="q"], input[placeholder*="Buscar"]'
        )
        searchInput?.focus()
        return
      }

      if (e.key === '?') {
        e.preventDefault()
        setShowHelp((v) => !v)
        return
      }

      if (e.key === 'Escape') {
        setShowHelp(false)
        return
      }

      // Two-key sequences: g + h/b/p
      if (e.key === 'g' && !pendingG) {
        setPendingG(true)
        gTimeout = setTimeout(() => setPendingG(false), 1000)
        return
      }

      if (e.key === 't' && !pendingG) {
        e.preventDefault()
        window.scrollTo({ top: 0, behavior: 'smooth' })
        return
      }

      if (pendingG) {
        setPendingG(false)
        if (gTimeout) clearTimeout(gTimeout)
        if (e.key === 'h') { window.location.href = '/'; return }
        if (e.key === 'b') { window.location.href = '/buscar'; return }
        if (e.key === 'p') { window.location.href = '/politicos'; return }
        if (e.key === 'c') { window.location.href = '/categorias'; return }
        if (e.key === 's') { window.location.href = '/estatisticas'; return }
        if (e.key === 'm') { window.location.href = '/comparar'; return }
        if (e.key === 'r') { window.location.href = '/declaracoes-recentes'; return }
      }
    }

    document.addEventListener('keydown', handleKeyDown)
    return () => {
      document.removeEventListener('keydown', handleKeyDown)
      if (gTimeout) clearTimeout(gTimeout)
    }
  }, [pendingG])

  if (!showHelp) return null

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4" role="dialog" aria-modal="true" aria-label="Atalhos de teclado">
      <div className="absolute inset-0 bg-black/40" onClick={() => setShowHelp(false)} />
      <div className="relative bg-white rounded-xl shadow-2xl p-6 w-full max-w-sm">
        <h2 className="font-bold text-gray-900 mb-4">Atalhos de teclado</h2>
        <div className="flex flex-col gap-2">
          {SHORTCUTS.map((s) => (
            <div key={s.key} className="flex items-center justify-between">
              <span className="text-sm text-gray-600">{s.description}</span>
              <kbd className="text-xs font-mono bg-gray-100 border border-gray-200 px-2 py-0.5 rounded text-gray-700">
                {s.key}
              </kbd>
            </div>
          ))}
        </div>
        <button
          onClick={() => setShowHelp(false)}
          className="mt-4 w-full text-center text-sm text-gray-500 hover:text-gray-700"
        >
          Fechar (Esc)
        </button>
      </div>
    </div>
  )
}
