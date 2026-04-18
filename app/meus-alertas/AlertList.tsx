'use client'

import Link from 'next/link'
import { useState, useTransition } from 'react'
import { Loader2, Trash2, ExternalLink } from 'lucide-react'
import { cancelAlert, cancelAllAlerts } from './actions'

interface Alert {
  id: string
  label: string
  description: string
  search_url: string
  active: boolean
  confirmed_at: string | null
  last_notified_at: string | null
  created_at: string
  unsubscribed_at: string | null
}

interface Props {
  email: string
  token: string
  alerts: Alert[]
}

export function AlertList({ email, token, alerts: initial }: Props) {
  const [alerts, setAlerts] = useState(initial)
  const [pending, start] = useTransition()
  const [err, setErr] = useState<string | null>(null)

  const active = alerts.filter((a) => a.active)
  const inactive = alerts.filter((a) => !a.active)

  function doCancel(id: string) {
    setErr(null)
    start(async () => {
      const res = await cancelAlert(email, token, id)
      if (!res.success) { setErr(res.error ?? 'Erro'); return }
      setAlerts((list) => list.map((a) =>
        a.id === id
          ? { ...a, active: false, unsubscribed_at: new Date().toISOString() }
          : a,
      ))
    })
  }

  function doCancelAll() {
    if (!confirm(`Cancelar TODOS os ${active.length} alertas? Não é possível desfazer.`)) return
    setErr(null)
    start(async () => {
      const res = await cancelAllAlerts(email, token)
      if (!res.success) { setErr(res.error ?? 'Erro'); return }
      setAlerts((list) => list.map((a) => a.active
        ? { ...a, active: false, unsubscribed_at: new Date().toISOString() }
        : a,
      ))
    })
  }

  if (alerts.length === 0) {
    return (
      <p className="text-sm text-gray-600 bg-gray-50 border border-gray-200 rounded-lg p-4">
        Você não tem alertas cadastrados com este e-mail. Para criar um,{' '}
        <Link href="/buscar" className="underline">faça uma busca</Link> e clique em
        &ldquo;Receber novos resultados por e-mail&rdquo;.
      </p>
    )
  }

  return (
    <>
      {err && <div className="bg-red-50 border border-red-200 rounded p-2 text-xs text-red-900 mb-3" role="alert">{err}</div>}

      <section className="mb-8">
        <div className="flex items-center justify-between mb-3">
          <h2 className="text-sm font-semibold text-gray-900">
            Alertas ativos <span className="text-xs text-gray-500 font-normal">({active.length})</span>
          </h2>
          {active.length > 1 && (
            <button
              type="button"
              onClick={doCancelAll}
              disabled={pending}
              className="text-xs text-red-700 hover:text-red-900 hover:underline disabled:opacity-60"
            >
              Cancelar todos
            </button>
          )}
        </div>
        {active.length === 0 ? (
          <p className="text-sm text-gray-500">Nenhum alerta ativo.</p>
        ) : (
          <ul className="flex flex-col gap-2">
            {active.map((a) => (
              <li key={a.id} className="bg-white border border-gray-200 rounded-lg p-4 text-sm">
                <div className="flex items-start justify-between gap-3">
                  <div className="flex-1 min-w-0">
                    <p className="font-semibold text-gray-900 mb-1 truncate">{a.label}</p>
                    <p className="text-xs text-gray-600 mb-2">{a.description}</p>
                    <p className="text-[11px] text-gray-500">
                      Criado em {new Date(a.created_at).toLocaleDateString('pt-BR')}
                      {a.last_notified_at && (
                        <> · última notificação: {new Date(a.last_notified_at).toLocaleDateString('pt-BR')}</>
                      )}
                    </p>
                  </div>
                  <div className="flex flex-col items-end gap-1 flex-shrink-0">
                    <Link
                      href={a.search_url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="inline-flex items-center gap-1 text-xs text-blue-700 hover:underline"
                    >
                      <ExternalLink className="w-3 h-3" aria-hidden="true" /> Abrir busca
                    </Link>
                    <button
                      type="button"
                      onClick={() => doCancel(a.id)}
                      disabled={pending}
                      className="inline-flex items-center gap-1 text-xs text-red-700 hover:text-red-900 hover:underline disabled:opacity-60"
                    >
                      {pending ? <Loader2 className="w-3 h-3 animate-spin" aria-hidden="true" /> : <Trash2 className="w-3 h-3" aria-hidden="true" />}
                      Cancelar
                    </button>
                  </div>
                </div>
              </li>
            ))}
          </ul>
        )}
      </section>

      {inactive.length > 0 && (
        <details>
          <summary className="text-sm font-semibold text-gray-600 cursor-pointer mb-2">
            Cancelados ({inactive.length})
          </summary>
          <ul className="flex flex-col gap-2 mt-2">
            {inactive.map((a) => (
              <li key={a.id} className="bg-gray-50 border border-gray-200 rounded p-3 text-xs text-gray-600">
                <p className="font-medium text-gray-700">{a.label}</p>
                <p className="text-gray-500">{a.description}</p>
                {a.unsubscribed_at && (
                  <p className="text-[11px] text-gray-500 mt-1">
                    Cancelado em {new Date(a.unsubscribed_at).toLocaleDateString('pt-BR')}
                  </p>
                )}
              </li>
            ))}
          </ul>
        </details>
      )}
    </>
  )
}
