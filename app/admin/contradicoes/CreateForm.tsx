'use client'

import { useState, useTransition } from 'react'
import { createContradiction } from './actions'

export function CreateForm() {
  const [status, setStatus] = useState<string | null>(null)
  const [pending, start] = useTransition()

  return (
    <form
      className="grid gap-3 rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900"
      onSubmit={(e) => {
        e.preventDefault()
        const f = new FormData(e.currentTarget)
        setStatus(null)
        start(async () => {
          try {
            const r = await createContradiction({
              politician_id: String(f.get('politician_id') ?? ''),
              statement_a_id: String(f.get('statement_a_id') ?? ''),
              statement_b_id: String(f.get('statement_b_id') ?? ''),
              headline: String(f.get('headline') ?? ''),
              editor_note: String(f.get('editor_note') ?? ''),
              severity: Number(f.get('severity') ?? 2),
              is_published: f.get('is_published') === 'on',
            })
            setStatus(`✅ Criado ${r.id.slice(0, 8)}`)
            ;(e.target as HTMLFormElement).reset()
          } catch (err: unknown) {
            setStatus(`❌ ${err instanceof Error ? err.message : 'erro'}`)
          }
        })
      }}
    >
      <h2 className="text-sm font-semibold text-gray-900 dark:text-gray-100">
        Nova contradição
      </h2>

      <label className="grid gap-1 text-sm">
        <span className="font-medium text-gray-700 dark:text-gray-300">Político (UUID)</span>
        <input
          name="politician_id"
          required
          className="rounded border border-gray-300 px-2 py-1 font-mono text-xs dark:border-gray-700 dark:bg-gray-950"
          placeholder="00000000-0000-0000-0000-000000000000"
        />
      </label>

      <div className="grid grid-cols-1 gap-3 md:grid-cols-2">
        <label className="grid gap-1 text-sm">
          <span className="font-medium text-gray-700 dark:text-gray-300">Declaração A (UUID)</span>
          <input
            name="statement_a_id"
            required
            className="rounded border border-gray-300 px-2 py-1 font-mono text-xs dark:border-gray-700 dark:bg-gray-950"
          />
        </label>
        <label className="grid gap-1 text-sm">
          <span className="font-medium text-gray-700 dark:text-gray-300">Declaração B (UUID)</span>
          <input
            name="statement_b_id"
            required
            className="rounded border border-gray-300 px-2 py-1 font-mono text-xs dark:border-gray-700 dark:bg-gray-950"
          />
        </label>
      </div>

      <label className="grid gap-1 text-sm">
        <span className="font-medium text-gray-700 dark:text-gray-300">
          Manchete (≤180 caracteres)
        </span>
        <input
          name="headline"
          required
          maxLength={180}
          className="rounded border border-gray-300 px-2 py-1 dark:border-gray-700 dark:bg-gray-950"
        />
      </label>

      <label className="grid gap-1 text-sm">
        <span className="font-medium text-gray-700 dark:text-gray-300">Nota editorial</span>
        <textarea
          name="editor_note"
          required
          minLength={10}
          maxLength={4000}
          rows={5}
          className="rounded border border-gray-300 px-2 py-1 dark:border-gray-700 dark:bg-gray-950"
        />
      </label>

      <div className="flex items-center gap-4">
        <label className="grid gap-1 text-sm">
          <span className="font-medium text-gray-700 dark:text-gray-300">Gravidade</span>
          <select
            name="severity"
            defaultValue="2"
            className="rounded border border-gray-300 px-2 py-1 dark:border-gray-700 dark:bg-gray-950"
          >
            <option value="1">1 — Leve</option>
            <option value="2">2 — Moderada</option>
            <option value="3">3 — Relevante</option>
            <option value="4">4 — Grave</option>
          </select>
        </label>
        <label className="mt-5 flex items-center gap-2 text-sm">
          <input type="checkbox" name="is_published" />
          <span>Publicar imediatamente</span>
        </label>
      </div>

      <div className="flex items-center gap-3">
        <button
          type="submit"
          disabled={pending}
          className="rounded bg-indigo-600 px-4 py-1.5 text-sm font-semibold text-white hover:bg-indigo-700 disabled:opacity-50"
        >
          {pending ? 'Salvando…' : 'Criar'}
        </button>
        {status && <span className="text-sm">{status}</span>}
      </div>
    </form>
  )
}
