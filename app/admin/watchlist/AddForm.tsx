'use client'

import { useState, useTransition } from 'react'
import { addToWatchlist } from './actions'

export function AddForm() {
  const [status, setStatus] = useState<string | null>(null)
  const [pending, start] = useTransition()
  return (
    <form
      className="grid gap-3 rounded-xl border border-gray-200 bg-white p-4 md:grid-cols-[1fr_auto_auto] md:items-end dark:border-gray-800 dark:bg-gray-900"
      onSubmit={(e) => {
        e.preventDefault()
        const f = new FormData(e.currentTarget)
        setStatus(null)
        start(async () => {
          try {
            await addToWatchlist({
              politician_id: String(f.get('politician_id') ?? ''),
              priority: Number(f.get('priority') ?? 2),
              reason: String(f.get('reason') ?? ''),
            })
            setStatus('✅ Adicionado')
            ;(e.target as HTMLFormElement).reset()
          } catch (err) {
            setStatus(`❌ ${err instanceof Error ? err.message : 'erro'}`)
          }
        })
      }}
    >
      <label className="grid gap-1 text-sm">
        <span className="text-xs font-medium uppercase tracking-wider text-gray-600 dark:text-gray-400">
          Político (UUID)
        </span>
        <input
          name="politician_id"
          required
          className="rounded border border-gray-300 px-2 py-1 font-mono text-xs dark:border-gray-700 dark:bg-gray-950"
          placeholder="00000000-0000-0000-0000-000000000000"
        />
      </label>
      <label className="grid gap-1 text-sm">
        <span className="text-xs font-medium uppercase tracking-wider text-gray-600 dark:text-gray-400">
          Prioridade
        </span>
        <select
          name="priority"
          defaultValue="2"
          className="rounded border border-gray-300 px-2 py-1 dark:border-gray-700 dark:bg-gray-950"
        >
          <option value="1">1 — Baixa</option>
          <option value="2">2 — Média</option>
          <option value="3">3 — Alta</option>
          <option value="4">4 — Crítica</option>
        </select>
      </label>
      <button
        type="submit"
        disabled={pending}
        className="rounded bg-indigo-600 px-4 py-1.5 text-sm font-semibold text-white hover:bg-indigo-700 disabled:opacity-50"
      >
        {pending ? 'Salvando…' : 'Adicionar'}
      </button>
      <label className="grid gap-1 text-sm md:col-span-3">
        <span className="text-xs font-medium uppercase tracking-wider text-gray-600 dark:text-gray-400">
          Motivo (opcional)
        </span>
        <input
          name="reason"
          maxLength={1000}
          placeholder="ex.: ocupante de cargo-chave, vigiado por CPI"
          className="rounded border border-gray-300 px-2 py-1 dark:border-gray-700 dark:bg-gray-950"
        />
      </label>
      {status && <span className="md:col-span-3 text-xs">{status}</span>}
    </form>
  )
}
