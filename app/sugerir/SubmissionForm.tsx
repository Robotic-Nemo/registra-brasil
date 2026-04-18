'use client'

import { FormEvent, useEffect, useRef, useState, useId } from 'react'
import { CheckCircle2, AlertCircle, Loader2, AlertTriangle } from 'lucide-react'

interface Politician {
  slug: string
  common_name: string
  party: string
  state: string | null
}

interface Props {
  politicians: Politician[]
}

type SubmitState = 'idle' | 'submitting' | 'ok' | 'error'

interface SimilarMatch {
  id: string
  slug: string | null
  summary: string
  date: string
  similarity: number
}

export function SubmissionForm({ politicians }: Props) {
  const [state, setState] = useState<SubmitState>('idle')
  const [message, setMessage] = useState<string>('')
  const [useOther, setUseOther] = useState(false)
  const [summaryText, setSummaryText] = useState('')
  const [politicianSlug, setPoliticianSlug] = useState('')
  const [similar, setSimilar] = useState<SimilarMatch[]>([])
  const similarAbort = useRef<AbortController | null>(null)

  // Debounced live similarity check — cuts duplicate submissions at source.
  useEffect(() => {
    if (useOther) { setSimilar([]); return }
    const q = summaryText.trim()
    if (q.length < 15) { setSimilar([]); return }

    const handle = window.setTimeout(() => {
      similarAbort.current?.abort()
      const ctrl = new AbortController()
      similarAbort.current = ctrl
      fetch('/api/submissions/similar', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ summary: q, politician_slug: politicianSlug || undefined }),
        signal: ctrl.signal,
      })
        .then((r) => r.ok ? r.json() : { matches: [] })
        .then((j) => { setSimilar(j.matches ?? []) })
        .catch(() => {})
    }, 500)

    return () => window.clearTimeout(handle)
  }, [summaryText, politicianSlug, useOther])
  const polIds = useId()
  const summaryId = useId()
  const quoteId = useId()
  const dateId = useId()
  const sourceId = useId()
  const venueId = useId()
  const nameRawId = useId()
  const emailId = useId()
  const submitterId = useId()
  const notesId = useId()
  const hpId = useId()

  async function onSubmit(e: FormEvent<HTMLFormElement>) {
    e.preventDefault()
    if (state === 'submitting') return
    setState('submitting')
    setMessage('')

    const form = new FormData(e.currentTarget)
    const payload = {
      politician_slug: useOther ? undefined : (form.get('politician_slug') as string) || undefined,
      politician_name_raw: useOther ? ((form.get('politician_name_raw') as string) || undefined) : undefined,
      summary: form.get('summary') as string,
      full_quote: (form.get('full_quote') as string) || undefined,
      statement_date: (form.get('statement_date') as string) || undefined,
      venue: (form.get('venue') as string) || undefined,
      primary_source_url: form.get('primary_source_url') as string,
      context: (form.get('context') as string) || undefined,
      submitter_email: (form.get('submitter_email') as string) || undefined,
      submitter_name: (form.get('submitter_name') as string) || undefined,
      submitter_notes: (form.get('submitter_notes') as string) || undefined,
      website: form.get('website') as string, // honeypot
    }

    try {
      const res = await fetch('/api/submissions', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload),
      })
      const json = await res.json()
      if (!res.ok || !json.success) {
        setState('error')
        setMessage(json?.error?.message ?? 'Erro ao enviar. Tente novamente.')
      } else {
        setState('ok')
        setMessage(json.message ?? 'Submissão recebida — obrigado!')
        e.currentTarget.reset()
      }
    } catch {
      setState('error')
      setMessage('Falha de rede. Tente novamente em alguns instantes.')
    }
  }

  if (state === 'ok') {
    return (
      <div className="bg-green-50 border border-green-200 rounded-lg p-6 flex gap-3" role="status">
        <CheckCircle2 className="w-6 h-6 text-green-600 flex-shrink-0 mt-0.5" aria-hidden="true" />
        <div>
          <h2 className="font-semibold text-green-900 mb-1">Recebido</h2>
          <p className="text-sm text-green-900">{message}</p>
          <button
            type="button"
            onClick={() => setState('idle')}
            className="mt-4 text-sm underline text-green-800 hover:text-green-900"
          >
            Enviar outra
          </button>
        </div>
      </div>
    )
  }

  const inputCls =
    'w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500 focus-visible:border-transparent'
  const labelCls = 'block text-sm font-medium text-gray-700 mb-1'

  return (
    <form onSubmit={onSubmit} className="space-y-5" noValidate>
      {state === 'error' && (
        <div className="bg-red-50 border border-red-200 rounded-lg p-3 flex gap-2 text-sm text-red-900" role="alert">
          <AlertCircle className="w-5 h-5 flex-shrink-0 mt-0.5" aria-hidden="true" />
          <span>{message}</span>
        </div>
      )}

      {/* Honeypot field: visually hidden, bots fill it. */}
      <div className="sr-only" aria-hidden="true">
        <label htmlFor={hpId}>Website</label>
        <input id={hpId} name="website" type="text" tabIndex={-1} autoComplete="off" />
      </div>

      <fieldset className="space-y-3">
        <legend className="text-sm font-semibold text-gray-900 mb-1">Quem disse</legend>
        {!useOther ? (
          <>
            <label htmlFor={polIds} className={labelCls}>Político *</label>
            <select
              id={polIds}
              name="politician_slug"
              required={!useOther}
              className={inputCls}
              value={politicianSlug}
              onChange={(e) => setPoliticianSlug(e.target.value)}
            >
              <option value="" disabled>Selecione…</option>
              {politicians.map((p) => (
                <option key={p.slug} value={p.slug}>
                  {p.common_name} ({p.party}{p.state ? `/${p.state}` : ''})
                </option>
              ))}
            </select>
            <button
              type="button"
              onClick={() => setUseOther(true)}
              className="text-xs text-blue-700 underline"
            >
              Não está na lista?
            </button>
          </>
        ) : (
          <>
            <label htmlFor={nameRawId} className={labelCls}>Nome do político *</label>
            <input
              id={nameRawId}
              name="politician_name_raw"
              type="text"
              required={useOther}
              maxLength={200}
              className={inputCls}
              placeholder="Nome completo como aparece na fonte"
            />
            <button
              type="button"
              onClick={() => setUseOther(false)}
              className="text-xs text-blue-700 underline"
            >
              Voltar à lista
            </button>
          </>
        )}
      </fieldset>

      <fieldset className="space-y-3">
        <legend className="text-sm font-semibold text-gray-900 mb-1">O que foi dito</legend>
        <div>
          <label htmlFor={summaryId} className={labelCls}>Resumo (1–2 frases) *</label>
          <textarea
            id={summaryId}
            name="summary"
            required
            minLength={10}
            maxLength={1000}
            rows={3}
            className={inputCls}
            placeholder="Ex.: Defendeu o fim do voto secreto no Congresso durante debate televisivo."
            value={summaryText}
            onChange={(e) => setSummaryText(e.target.value)}
          />
          {similar.length > 0 && (
            <div className="mt-2 rounded-lg border border-amber-200 bg-amber-50 p-3 text-xs text-amber-900">
              <p className="font-semibold flex items-center gap-1.5 mb-1">
                <AlertTriangle className="w-3.5 h-3.5" aria-hidden="true" />
                Possíveis declarações similares já no arquivo
              </p>
              <ul className="space-y-1">
                {similar.map((m) => (
                  <li key={m.id}>
                    <a
                      href={`/declaracao/${m.slug ?? m.id}`}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="underline hover:text-amber-950"
                    >
                      [{(m.similarity * 100).toFixed(0)}%] {m.summary.slice(0, 120)}{m.summary.length > 120 ? '…' : ''}
                    </a>
                    <span className="text-amber-700"> · {m.date}</span>
                  </li>
                ))}
              </ul>
              <p className="mt-1 text-amber-700">
                Se for a mesma declaração, não precisa reenviar — obrigado por conferir.
              </p>
            </div>
          )}
        </div>
        <div>
          <label htmlFor={quoteId} className={labelCls}>Citação literal (opcional)</label>
          <textarea
            id={quoteId}
            name="full_quote"
            maxLength={5000}
            rows={3}
            className={inputCls}
            placeholder="Transcrição exata entre aspas, se disponível."
          />
        </div>
      </fieldset>

      <fieldset className="space-y-3">
        <legend className="text-sm font-semibold text-gray-900 mb-1">Quando e onde</legend>
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
          <div>
            <label htmlFor={dateId} className={labelCls}>Data</label>
            <input id={dateId} name="statement_date" type="date" className={inputCls} />
          </div>
          <div>
            <label htmlFor={venueId} className={labelCls}>Contexto / veículo</label>
            <input
              id={venueId}
              name="venue"
              type="text"
              maxLength={300}
              className={inputCls}
              placeholder="Ex.: Plenário da Câmara, entrevista à TV X"
            />
          </div>
        </div>
      </fieldset>

      <fieldset className="space-y-3">
        <legend className="text-sm font-semibold text-gray-900 mb-1">Fonte primária</legend>
        <div>
          <label htmlFor={sourceId} className={labelCls}>URL da fonte *</label>
          <input
            id={sourceId}
            name="primary_source_url"
            type="url"
            required
            maxLength={2048}
            inputMode="url"
            className={inputCls}
            placeholder="https://…"
          />
          <p className="text-xs text-gray-500 mt-1">
            Vídeo oficial, transmissão arquivada, diário oficial ou reportagem com citação direta.
          </p>
        </div>
      </fieldset>

      <fieldset className="space-y-3">
        <legend className="text-sm font-semibold text-gray-900 mb-1">Sobre você (opcional)</legend>
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
          <div>
            <label htmlFor={submitterId} className={labelCls}>Seu nome</label>
            <input id={submitterId} name="submitter_name" type="text" maxLength={200} className={inputCls} autoComplete="name" />
          </div>
          <div>
            <label htmlFor={emailId} className={labelCls}>E-mail de contato</label>
            <input id={emailId} name="submitter_email" type="email" maxLength={320} className={inputCls} autoComplete="email" />
          </div>
        </div>
        <div>
          <label htmlFor={notesId} className={labelCls}>Observações</label>
          <textarea id={notesId} name="submitter_notes" maxLength={2000} rows={2} className={inputCls} />
        </div>
      </fieldset>

      <button
        type="submit"
        disabled={state === 'submitting'}
        className="inline-flex items-center gap-2 px-5 py-2.5 bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white text-sm font-medium rounded-lg transition-colors focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-1 focus-visible:ring-blue-500"
      >
        {state === 'submitting' ? (
          <>
            <Loader2 className="w-4 h-4 animate-spin" aria-hidden="true" />
            Enviando…
          </>
        ) : (
          'Enviar para revisão'
        )}
      </button>
    </form>
  )
}
