'use client'

import { useState, useTransition } from 'react'
import { removeFromWatchlist, updatePriority } from './actions'

export function RowActions({ id, priority }: { id: string; priority: number }) {
  const [pri, setPri] = useState(priority)
  const [pending, start] = useTransition()
  return (
    <div className="flex items-center gap-2">
      <select
        value={pri}
        disabled={pending}
        onChange={(e) => {
          const next = Number(e.target.value)
          setPri(next)
          start(async () => {
            try { await updatePriority(id, next) } catch (err) {
              setPri(priority)
              alert(err instanceof Error ? err.message : 'erro')
            }
          })
        }}
        className="rounded border border-gray-300 bg-white px-2 py-0.5 text-xs dark:border-gray-700 dark:bg-gray-900"
      >
        <option value={1}>1 — Baixa</option>
        <option value={2}>2 — Média</option>
        <option value={3}>3 — Alta</option>
        <option value={4}>4 — Crítica</option>
      </select>
      <button
        type="button"
        disabled={pending}
        onClick={() => {
          if (!confirm('Remover da watchlist?')) return
          start(async () => {
            try { await removeFromWatchlist(id) } catch (err) {
              alert(err instanceof Error ? err.message : 'erro')
            }
          })
        }}
        className="rounded border border-rose-300 px-2 py-0.5 text-xs text-rose-700 hover:bg-rose-50 dark:border-rose-800 dark:text-rose-300 dark:hover:bg-rose-950/40"
      >
        Remover
      </button>
    </div>
  )
}
