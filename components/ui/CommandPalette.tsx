'use client'

import { useRouter } from 'next/navigation'
import { useEffect, useRef, useState } from 'react'
import {
  Search, ArrowRight, Home, Users, Tag, Flag, BarChart3, BookOpen,
  FolderKanban, Mail, Scale, History, Shield, Newspaper, Command, Loader2,
} from 'lucide-react'

type ItemKind = 'route' | 'politico' | 'declaracao'

interface Item {
  id: string
  title: string
  subtitle?: string
  href: string
  kind: ItemKind
  icon: React.ReactNode
  keywords?: string[]
}

const STATIC_ROUTES: Item[] = [
  { id: 'home', kind: 'route', title: 'Início', href: '/', icon: <Home className="w-4 h-4" />, keywords: ['home', 'inicio'] },
  { id: 'buscar', kind: 'route', title: 'Buscar declarações', href: '/buscar', icon: <Search className="w-4 h-4" />, keywords: ['search', 'busca', 'procurar'] },
  { id: 'politicos', kind: 'route', title: 'Políticos', href: '/politicos', icon: <Users className="w-4 h-4" />, keywords: ['politicians', 'deputado', 'senador'] },
  { id: 'categorias', kind: 'route', title: 'Categorias', href: '/categorias', icon: <Tag className="w-4 h-4" />, keywords: ['tema', 'assunto'] },
  { id: 'ranking', kind: 'route', title: 'Ranking de políticos', href: '/ranking', icon: <BarChart3 className="w-4 h-4" />, keywords: ['leaderboard'] },
  { id: 'analise', kind: 'route', title: 'Análise comparativa', href: '/analise', icon: <BarChart3 className="w-4 h-4" />, keywords: ['compare', 'comparar'] },
  { id: 'comparar', kind: 'route', title: 'Comparar políticos', href: '/comparar', icon: <BarChart3 className="w-4 h-4" />, keywords: ['versus'] },
  { id: 'mapa', kind: 'route', title: 'Mapa de estados', href: '/mapa', icon: <Flag className="w-4 h-4" /> },
  { id: 'partidos', kind: 'route', title: 'Partidos', href: '/partidos', icon: <Flag className="w-4 h-4" /> },
  { id: 'estados', kind: 'route', title: 'Estados', href: '/estados', icon: <Flag className="w-4 h-4" /> },
  { id: 'colecoes', kind: 'route', title: 'Coleções editoriais', href: '/colecoes', icon: <FolderKanban className="w-4 h-4" /> },
  { id: 'historias', kind: 'route', title: 'Histórias', href: '/historias', icon: <BookOpen className="w-4 h-4" /> },
  { id: 'atualizacoes', kind: 'route', title: 'Atualizações e correções', href: '/atualizacoes', icon: <History className="w-4 h-4" />, keywords: ['changelog'] },
  { id: 'boletim', kind: 'route', title: 'Boletim semanal', href: '/boletim', icon: <Mail className="w-4 h-4" /> },
  { id: 'sugerir', kind: 'route', title: 'Sugerir declaração', href: '/sugerir', icon: <Newspaper className="w-4 h-4" /> },
  { id: 'retratacoes-solicitar', kind: 'route', title: 'Solicitar retificação', href: '/retratacoes/solicitar', icon: <Scale className="w-4 h-4" />, keywords: ['direito', 'resposta', 'retratação'] },
  { id: 'retratacoes', kind: 'route', title: 'Histórico de retratações', href: '/retratacoes', icon: <Scale className="w-4 h-4" /> },
  { id: 'estatisticas', kind: 'route', title: 'Estatísticas', href: '/estatisticas', icon: <BarChart3 className="w-4 h-4" />, keywords: ['dados', 'numeros'] },
  { id: 'transparencia', kind: 'route', title: 'Transparência editorial', href: '/transparencia', icon: <Shield className="w-4 h-4" /> },
  { id: 'dados', kind: 'route', title: 'Dados abertos', href: '/dados', icon: <Shield className="w-4 h-4" /> },
  { id: 'api-docs', kind: 'route', title: 'Documentação da API', href: '/api-docs', icon: <Shield className="w-4 h-4" />, keywords: ['api', 'docs', 'developer'] },
  { id: 'status', kind: 'route', title: 'Status do sistema', href: '/status', icon: <Shield className="w-4 h-4" /> },
  { id: 'meus-alertas', kind: 'route', title: 'Meus alertas', href: '/meus-alertas', icon: <Mail className="w-4 h-4" /> },
  { id: 'contato', kind: 'route', title: 'Contato', href: '/contato', icon: <Mail className="w-4 h-4" /> },
  { id: 'linha-do-tempo', kind: 'route', title: 'Linha do tempo', href: '/linha-do-tempo', icon: <History className="w-4 h-4" />, keywords: ['cronologia'] },
  { id: 'recentes', kind: 'route', title: 'Declarações recentes', href: '/declaracoes-recentes', icon: <Newspaper className="w-4 h-4" />, keywords: ['novas', 'ultimas'] },
  { id: 'sobre', kind: 'route', title: 'Sobre / metodologia', href: '/sobre', icon: <Shield className="w-4 h-4" /> },
]

function matches(item: Item, q: string): boolean {
  if (!q) return true
  const hay = (item.title + ' ' + (item.subtitle ?? '') + ' ' + (item.keywords ?? []).join(' ')).toLowerCase()
  return q.toLowerCase().split(/\s+/).every((tok) => hay.includes(tok))
}

/**
 * Global command palette (Cmd/Ctrl+K). Static route list filtered
 * client-side; dynamic politician + statement suggestions come from
 * the existing `/api/suggest` endpoint (200ms debounce, cancelable).
 * Keyboard: ↑/↓/Enter/Esc.
 */
export function CommandPalette() {
  const router = useRouter()
  const [open, setOpen] = useState(false)
  const [q, setQ] = useState('')
  const [dynamicItems, setDynamicItems] = useState<Item[]>([])
  const [loading, setLoading] = useState(false)
  const [cursor, setCursor] = useState(0)
  const inputRef = useRef<HTMLInputElement>(null)
  const listRef = useRef<HTMLUListElement>(null)
  const abortRef = useRef<AbortController | null>(null)

  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      if ((e.metaKey || e.ctrlKey) && e.key.toLowerCase() === 'k') {
        e.preventDefault()
        setOpen((v) => !v)
      }
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [])

  useEffect(() => {
    if (open) {
      setTimeout(() => inputRef.current?.focus(), 0)
    } else {
      setQ('')
      setDynamicItems([])
      setCursor(0)
      abortRef.current?.abort()
    }
  }, [open])

  useEffect(() => {
    if (!open) return
    const trimmed = q.trim()
    if (trimmed.length < 2) { setDynamicItems([]); return }
    const handle = window.setTimeout(() => {
      abortRef.current?.abort()
      const ctrl = new AbortController()
      abortRef.current = ctrl
      setLoading(true)
      fetch(`/api/suggest?q=${encodeURIComponent(trimmed)}`, { signal: ctrl.signal })
        .then((r) => r.ok ? r.json() : [])
        .then((data) => {
          type SuggestItem = { type: 'politician' | 'statement'; label: string; href: string }
          const list: Item[] = ((data as SuggestItem[] | undefined) ?? []).map((d, i) => ({
            id: `${d.type}-${i}-${d.href}`,
            kind: d.type === 'politician' ? 'politico' : 'declaracao',
            title: d.label,
            href: d.href,
            icon: d.type === 'politician'
              ? <Users className="w-4 h-4" />
              : <Newspaper className="w-4 h-4" />,
          }))
          setDynamicItems(list)
        })
        .catch(() => {})
        .finally(() => setLoading(false))
    }, 200)
    return () => window.clearTimeout(handle)
  }, [q, open])

  const filtered = STATIC_ROUTES.filter((r) => matches(r, q))
  const items: Item[] = [...filtered, ...dynamicItems]
  const activeItem = items[Math.min(cursor, items.length - 1)] as Item | undefined

  function run(item: Item) {
    setOpen(false)
    router.push(item.href)
  }

  function onKeyDown(e: React.KeyboardEvent<HTMLInputElement>) {
    if (e.key === 'Escape') { setOpen(false); return }
    if (e.key === 'ArrowDown') { e.preventDefault(); setCursor((c) => Math.min(items.length - 1, c + 1)); return }
    if (e.key === 'ArrowUp') { e.preventDefault(); setCursor((c) => Math.max(0, c - 1)); return }
    if (e.key === 'Enter' && activeItem) { e.preventDefault(); run(activeItem) }
  }

  if (!open) return null

  return (
    <div
      role="dialog"
      aria-modal="true"
      aria-label="Paleta de comandos"
      className="fixed inset-0 z-50 flex items-start justify-center pt-[15vh] px-4"
    >
      <div className="absolute inset-0 bg-black/40 backdrop-blur-sm" onClick={() => setOpen(false)} aria-hidden="true" />

      <div className="relative bg-white rounded-xl shadow-2xl border border-gray-200 w-full max-w-xl overflow-hidden">
        <div className="flex items-center gap-2 px-4 py-3 border-b border-gray-100">
          <Search className="w-4 h-4 text-gray-400" aria-hidden="true" />
          <input
            ref={inputRef}
            value={q}
            onChange={(e) => { setQ(e.target.value); setCursor(0) }}
            onKeyDown={onKeyDown}
            placeholder="Ir para… ou buscar políticos, declarações…"
            className="flex-1 bg-transparent text-sm focus:outline-none"
            aria-label="Comando"
          />
          {loading && <Loader2 className="w-3.5 h-3.5 animate-spin text-gray-400" aria-hidden="true" />}
          <kbd className="text-[10px] font-mono text-gray-400 border border-gray-300 rounded px-1 py-0.5 bg-gray-50">esc</kbd>
        </div>

        <ul ref={listRef} className="max-h-80 overflow-y-auto" role="listbox">
          {items.length === 0 && (
            <li className="px-4 py-6 text-center text-sm text-gray-500">Nada encontrado.</li>
          )}
          {items.map((it, i) => {
            const active = i === cursor
            return (
              <li
                key={it.id}
                role="option"
                aria-selected={active}
                onMouseEnter={() => setCursor(i)}
                onClick={() => run(it)}
                className={`flex items-center gap-3 px-4 py-2.5 text-sm cursor-pointer ${
                  active ? 'bg-blue-50 text-blue-900' : 'text-gray-800'
                }`}
              >
                <span className={active ? 'text-blue-700' : 'text-gray-500'}>{it.icon}</span>
                <span className="flex-1 min-w-0">
                  <span className="block truncate">{it.title}</span>
                  {it.subtitle && <span className="block text-xs text-gray-500 truncate">{it.subtitle}</span>}
                </span>
                {active && <ArrowRight className="w-3.5 h-3.5 text-blue-700 flex-shrink-0" aria-hidden="true" />}
              </li>
            )
          })}
        </ul>

        <div className="px-4 py-2 border-t border-gray-100 text-[11px] text-gray-500 flex items-center gap-3">
          <span className="inline-flex items-center gap-1"><Command className="w-3 h-3" aria-hidden="true" />+K</span>
          <span>↑ ↓ navegar</span>
          <span>⏎ abrir</span>
          <span>esc fechar</span>
        </div>
      </div>
    </div>
  )
}
