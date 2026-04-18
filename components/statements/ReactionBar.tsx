'use client'

import { useEffect, useState, useTransition } from 'react'
import { Star, ShieldAlert, MessageCircleQuestion, Flag, Loader2 } from 'lucide-react'

interface Counts {
  importante: number
  contestada: number
  fora_de_contexto: number
  erro: number
  total: number
}

interface Props {
  statementId: string
  initialCounts?: Partial<Counts>
}

const REACTIONS = [
  { key: 'importante', label: 'Importante', Icon: Star, tone: 'text-yellow-600 hover:bg-yellow-50' },
  { key: 'contestada', label: 'Contestada', Icon: ShieldAlert, tone: 'text-red-600 hover:bg-red-50' },
  { key: 'fora_de_contexto', label: 'Fora de contexto', Icon: MessageCircleQuestion, tone: 'text-amber-600 hover:bg-amber-50' },
  { key: 'erro', label: 'Reportar erro', Icon: Flag, tone: 'text-gray-600 hover:bg-gray-100' },
] as const

const STORAGE_KEY = 'rb:reactions'

function loadLocalReactions(): Record<string, Set<string>> {
  try {
    const raw = localStorage.getItem(STORAGE_KEY)
    if (!raw) return {}
    const parsed = JSON.parse(raw) as Record<string, string[]>
    const out: Record<string, Set<string>> = {}
    for (const [k, arr] of Object.entries(parsed)) out[k] = new Set(arr)
    return out
  } catch { return {} }
}

function saveLocalReactions(map: Record<string, Set<string>>) {
  try {
    const serializable: Record<string, string[]> = {}
    for (const [k, s] of Object.entries(map)) serializable[k] = [...s]
    localStorage.setItem(STORAGE_KEY, JSON.stringify(serializable))
  } catch { /* storage blocked */ }
}

/**
 * Anonymous reaction bar. Server-side we dedupe by daily-salted IP
 * hash; client-side we ALSO remember which reactions this device
 * clicked (localStorage) so the UI reflects your state across reloads
 * even when many users share a NAT.
 */
export function ReactionBar({ statementId, initialCounts }: Props) {
  const [counts, setCounts] = useState<Counts>({
    importante: initialCounts?.importante ?? 0,
    contestada: initialCounts?.contestada ?? 0,
    fora_de_contexto: initialCounts?.fora_de_contexto ?? 0,
    erro: initialCounts?.erro ?? 0,
    total: initialCounts?.total ?? 0,
  })
  const [mine, setMine] = useState<Set<string>>(new Set())
  const [pending, start] = useTransition()
  const [err, setErr] = useState<string | null>(null)

  useEffect(() => {
    const all = loadLocalReactions()
    setMine(all[statementId] ?? new Set())
    // Refresh counts on mount (in case server-rendered snapshot is stale).
    fetch(`/api/reactions?statement_id=${statementId}`)
      .then((r) => r.ok ? r.json() : null)
      .then((j) => {
        if (j?.counts) {
          setCounts({
            importante: j.counts.importante ?? 0,
            contestada: j.counts.contestada ?? 0,
            fora_de_contexto: j.counts.fora_de_contexto ?? 0,
            erro: j.counts.erro ?? 0,
            total: j.counts.total ?? 0,
          })
        }
      })
      .catch(() => {})
  }, [statementId])

  function react(key: string) {
    if (mine.has(key) || pending) return
    setErr(null)
    start(async () => {
      try {
        const res = await fetch('/api/reactions', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ statement_id: statementId, reaction: key }),
        })
        if (res.status === 429) { setErr('Muitas reações — tente novamente em alguns minutos.'); return }
        const j = await res.json()
        if (!res.ok || !j.success) { setErr('Não foi possível registrar.'); return }
        if (j.counts) {
          setCounts({
            importante: j.counts.importante ?? 0,
            contestada: j.counts.contestada ?? 0,
            fora_de_contexto: j.counts.fora_de_contexto ?? 0,
            erro: j.counts.erro ?? 0,
            total: j.counts.total ?? 0,
          })
        }
        const nextMine = new Set(mine)
        nextMine.add(key)
        setMine(nextMine)
        const all = loadLocalReactions()
        all[statementId] = nextMine
        saveLocalReactions(all)
      } catch {
        setErr('Falha de rede.')
      }
    })
  }

  return (
    <div className="border-t border-gray-100 pt-4">
      <p className="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-3">
        Como você classifica esta declaração?
      </p>
      <div className="flex flex-wrap gap-2">
        {REACTIONS.map(({ key, label, Icon, tone }) => {
          const n = counts[key as keyof Counts] as number
          const active = mine.has(key)
          return (
            <button
              key={key}
              type="button"
              onClick={() => react(key)}
              disabled={pending || active}
              aria-pressed={active}
              className={`inline-flex items-center gap-1.5 px-3 py-1.5 rounded-full border text-xs font-medium transition-colors focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500 ${
                active ? 'bg-blue-50 border-blue-300 text-blue-800 cursor-default' : `border-gray-200 ${tone}`
              }`}
            >
              {pending && !active ? (
                <Loader2 className="w-3.5 h-3.5 animate-spin" aria-hidden="true" />
              ) : (
                <Icon className="w-3.5 h-3.5" aria-hidden="true" />
              )}
              <span>{label}</span>
              <span className="tabular-nums text-[10px] opacity-70">{n}</span>
            </button>
          )
        })}
      </div>
      {err && <p className="text-xs text-red-700 mt-2" role="alert">{err}</p>}
      <p className="text-[10px] text-gray-400 mt-2">
        Anônimo. Limitado a 30 cliques por IP/10 min; cada reação conta uma única vez por pessoa.
      </p>
    </div>
  )
}
