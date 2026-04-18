'use client'

import { FormEvent, useId, useState } from 'react'
import { Bell, Loader2, CheckCircle2, X, AlertCircle } from 'lucide-react'

type Scope =
  | { kind: 'politico'; slug: string; label: string }
  | { kind: 'partido'; value: string; label: string }
  | { kind: 'estado'; value: string; label: string }
  | { kind: 'categoria'; slug: string; label: string }

interface Props {
  scope: Scope
  /** Optional compact variant — icon-only button that opens modal on click. */
  compact?: boolean
}

type Phase = 'idle' | 'open' | 'submitting' | 'ok' | 'error'

/**
 * One-click "seguir" button: pre-builds a saved-search query from the
 * scope type and hands it to /api/alerts/subscribe. Same double-opt-in
 * flow as the manual AlertSubscribe widget in /buscar — but three-tap
 * rather than ten-tap because the filter set is known a priori.
 */
export function FollowButton({ scope, compact }: Props) {
  const [phase, setPhase] = useState<Phase>('idle')
  const [msg, setMsg] = useState('')
  const emailId = useId()

  const defaultLabel =
    scope.kind === 'politico' ? `Declarações de ${scope.label}` :
    scope.kind === 'partido' ? `Declarações de ${scope.label}` :
    scope.kind === 'estado' ? `Declarações em ${scope.label}` :
    `Categoria: ${scope.label}`

  async function onSubmit(e: FormEvent<HTMLFormElement>) {
    e.preventDefault()
    setPhase('submitting')
    const form = new FormData(e.currentTarget)

    const query: Record<string, unknown> = {}
    if (scope.kind === 'politico') query.politico = scope.slug
    if (scope.kind === 'partido') query.partido = scope.value
    if (scope.kind === 'estado') query.estado = scope.value
    if (scope.kind === 'categoria') query.categoria = [scope.slug]

    try {
      const res = await fetch('/api/alerts/subscribe', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          email: form.get('email'),
          label: defaultLabel,
          query,
        }),
      })
      const j = await res.json()
      if (!res.ok || !j.success) {
        setPhase('error')
        setMsg(j?.error?.message ?? 'Não foi possível criar.')
      } else {
        setPhase('ok')
        setMsg(j.message ?? 'Verifique seu e-mail para confirmar.')
      }
    } catch {
      setPhase('error')
      setMsg('Falha de rede.')
    }
  }

  if (phase === 'ok') {
    return (
      <div className="inline-flex items-center gap-1.5 px-3 py-1.5 bg-green-50 border border-green-200 text-green-900 text-xs rounded-full" role="status">
        <CheckCircle2 className="w-3.5 h-3.5" aria-hidden="true" />
        <span>{msg}</span>
      </div>
    )
  }

  if (phase === 'idle') {
    return (
      <button
        type="button"
        onClick={() => setPhase('open')}
        className={`inline-flex items-center gap-1.5 text-xs rounded-full border border-blue-200 bg-blue-50 text-blue-800 hover:bg-blue-100 transition-colors ${
          compact ? 'p-1.5' : 'px-3 py-1.5'
        }`}
        aria-label={`Seguir ${scope.label} por e-mail`}
      >
        <Bell className="w-3.5 h-3.5" aria-hidden="true" />
        {!compact && <span>Seguir por e-mail</span>}
      </button>
    )
  }

  return (
    <form onSubmit={onSubmit} className="bg-white border border-blue-200 rounded-lg p-3 space-y-2 max-w-sm text-xs">
      <div className="flex items-center justify-between gap-2">
        <div className="flex items-center gap-1.5 font-semibold text-gray-900 text-sm">
          <Bell className="w-3.5 h-3.5 text-blue-700" aria-hidden="true" />
          Seguir: {scope.label}
        </div>
        <button
          type="button"
          onClick={() => setPhase('idle')}
          className="text-gray-400 hover:text-gray-600 p-1 -m-1"
          aria-label="Fechar"
        >
          <X className="w-3.5 h-3.5" aria-hidden="true" />
        </button>
      </div>
      <p className="text-gray-600">
        Receberá e-mail quando novas declarações forem adicionadas que correspondam a esta
        seleção. Dupla confirmação por link.
      </p>
      <div>
        <label htmlFor={emailId} className="block font-medium text-gray-700 mb-1">Seu e-mail</label>
        <input
          id={emailId}
          name="email"
          type="email"
          required
          autoComplete="email"
          className="w-full px-2 py-1.5 border border-gray-300 rounded text-xs focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
        />
      </div>
      {phase === 'error' && (
        <p className="text-red-700 flex gap-1 items-center" role="alert">
          <AlertCircle className="w-3 h-3" aria-hidden="true" /> {msg}
        </p>
      )}
      <button
        type="submit"
        disabled={phase === 'submitting'}
        className="inline-flex items-center gap-1 px-3 py-1.5 bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white rounded font-medium"
      >
        {phase === 'submitting' ? <Loader2 className="w-3 h-3 animate-spin" /> : <Bell className="w-3 h-3" />}
        Criar alerta
      </button>
    </form>
  )
}
