'use client'

import { FormEvent, useState } from 'react'
import { Loader2, CheckCircle2, AlertCircle } from 'lucide-react'

export function RequestAccessForm({ defaultEmail }: { defaultEmail?: string }) {
  const [state, setState] = useState<'idle' | 'submitting' | 'ok' | 'error'>('idle')
  const [msg, setMsg] = useState<string>('')

  async function onSubmit(e: FormEvent<HTMLFormElement>) {
    e.preventDefault()
    setState('submitting')
    const form = new FormData(e.currentTarget)
    try {
      const res = await fetch('/api/alerts/request-access', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email: form.get('email') }),
      })
      const j = await res.json()
      if (!res.ok || !j.success) {
        setState('error')
        setMsg(j?.error?.message ?? 'Tente novamente.')
      } else {
        setState('ok')
        setMsg(j.message ?? 'Verifique seu e-mail.')
      }
    } catch {
      setState('error')
      setMsg('Falha de rede.')
    }
  }

  if (state === 'ok') {
    return (
      <div className="bg-green-50 border border-green-200 rounded-lg p-4 flex gap-2 text-sm text-green-900" role="status">
        <CheckCircle2 className="w-5 h-5 flex-shrink-0 mt-0.5" aria-hidden="true" />
        <span>{msg}</span>
      </div>
    )
  }

  return (
    <form onSubmit={onSubmit} className="bg-white border border-gray-200 rounded-lg p-5 space-y-3 max-w-md">
      <label htmlFor="access-email" className="block text-sm font-medium text-gray-700">
        E-mail dos seus alertas
      </label>
      <input
        id="access-email"
        name="email"
        type="email"
        required
        defaultValue={defaultEmail}
        autoComplete="email"
        className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
      />
      {state === 'error' && (
        <p className="text-xs text-red-700 flex gap-1.5 items-center" role="alert">
          <AlertCircle className="w-3.5 h-3.5" aria-hidden="true" />
          {msg}
        </p>
      )}
      <button
        type="submit"
        disabled={state === 'submitting'}
        className="inline-flex items-center gap-2 px-4 py-2 bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white text-sm font-medium rounded-lg"
      >
        {state === 'submitting' ? <Loader2 className="w-4 h-4 animate-spin" aria-hidden="true" /> : null}
        Enviar link de acesso
      </button>
      <p className="text-xs text-gray-500">
        Resposta genérica: o e-mail só é enviado se houver alertas cadastrados para este endereço.
      </p>
    </form>
  )
}
