'use client'

import { FormEvent, useId, useState } from 'react'
import { useSearchParams } from 'next/navigation'
import { Bell, Loader2, CheckCircle2, AlertCircle } from 'lucide-react'

type Status = 'idle' | 'open' | 'submitting' | 'ok' | 'error'

/**
 * Inline "receive new results by email" widget for /buscar. Reads the
 * current URL params, POSTs them to /api/alerts/subscribe, and shows
 * the double-opt-in confirmation prompt.
 */
export function AlertSubscribe() {
  const sp = useSearchParams()
  const [status, setStatus] = useState<Status>('idle')
  const [msg, setMsg] = useState<string>('')
  const emailId = useId()
  const labelId = useId()

  const hasQuery = Array.from(sp.keys()).some((k) => k !== 'page')

  async function onSubmit(e: FormEvent<HTMLFormElement>) {
    e.preventDefault()
    setStatus('submitting')
    const form = new FormData(e.currentTarget)

    const query: Record<string, unknown> = {}
    const q = sp.get('q'); if (q) query.q = q
    const politico = sp.get('politico'); if (politico) query.politico = politico
    const partido = sp.get('partido'); if (partido) query.partido = partido
    const estado = sp.get('estado'); if (estado) query.estado = estado
    const status_ = sp.get('status'); if (status_) query.status = status_
    const de = sp.get('de'); if (de) query.de = de
    const ate = sp.get('ate'); if (ate) query.ate = ate
    const cats = sp.getAll('categoria'); if (cats.length) query.categoria = cats

    try {
      const res = await fetch('/api/alerts/subscribe', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          email: form.get('email'),
          label: form.get('label'),
          query,
        }),
      })
      const json = await res.json()
      if (!res.ok || !json.success) {
        setStatus('error')
        setMsg(json?.error?.message ?? 'Não foi possível criar o alerta.')
      } else {
        setStatus('ok')
        setMsg(json.message ?? 'Verifique seu e-mail para confirmar.')
      }
    } catch {
      setStatus('error')
      setMsg('Falha de rede.')
    }
  }

  if (!hasQuery) return null

  if (status === 'ok') {
    return (
      <div className="bg-green-50 border border-green-200 rounded-lg p-3 text-sm text-green-900 flex gap-2" role="status">
        <CheckCircle2 className="w-4 h-4 flex-shrink-0 mt-0.5" aria-hidden="true" />
        <span>{msg}</span>
      </div>
    )
  }

  if (status === 'idle') {
    return (
      <button
        type="button"
        onClick={() => setStatus('open')}
        className="inline-flex items-center gap-1.5 text-xs px-3 py-1.5 border border-blue-200 bg-blue-50 text-blue-800 rounded-full hover:bg-blue-100"
      >
        <Bell className="w-3.5 h-3.5" aria-hidden="true" />
        Receber novos resultados por e-mail
      </button>
    )
  }

  const inputCls = 'w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500'

  return (
    <form onSubmit={onSubmit} className="bg-white border border-blue-200 rounded-lg p-4 space-y-3 max-w-md">
      <div className="flex items-center gap-2 text-sm font-semibold text-gray-900">
        <Bell className="w-4 h-4 text-blue-700" aria-hidden="true" />
        Alerta de busca por e-mail
      </div>
      <p className="text-xs text-gray-600">
        Receba um aviso sempre que novas declarações corresponderem a esta busca. Dupla
        confirmação: você precisa clicar no link do e-mail para ativar.
      </p>
      <div>
        <label htmlFor={emailId} className="block text-xs font-medium text-gray-700 mb-1">E-mail</label>
        <input id={emailId} name="email" type="email" required autoComplete="email" className={inputCls} />
      </div>
      <div>
        <label htmlFor={labelId} className="block text-xs font-medium text-gray-700 mb-1">Rótulo (opcional)</label>
        <input id={labelId} name="label" type="text" maxLength={200} className={inputCls} placeholder="Ex.: Declarações sobre Amazônia" />
      </div>
      {status === 'error' && (
        <p className="text-xs text-red-700 flex gap-1.5 items-center">
          <AlertCircle className="w-3.5 h-3.5" aria-hidden="true" />
          {msg}
        </p>
      )}
      <div className="flex gap-2">
        <button
          type="submit"
          disabled={status === 'submitting'}
          className="inline-flex items-center gap-1.5 px-3 py-1.5 bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white text-xs font-medium rounded"
        >
          {status === 'submitting' ? <Loader2 className="w-3.5 h-3.5 animate-spin" /> : <Bell className="w-3.5 h-3.5" />}
          Criar alerta
        </button>
        <button
          type="button"
          onClick={() => setStatus('idle')}
          className="px-3 py-1.5 text-xs text-gray-600 hover:text-gray-900"
        >
          Cancelar
        </button>
      </div>
    </form>
  )
}
