'use client'

import { FormEvent, useState, useTransition, useId } from 'react'
import { Loader2, Plus, AlertCircle } from 'lucide-react'
import { schedulePick } from './actions'

export function SchedulerForm({ today }: { today: string }) {
  const [pending, start] = useTransition()
  const [err, setErr] = useState<string | null>(null)
  const [ok, setOk] = useState(false)
  const dateId = useId()
  const idId = useId()
  const noteId = useId()

  function onSubmit(e: FormEvent<HTMLFormElement>) {
    e.preventDefault()
    setErr(null); setOk(false)
    const form = new FormData(e.currentTarget)
    start(async () => {
      try {
        await schedulePick({
          pick_date: form.get('pick_date') as string,
          identifier: (form.get('identifier') as string).trim(),
          note: (form.get('note') as string) || undefined,
        })
        setOk(true)
        e.currentTarget.reset()
      } catch (ex) {
        setErr(ex instanceof Error ? ex.message : 'Erro')
      }
    })
  }

  const inputCls = 'w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500'

  return (
    <form onSubmit={onSubmit} className="space-y-3">
      {err && (
        <div className="bg-red-50 border border-red-200 rounded p-2 flex gap-2 text-xs text-red-900">
          <AlertCircle className="w-3.5 h-3.5 flex-shrink-0 mt-0.5" aria-hidden="true" />
          <span>{err}</span>
        </div>
      )}
      {ok && <div className="bg-green-50 border border-green-200 rounded p-2 text-xs text-green-900">Pick agendado.</div>}

      <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
        <div>
          <label htmlFor={dateId} className="block text-xs font-medium text-gray-700 mb-1">Data *</label>
          <input id={dateId} name="pick_date" type="date" required min={today} defaultValue={today} className={inputCls} />
        </div>
        <div>
          <label htmlFor={idId} className="block text-xs font-medium text-gray-700 mb-1">Slug ou UUID da declaração *</label>
          <input id={idId} name="identifier" type="text" required className={inputCls} placeholder="ex.: lula-amazonia-2023-07-15" />
        </div>
      </div>

      <div>
        <label htmlFor={noteId} className="block text-xs font-medium text-gray-700 mb-1">Nota da curadoria (opcional, ≤500)</label>
        <textarea id={noteId} name="note" maxLength={500} rows={2} className={inputCls} placeholder="Por que esta declaração hoje?" />
      </div>

      <button
        type="submit"
        disabled={pending}
        className="inline-flex items-center gap-1.5 px-4 py-2 bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white text-sm font-medium rounded"
      >
        {pending ? <Loader2 className="w-4 h-4 animate-spin" /> : <Plus className="w-4 h-4" />}
        Agendar
      </button>
    </form>
  )
}
