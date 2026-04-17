'use client'

import { useState, useTransition } from 'react'
import { updateStatement } from './actions'
import Link from 'next/link'
import { ArrowLeft, Save, Loader2 } from 'lucide-react'

interface Props {
  statement: {
    id: string
    slug: string | null
    summary: string
    full_quote: string
    context: string
    statement_date: string
    statement_date_approx: boolean
    primary_source_url: string
    primary_source_type: string
    youtube_timestamp_sec: number | null
    transcript_excerpt: string
    venue: string
    event_name: string
    editor_notes: string
    politician_slug: string
    severity_score: number | null
  }
  selectedCategories: string[]
  allCategories: { slug: string; label_pt: string }[]
  allPoliticians: { slug: string; common_name: string }[]
}

const SOURCE_TYPES = [
  { value: 'youtube_video', label: 'Vídeo YouTube' },
  { value: 'youtube_live_archive', label: 'Transmissão YouTube' },
  { value: 'camara_tv', label: 'TV Câmara' },
  { value: 'senado_tv', label: 'TV Senado' },
  { value: 'diario_oficial', label: 'Diário Oficial' },
  { value: 'transcript_pdf', label: 'Transcrição PDF' },
  { value: 'news_article', label: 'Artigo de notícia' },
  { value: 'social_media_post', label: 'Post em rede social' },
  { value: 'other', label: 'Outro' },
]

export function EditStatementForm({ statement, selectedCategories, allCategories, allPoliticians }: Props) {
  const [isPending, startTransition] = useTransition()
  const [result, setResult] = useState<{ ok: boolean; message: string } | null>(null)

  function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault()
    setResult(null)
    const form = e.currentTarget
    const formData = new FormData(form)

    startTransition(async () => {
      const res = await updateStatement(statement.id, formData)
      setResult(res)
    })
  }

  const inputClass = 'w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500'
  const labelClass = 'block text-sm font-medium text-gray-700 mb-1'

  return (
    <form onSubmit={handleSubmit} className="space-y-6">
      <Link href="/admin" className="inline-flex items-center gap-1 text-sm text-gray-500 hover:text-gray-700">
        <ArrowLeft className="w-4 h-4" />
        Voltar ao painel
      </Link>

      {result && (
        <div className={`p-3 rounded-lg text-sm ${result.ok ? 'bg-green-50 text-green-800' : 'bg-red-50 text-red-800'}`}>
          {result.message}
        </div>
      )}

      {/* Politician (display only) */}
      <div>
        <label className={labelClass}>Político</label>
        <p className="text-sm text-gray-600">
          {allPoliticians.find((p) => p.slug === statement.politician_slug)?.common_name ?? statement.politician_slug}
        </p>
      </div>

      <div>
        <label htmlFor="summary" className={labelClass}>Resumo *</label>
        <textarea id="summary" name="summary" rows={3} className={inputClass} defaultValue={statement.summary} required minLength={10} maxLength={500} />
      </div>

      <div>
        <label htmlFor="full_quote" className={labelClass}>Citação completa</label>
        <textarea id="full_quote" name="full_quote" rows={4} className={inputClass} defaultValue={statement.full_quote} maxLength={5000} />
      </div>

      <div>
        <label htmlFor="context" className={labelClass}>Contexto</label>
        <textarea id="context" name="context" rows={3} className={inputClass} defaultValue={statement.context} maxLength={2000} />
      </div>

      <div className="grid grid-cols-2 gap-4">
        <div>
          <label htmlFor="statement_date" className={labelClass}>Data *</label>
          <input id="statement_date" name="statement_date" type="date" className={inputClass} defaultValue={statement.statement_date} required />
        </div>
        <div className="flex items-end gap-2 pb-2">
          <input id="statement_date_approx" name="statement_date_approx" type="checkbox" defaultChecked={statement.statement_date_approx} />
          <label htmlFor="statement_date_approx" className="text-sm text-gray-600">Data aproximada</label>
        </div>
      </div>

      <div className="grid grid-cols-2 gap-4">
        <div>
          <label htmlFor="primary_source_url" className={labelClass}>URL da fonte *</label>
          <input id="primary_source_url" name="primary_source_url" type="url" className={inputClass} defaultValue={statement.primary_source_url} required />
        </div>
        <div>
          <label htmlFor="primary_source_type" className={labelClass}>Tipo da fonte *</label>
          <select id="primary_source_type" name="primary_source_type" className={inputClass} defaultValue={statement.primary_source_type}>
            {SOURCE_TYPES.map((t) => (
              <option key={t.value} value={t.value}>{t.label}</option>
            ))}
          </select>
        </div>
      </div>

      <div className="grid grid-cols-2 gap-4">
        <div>
          <label htmlFor="youtube_timestamp_sec" className={labelClass}>Timestamp (segundos)</label>
          <input id="youtube_timestamp_sec" name="youtube_timestamp_sec" type="number" className={inputClass} defaultValue={statement.youtube_timestamp_sec ?? ''} min={0} max={86400} />
        </div>
        <div>
          <label htmlFor="venue" className={labelClass}>Local</label>
          <input id="venue" name="venue" type="text" className={inputClass} defaultValue={statement.venue} />
        </div>
      </div>

      <div>
        <label htmlFor="event_name" className={labelClass}>Nome do evento</label>
        <input id="event_name" name="event_name" type="text" className={inputClass} defaultValue={statement.event_name} />
      </div>

      <div>
        <label htmlFor="transcript_excerpt" className={labelClass}>Trecho da transcrição</label>
        <textarea id="transcript_excerpt" name="transcript_excerpt" rows={3} className={inputClass} defaultValue={statement.transcript_excerpt} />
      </div>

      <div>
        <label htmlFor="editor_notes" className={labelClass}>Notas editoriais</label>
        <textarea id="editor_notes" name="editor_notes" rows={2} className={inputClass} defaultValue={statement.editor_notes} maxLength={2000} />
      </div>

      <div>
        <label htmlFor="severity_score" className={labelClass}>Gravidade</label>
        <select
          id="severity_score"
          name="severity_score"
          className={inputClass}
          defaultValue={statement.severity_score ?? 'auto'}
        >
          <option value="auto">Automática (usa severidade da categoria principal)</option>
          <option value="1">1 — Baixa</option>
          <option value="2">2 — Moderada</option>
          <option value="3">3 — Elevada</option>
          <option value="4">4 — Alta</option>
          <option value="5">5 — Crítica</option>
        </select>
        <p className="text-xs text-gray-500 mt-1">
          Override editorial. Deixe em <em>Automática</em> para herdar a gravidade da categoria principal.
        </p>
      </div>

      <fieldset>
        <legend className={labelClass}>Categorias</legend>
        <div className="grid grid-cols-2 sm:grid-cols-3 gap-2">
          {allCategories.map((cat) => (
            <label key={cat.slug} className="flex items-center gap-2 text-sm">
              <input
                type="checkbox"
                name="categories"
                value={cat.slug}
                defaultChecked={selectedCategories.includes(cat.slug)}
              />
              {cat.label_pt}
            </label>
          ))}
        </div>
      </fieldset>

      <button
        type="submit"
        disabled={isPending}
        data-testid="save-statement"
        className="inline-flex items-center gap-2 bg-blue-600 text-white px-5 py-2.5 rounded-lg text-sm font-medium hover:bg-blue-700 disabled:opacity-50 transition-colors"
      >
        {isPending ? <Loader2 className="w-4 h-4 animate-spin" /> : <Save className="w-4 h-4" />}
        {isPending ? 'Salvando...' : 'Salvar alterações'}
      </button>
    </form>
  )
}
