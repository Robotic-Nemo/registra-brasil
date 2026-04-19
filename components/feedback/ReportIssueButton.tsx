'use client'

import { useState, useTransition } from 'react'
import { usePathname } from 'next/navigation'
import { MessageSquareWarning, X } from 'lucide-react'

const KINDS: Array<{ id: string; label: string }> = [
  { id: 'typo', label: 'Erro de digitação / tradução' },
  { id: 'broken_link', label: 'Link quebrado' },
  { id: 'wrong_info', label: 'Informação incorreta' },
  { id: 'accessibility', label: 'Problema de acessibilidade' },
  { id: 'other', label: 'Outro' },
]

export function ReportIssueButton() {
  const pathname = usePathname() || '/'
  const [open, setOpen] = useState(false)
  const [kind, setKind] = useState('typo')
  const [message, setMessage] = useState('')
  const [email, setEmail] = useState('')
  const [status, setStatus] = useState<null | { ok: boolean; text: string }>(null)
  const [pending, start] = useTransition()

  // Hide the button itself on admin pages — editors have their own tools.
  if (pathname.startsWith('/admin')) return null

  const submit = () => {
    setStatus(null)
    start(async () => {
      try {
        const r = await fetch('/api/report-issue', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ url: pathname, kind, message, email }),
        })
        if (r.ok) {
          setStatus({ ok: true, text: 'Obrigado! A equipe editorial foi notificada.' })
          setMessage('')
        } else {
          const j = await r.json().catch(() => ({}))
          setStatus({ ok: false, text: j?.error?.message ?? 'Falha ao enviar.' })
        }
      } catch {
        setStatus({ ok: false, text: 'Falha de rede.' })
      }
    })
  }

  return (
    <>
      <button
        type="button"
        onClick={() => setOpen(true)}
        className="fixed bottom-4 right-4 z-40 inline-flex items-center gap-1.5 rounded-full border border-gray-300 bg-white/95 px-3 py-1.5 text-xs font-medium text-gray-700 shadow-md backdrop-blur hover:border-indigo-400 hover:text-indigo-700 focus:outline-none focus-visible:ring-2 focus-visible:ring-indigo-500 dark:border-gray-700 dark:bg-gray-900/95 dark:text-gray-200 dark:hover:border-indigo-500"
        aria-label="Reportar problema nesta página"
      >
        <MessageSquareWarning className="h-3.5 w-3.5" aria-hidden />
        Reportar problema
      </button>

      {open && (
        <div
          role="dialog"
          aria-modal="true"
          aria-labelledby="report-issue-title"
          className="fixed inset-0 z-50 flex items-end justify-center bg-black/40 p-4 sm:items-center"
          onClick={(e) => e.target === e.currentTarget && setOpen(false)}
        >
          <div className="w-full max-w-md rounded-xl border border-gray-200 bg-white p-5 shadow-xl dark:border-gray-800 dark:bg-gray-900">
            <header className="mb-3 flex items-center justify-between">
              <h2
                id="report-issue-title"
                className="text-base font-semibold text-gray-900 dark:text-gray-100"
              >
                Reportar problema nesta página
              </h2>
              <button
                type="button"
                onClick={() => setOpen(false)}
                aria-label="Fechar"
                className="rounded p-1 text-gray-500 hover:bg-gray-100 dark:hover:bg-gray-800"
              >
                <X className="h-4 w-4" />
              </button>
            </header>

            <p className="mb-3 text-xs text-gray-600 dark:text-gray-400">
              URL: <code className="font-mono">{pathname}</code>
            </p>

            <label className="mb-3 block">
              <span className="mb-1 block text-xs font-medium text-gray-700 dark:text-gray-300">
                Tipo
              </span>
              <select
                value={kind}
                onChange={(e) => setKind(e.target.value)}
                className="w-full rounded border border-gray-300 bg-white px-2 py-1.5 text-sm dark:border-gray-700 dark:bg-gray-950 dark:text-gray-100"
              >
                {KINDS.map((k) => (
                  <option key={k.id} value={k.id}>{k.label}</option>
                ))}
              </select>
            </label>

            <label className="mb-3 block">
              <span className="mb-1 block text-xs font-medium text-gray-700 dark:text-gray-300">
                O que observou?
              </span>
              <textarea
                rows={4}
                maxLength={4000}
                value={message}
                onChange={(e) => setMessage(e.target.value)}
                placeholder="Ex.: a foto neste card parece ser de outro deputado."
                className="w-full rounded border border-gray-300 bg-white px-2 py-1.5 text-sm dark:border-gray-700 dark:bg-gray-950 dark:text-gray-100"
              />
              <span className="text-[10px] text-gray-500">{message.length}/4000</span>
            </label>

            <label className="mb-4 block">
              <span className="mb-1 block text-xs font-medium text-gray-700 dark:text-gray-300">
                Email (opcional)
              </span>
              <input
                type="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                placeholder="se quiser receber retorno"
                className="w-full rounded border border-gray-300 bg-white px-2 py-1.5 text-sm dark:border-gray-700 dark:bg-gray-950 dark:text-gray-100"
              />
            </label>

            <div className="flex items-center justify-between gap-2">
              <span className="text-xs">
                {status && (
                  <span className={status.ok ? 'text-emerald-700 dark:text-emerald-300' : 'text-rose-700 dark:text-rose-300'}>
                    {status.text}
                  </span>
                )}
              </span>
              <button
                type="button"
                onClick={submit}
                disabled={pending || message.trim().length < 4}
                className="rounded bg-indigo-600 px-4 py-1.5 text-sm font-semibold text-white hover:bg-indigo-700 disabled:opacity-50"
              >
                {pending ? 'Enviando…' : 'Enviar'}
              </button>
            </div>
          </div>
        </div>
      )}
    </>
  )
}
