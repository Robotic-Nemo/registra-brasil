'use client'

import { FormEvent, useId, useState } from 'react'
import { CheckCircle2, AlertCircle, Loader2 } from 'lucide-react'

interface Politician {
  slug: string
  common_name: string
  party: string
  state: string | null
}

interface Props {
  initialStatement: { id: string; slug: string | null; summary: string } | null
  politicians: Politician[]
}

type Phase = 'idle' | 'submitting' | 'ok' | 'error'

const KINDS = [
  { value: 'correction', label: 'Correção factual (ajuste editorial)' },
  { value: 'retraction', label: 'Retratação completa (remoção)' },
  { value: 'right_of_reply', label: 'Direito de resposta (publicar réplica)' },
  { value: 'clarification', label: 'Esclarecimento (nota adicional)' },
  { value: 'takedown_privacy', label: 'Privacidade / dados pessoais / menores' },
]

export function RetractionForm({ initialStatement, politicians }: Props) {
  const [phase, setPhase] = useState<Phase>('idle')
  const [msg, setMsg] = useState('')
  const [useUrl, setUseUrl] = useState(!initialStatement)

  const idStmt = useId()
  const idUrl = useId()
  const idKind = useId()
  const idName = useId()
  const idEmail = useId()
  const idRole = useId()
  const idRep = useId()
  const idClaim = useId()
  const idRemedy = useId()
  const idEvidence = useId()
  const idHp = useId()

  async function onSubmit(e: FormEvent<HTMLFormElement>) {
    e.preventDefault()
    if (phase === 'submitting') return
    setPhase('submitting')
    setMsg('')
    const form = new FormData(e.currentTarget)

    const payload: Record<string, unknown> = {
      kind: form.get('kind'),
      petitioner_name: form.get('petitioner_name'),
      petitioner_email: form.get('petitioner_email'),
      petitioner_role: form.get('petitioner_role') || undefined,
      represents_politician_slug: form.get('represents_politician_slug') || undefined,
      claim: form.get('claim'),
      desired_remedy: form.get('desired_remedy') || undefined,
      evidence_urls: form.get('evidence_urls') || undefined,
      website: form.get('website'), // honeypot
    }
    if (useUrl) payload.statement_url = form.get('statement_url')
    else payload.statement_id = initialStatement?.id ?? form.get('statement_id')

    try {
      const res = await fetch('/api/retratacoes', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload),
      })
      const json = await res.json()
      if (!res.ok || !json.success) {
        setPhase('error')
        setMsg(json?.error?.message ?? 'Não foi possível registrar a petição.')
      } else {
        setPhase('ok')
        setMsg(json.message ?? 'Recebida.')
        e.currentTarget.reset()
      }
    } catch {
      setPhase('error')
      setMsg('Falha de rede.')
    }
  }

  if (phase === 'ok') {
    return (
      <div className="bg-green-50 border border-green-200 rounded-lg p-6 flex gap-3" role="status">
        <CheckCircle2 className="w-6 h-6 text-green-700 flex-shrink-0 mt-0.5" aria-hidden="true" />
        <div>
          <h2 className="font-semibold text-green-900 mb-1">Petição recebida</h2>
          <p className="text-sm text-green-900">{msg}</p>
          <button type="button" onClick={() => setPhase('idle')} className="mt-3 text-sm underline text-green-800">
            Enviar outra
          </button>
        </div>
      </div>
    )
  }

  const inputCls = 'w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500 focus-visible:border-transparent'
  const labelCls = 'block text-sm font-medium text-gray-700 mb-1'

  return (
    <form onSubmit={onSubmit} className="space-y-5" noValidate>
      {phase === 'error' && (
        <div className="bg-red-50 border border-red-200 rounded-lg p-3 flex gap-2 text-sm text-red-900" role="alert">
          <AlertCircle className="w-5 h-5 flex-shrink-0 mt-0.5" aria-hidden="true" />
          <span>{msg}</span>
        </div>
      )}

      <div className="sr-only" aria-hidden="true">
        <label htmlFor={idHp}>Website</label>
        <input id={idHp} name="website" type="text" tabIndex={-1} autoComplete="off" />
      </div>

      <fieldset className="space-y-3">
        <legend className="text-sm font-semibold text-gray-900 mb-1">Declaração sobre a qual você pede retificação</legend>
        {initialStatement && !useUrl ? (
          <div className="bg-gray-50 border border-gray-200 rounded p-3 text-sm">
            <p className="text-xs text-gray-500 mb-1">Alvo:</p>
            <p className="text-gray-900">{initialStatement.summary}</p>
            <input type="hidden" name="statement_id" value={initialStatement.id} />
            <button type="button" onClick={() => setUseUrl(true)} className="text-xs text-blue-700 underline mt-2">
              Trocar por URL externa
            </button>
          </div>
        ) : !useUrl ? (
          <div>
            <label htmlFor={idStmt} className={labelCls}>ID da declaração (UUID)</label>
            <input id={idStmt} name="statement_id" type="text" className={inputCls} placeholder="ex.: 3f4a…-…-…" />
            <button type="button" onClick={() => setUseUrl(true)} className="text-xs text-blue-700 underline mt-1">
              Não sei o ID — usar URL
            </button>
          </div>
        ) : (
          <div>
            <label htmlFor={idUrl} className={labelCls}>URL da página da declaração</label>
            <input id={idUrl} name="statement_url" type="url" required className={inputCls} placeholder="https://registrabrasil.com.br/declaracao/…" />
            {initialStatement && (
              <button type="button" onClick={() => setUseUrl(false)} className="text-xs text-blue-700 underline mt-1">
                Voltar à declaração selecionada
              </button>
            )}
          </div>
        )}
      </fieldset>

      <fieldset className="space-y-3">
        <legend className="text-sm font-semibold text-gray-900 mb-1">Tipo de pedido</legend>
        <label htmlFor={idKind} className={labelCls}>Natureza *</label>
        <select id={idKind} name="kind" required className={inputCls} defaultValue="">
          <option value="" disabled>Selecione…</option>
          {KINDS.map((k) => (
            <option key={k.value} value={k.value}>{k.label}</option>
          ))}
        </select>
      </fieldset>

      <fieldset className="space-y-3">
        <legend className="text-sm font-semibold text-gray-900 mb-1">Identificação</legend>
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
          <div>
            <label htmlFor={idName} className={labelCls}>Seu nome *</label>
            <input id={idName} name="petitioner_name" type="text" required minLength={2} maxLength={200} className={inputCls} autoComplete="name" />
          </div>
          <div>
            <label htmlFor={idEmail} className={labelCls}>E-mail de contato *</label>
            <input id={idEmail} name="petitioner_email" type="email" required maxLength={320} className={inputCls} autoComplete="email" />
          </div>
        </div>
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
          <div>
            <label htmlFor={idRole} className={labelCls}>Qualidade em que age</label>
            <input id={idRole} name="petitioner_role" type="text" maxLength={200} className={inputCls} placeholder="próprio citado, advogado(a), assessoria…" />
          </div>
          <div>
            <label htmlFor={idRep} className={labelCls}>Representa (se aplicável)</label>
            <select id={idRep} name="represents_politician_slug" className={inputCls} defaultValue="">
              <option value="">—</option>
              {politicians.map((p) => (
                <option key={p.slug} value={p.slug}>
                  {p.common_name} ({p.party}{p.state ? `/${p.state}` : ''})
                </option>
              ))}
            </select>
          </div>
        </div>
      </fieldset>

      <fieldset className="space-y-3">
        <legend className="text-sm font-semibold text-gray-900 mb-1">Conteúdo</legend>
        <div>
          <label htmlFor={idClaim} className={labelCls}>Descreva o que está incorreto ou contestado *</label>
          <textarea id={idClaim} name="claim" required minLength={20} maxLength={5000} rows={5} className={inputCls}
            placeholder="Seja específico: qual trecho, por quê é impreciso, quais fatos foram representados errado…" />
        </div>
        <div>
          <label htmlFor={idRemedy} className={labelCls}>Remédio pretendido (opcional)</label>
          <textarea id={idRemedy} name="desired_remedy" maxLength={5000} rows={4} className={inputCls}
            placeholder="Texto sugerido para correção, réplica proposta, ou explicação a publicar." />
        </div>
        <div>
          <label htmlFor={idEvidence} className={labelCls}>URLs de evidência</label>
          <textarea id={idEvidence} name="evidence_urls" maxLength={3000} rows={2} className={inputCls}
            placeholder="Uma URL por linha (vídeo original, ato oficial, reportagem que contradiga…)" />
        </div>
      </fieldset>

      <button
        type="submit"
        disabled={phase === 'submitting'}
        className="inline-flex items-center gap-2 px-5 py-2.5 bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white text-sm font-medium rounded-lg transition-colors focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-1 focus-visible:ring-blue-500"
      >
        {phase === 'submitting' ? (<><Loader2 className="w-4 h-4 animate-spin" aria-hidden="true" /> Enviando…</>) : 'Enviar petição'}
      </button>
    </form>
  )
}
