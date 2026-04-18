'use client'

import { FormEvent, useId, useState, useTransition } from 'react'
import { Loader2, Plus, AlertCircle } from 'lucide-react'
import { addFactCheck } from './actions'

interface Props {
  outlets: Array<{ key: string; label: string }>
  ratings: Record<string, string>
}

export function AddFactCheckForm({ outlets, ratings }: Props) {
  const [pending, start] = useTransition()
  const [err, setErr] = useState<string | null>(null)
  const [ok, setOk] = useState(false)
  const [outletKey, setOutletKey] = useState(outlets[0]?.key ?? 'agencia_lupa')

  const ids = {
    stmt: useId(), outlet: useId(), outletLabel: useId(), url: useId(),
    title: useId(), rating: useId(), ratingLabel: useId(), pub: useId(),
  }

  function onSubmit(e: FormEvent<HTMLFormElement>) {
    e.preventDefault()
    setErr(null); setOk(false)
    const form = new FormData(e.currentTarget)
    start(async () => {
      try {
        await addFactCheck({
          statement_id: (form.get('statement_id') as string)?.trim(),
          outlet_key: outletKey,
          outlet_label_override: (form.get('outlet_label_override') as string) || undefined,
          url: (form.get('url') as string)?.trim(),
          title: (form.get('title') as string) || undefined,
          rating: (form.get('rating') as string) || undefined,
          rating_label: (form.get('rating_label') as string) || undefined,
          published_at: (form.get('published_at') as string) || undefined,
        })
        setOk(true)
        e.currentTarget.reset()
        setOutletKey(outlets[0]?.key ?? 'agencia_lupa')
      } catch (ex) {
        setErr(ex instanceof Error ? ex.message : 'Erro')
      }
    })
  }

  const inputCls = 'w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500'
  const labelCls = 'block text-xs font-medium text-gray-700 mb-1'

  return (
    <form onSubmit={onSubmit} className="bg-white border border-gray-200 rounded-xl p-5 space-y-4">
      <h2 className="text-sm font-semibold text-gray-900">Adicionar nova checagem</h2>

      {err && (
        <div className="bg-red-50 border border-red-200 rounded p-2 flex gap-2 text-sm text-red-900">
          <AlertCircle className="w-4 h-4 flex-shrink-0 mt-0.5" aria-hidden="true" />
          <span>{err}</span>
        </div>
      )}
      {ok && (
        <div className="bg-green-50 border border-green-200 rounded p-2 text-sm text-green-900">Checagem adicionada.</div>
      )}

      <div>
        <label htmlFor={ids.stmt} className={labelCls}>UUID ou slug da declaração *</label>
        <input id={ids.stmt} name="statement_id" type="text" required className={inputCls} placeholder="3f4a…-…-… ou lula-amazonia-2023-…" />
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
        <div>
          <label htmlFor={ids.outlet} className={labelCls}>Outlet *</label>
          <select
            id={ids.outlet}
            value={outletKey}
            onChange={(e) => setOutletKey(e.target.value)}
            className={inputCls}
          >
            {outlets.map((o) => (
              <option key={o.key} value={o.key}>{o.label}</option>
            ))}
          </select>
        </div>
        {outletKey === 'outro' && (
          <div>
            <label htmlFor={ids.outletLabel} className={labelCls}>Nome do outlet *</label>
            <input id={ids.outletLabel} name="outlet_label_override" type="text" maxLength={100} className={inputCls} />
          </div>
        )}
        <div>
          <label htmlFor={ids.pub} className={labelCls}>Data de publicação</label>
          <input id={ids.pub} name="published_at" type="date" className={inputCls} />
        </div>
      </div>

      <div>
        <label htmlFor={ids.url} className={labelCls}>URL da checagem *</label>
        <input id={ids.url} name="url" type="url" required className={inputCls} placeholder="https://lupa.uol.com.br/…" />
      </div>

      <div>
        <label htmlFor={ids.title} className={labelCls}>Título da matéria</label>
        <input id={ids.title} name="title" type="text" maxLength={300} className={inputCls} />
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
        <div>
          <label htmlFor={ids.rating} className={labelCls}>Classificação</label>
          <select id={ids.rating} name="rating" className={inputCls} defaultValue="">
            <option value="">—</option>
            {Object.entries(ratings).map(([k, v]) => (
              <option key={k} value={k}>{v}</option>
            ))}
          </select>
        </div>
        <div>
          <label htmlFor={ids.ratingLabel} className={labelCls}>Rótulo original (se diferente)</label>
          <input id={ids.ratingLabel} name="rating_label" type="text" maxLength={100} className={inputCls} placeholder="ex.: 'Contraditório'" />
        </div>
      </div>

      <button
        type="submit"
        disabled={pending}
        className="inline-flex items-center gap-1.5 px-4 py-2 bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white text-sm font-medium rounded"
      >
        {pending ? <Loader2 className="w-4 h-4 animate-spin" /> : <Plus className="w-4 h-4" />}
        Adicionar checagem
      </button>
    </form>
  )
}
