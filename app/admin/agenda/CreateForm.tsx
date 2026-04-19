'use client'

import { useState, useTransition } from 'react'
import { createEvent } from './actions'

const KINDS = [
  { id: 'votacao', label: 'Votação' },
  { id: 'cpi', label: 'CPI' },
  { id: 'debate', label: 'Debate' },
  { id: 'discurso', label: 'Discurso' },
  { id: 'decreto', label: 'Decreto' },
  { id: 'audiencia', label: 'Audiência' },
  { id: 'reuniao', label: 'Reunião' },
  { id: 'comissao', label: 'Comissão' },
  { id: 'agenda_oficial', label: 'Agenda oficial' },
  { id: 'other', label: 'Outro' },
]

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
            const r = await createEvent({
              title: String(f.get('title') ?? ''),
              summary: String(f.get('summary') ?? ''),
              body: String(f.get('body') ?? ''),
              event_date: String(f.get('event_date') ?? ''),
              event_end_date: String(f.get('event_end_date') ?? '') || undefined,
              location: String(f.get('location') ?? '') || undefined,
              source_url: String(f.get('source_url') ?? '') || undefined,
              kind: String(f.get('kind') ?? 'other'),
              politician_id: String(f.get('politician_id') ?? '') || undefined,
              is_published: f.get('is_published') === 'on',
            })
            setStatus(`✅ Criado ${r.id.slice(0, 8)}`)
            ;(e.target as HTMLFormElement).reset()
          } catch (err) {
            setStatus(`❌ ${err instanceof Error ? err.message : 'erro'}`)
          }
        })
      }}
    >
      <h2 className="text-sm font-semibold text-gray-900 dark:text-gray-100">Novo evento</h2>

      <label className="grid gap-1 text-sm">
        <span className="font-medium">Título</span>
        <input name="title" required maxLength={200}
          className="rounded border border-gray-300 px-2 py-1 dark:border-gray-700 dark:bg-gray-950" />
      </label>

      <label className="grid gap-1 text-sm">
        <span className="font-medium">Resumo</span>
        <textarea name="summary" required rows={3} maxLength={1000}
          className="rounded border border-gray-300 px-2 py-1 dark:border-gray-700 dark:bg-gray-950" />
      </label>

      <label className="grid gap-1 text-sm">
        <span className="font-medium">Descrição longa (opcional)</span>
        <textarea name="body" rows={5} maxLength={8000}
          className="rounded border border-gray-300 px-2 py-1 dark:border-gray-700 dark:bg-gray-950" />
      </label>

      <div className="grid grid-cols-1 gap-3 md:grid-cols-2">
        <label className="grid gap-1 text-sm">
          <span className="font-medium">Data / hora</span>
          <input name="event_date" type="datetime-local" required
            className="rounded border border-gray-300 px-2 py-1 dark:border-gray-700 dark:bg-gray-950" />
        </label>
        <label className="grid gap-1 text-sm">
          <span className="font-medium">Fim (opcional)</span>
          <input name="event_end_date" type="datetime-local"
            className="rounded border border-gray-300 px-2 py-1 dark:border-gray-700 dark:bg-gray-950" />
        </label>
      </div>

      <div className="grid grid-cols-1 gap-3 md:grid-cols-2">
        <label className="grid gap-1 text-sm">
          <span className="font-medium">Tipo</span>
          <select name="kind" defaultValue="other"
            className="rounded border border-gray-300 px-2 py-1 dark:border-gray-700 dark:bg-gray-950">
            {KINDS.map((k) => <option key={k.id} value={k.id}>{k.label}</option>)}
          </select>
        </label>
        <label className="grid gap-1 text-sm">
          <span className="font-medium">Local</span>
          <input name="location" maxLength={200}
            className="rounded border border-gray-300 px-2 py-1 dark:border-gray-700 dark:bg-gray-950" />
        </label>
      </div>

      <label className="grid gap-1 text-sm">
        <span className="font-medium">URL fonte (opcional)</span>
        <input name="source_url" type="url" maxLength={2000}
          className="rounded border border-gray-300 px-2 py-1 font-mono text-xs dark:border-gray-700 dark:bg-gray-950" />
      </label>

      <label className="grid gap-1 text-sm">
        <span className="font-medium">Político relacionado (UUID, opcional)</span>
        <input name="politician_id"
          className="rounded border border-gray-300 px-2 py-1 font-mono text-xs dark:border-gray-700 dark:bg-gray-950" />
      </label>

      <div className="flex items-center gap-3">
        <label className="flex items-center gap-2 text-sm">
          <input type="checkbox" name="is_published" />
          <span>Publicar imediatamente</span>
        </label>
        <button type="submit" disabled={pending}
          className="rounded bg-indigo-600 px-4 py-1.5 text-sm font-semibold text-white hover:bg-indigo-700 disabled:opacity-50">
          {pending ? 'Salvando…' : 'Criar'}
        </button>
        {status && <span className="text-sm">{status}</span>}
      </div>
    </form>
  )
}
