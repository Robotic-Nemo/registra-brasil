'use client'

import { useState, useEffect, useMemo, useRef } from 'react'
import { useRouter } from 'next/navigation'

interface Command {
  id: string
  label: string
  description?: string
  icon?: string
  action: () => void
  keywords?: string[]
}

export function CommandPalette() {
  const [isOpen, setIsOpen] = useState(false)
  const [query, setQuery] = useState('')
  const [selectedIndex, setSelectedIndex] = useState(0)
  const inputRef = useRef<HTMLInputElement>(null)
  const router = useRouter()

  const commands: Command[] = useMemo(() => [
    { id: 'home', label: 'Início', icon: '🏠', action: () => router.push('/'), keywords: ['home', 'inicio'] },
    { id: 'search', label: 'Buscar', icon: '🔍', action: () => router.push('/buscar'), keywords: ['pesquisar', 'search'] },
    { id: 'politicians', label: 'Políticos', icon: '👤', action: () => router.push('/politicos'), keywords: ['deputado', 'senador'] },
    { id: 'categories', label: 'Categorias', icon: '🏷️', action: () => router.push('/categorias'), keywords: ['tema', 'assunto'] },
    { id: 'stats', label: 'Estatísticas', icon: '📊', action: () => router.push('/estatisticas'), keywords: ['dados', 'numeros'] },
    { id: 'compare', label: 'Comparar', icon: '⚖️', action: () => router.push('/comparar'), keywords: ['versus', 'comparacao'] },
    { id: 'recent', label: 'Recentes', icon: '🕐', action: () => router.push('/declaracoes-recentes'), keywords: ['novas', 'ultimas'] },
    { id: 'timeline', label: 'Linha do Tempo', icon: '📅', action: () => router.push('/linha-do-tempo'), keywords: ['cronologia'] },
    { id: 'about', label: 'Sobre', icon: 'ℹ️', action: () => router.push('/sobre'), keywords: ['metodologia'] },
    { id: 'api', label: 'Documentação API', icon: '📖', action: () => router.push('/api-docs'), keywords: ['developer', 'docs'] },
  ], [router])

  const filtered = useMemo(() => {
    if (!query) return commands
    const q = query.toLowerCase()
    return commands.filter(cmd =>
      cmd.label.toLowerCase().includes(q) ||
      cmd.description?.toLowerCase().includes(q) ||
      cmd.keywords?.some(k => k.toLowerCase().includes(q))
    )
  }, [commands, query])

  // Open with Cmd+K / Ctrl+K
  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      if ((e.metaKey || e.ctrlKey) && e.key === 'k') {
        e.preventDefault()
        setIsOpen(prev => !prev)
      }
    }
    window.addEventListener('keydown', handleKeyDown)
    return () => window.removeEventListener('keydown', handleKeyDown)
  }, [])

  // Focus input when opened; restore focus to prior element on close.
  useEffect(() => {
    if (!isOpen) return
    setQuery('')
    setSelectedIndex(0)
    const prev = typeof document !== 'undefined' ? (document.activeElement as HTMLElement | null) : null
    const t = setTimeout(() => inputRef.current?.focus(), 50)
    return () => {
      clearTimeout(t)
      prev?.focus?.()
    }
  }, [isOpen])

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === 'ArrowDown') {
      e.preventDefault()
      setSelectedIndex(prev => (prev + 1) % filtered.length)
    } else if (e.key === 'ArrowUp') {
      e.preventDefault()
      setSelectedIndex(prev => (prev - 1 + filtered.length) % filtered.length)
    } else if (e.key === 'Enter' && filtered[selectedIndex]) {
      filtered[selectedIndex].action()
      setIsOpen(false)
    } else if (e.key === 'Escape') {
      setIsOpen(false)
    }
  }

  if (!isOpen) return null

  return (
    <div
      className="fixed inset-0 z-50 flex items-start justify-center pt-[20vh] bg-black/50 backdrop-blur-sm"
      onClick={() => setIsOpen(false)}
    >
      <div
        className="bg-white rounded-xl shadow-2xl w-full max-w-lg mx-4 overflow-hidden"
        onClick={(e) => e.stopPropagation()}
        role="dialog"
        aria-modal="true"
        aria-label="Paleta de comandos"
      >
        <div className="border-b border-zinc-200 p-3">
          <input
            ref={inputRef}
            type="text"
            value={query}
            onChange={(e) => { setQuery(e.target.value); setSelectedIndex(0) }}
            onKeyDown={handleKeyDown}
            placeholder="Digite um comando..."
            className="w-full text-sm outline-none placeholder:text-zinc-400"
            aria-label="Buscar comando"
          />
        </div>
        <div className="max-h-64 overflow-y-auto py-1">
          {filtered.length === 0 ? (
            <p className="text-sm text-zinc-500 text-center py-4">Nenhum comando encontrado</p>
          ) : (
            filtered.map((cmd, i) => (
              <button
                type="button"
                key={cmd.id}
                className={`w-full flex items-center gap-3 px-4 py-2.5 text-sm text-left transition-colors ${
                  i === selectedIndex ? 'bg-blue-50 text-blue-700' : 'text-zinc-700 hover:bg-zinc-50'
                }`}
                onClick={() => { cmd.action(); setIsOpen(false) }}
                onMouseEnter={() => setSelectedIndex(i)}
                aria-selected={i === selectedIndex}
                role="option"
              >
                <span className="text-base" aria-hidden="true">{cmd.icon}</span>
                <span className="font-medium">{cmd.label}</span>
                {cmd.description && (
                  <span className="text-zinc-400 text-xs ml-auto">{cmd.description}</span>
                )}
              </button>
            ))
          )}
        </div>
        <div className="border-t border-zinc-200 px-4 py-2 text-[10px] text-zinc-400 flex items-center justify-between">
          <span>↑↓ Navegar · Enter Selecionar · Esc Fechar</span>
          <span>⌘K</span>
        </div>
      </div>
    </div>
  )
}
