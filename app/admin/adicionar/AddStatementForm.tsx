'use client'

import { useState, useTransition } from 'react'
import type { Category } from '@/types/database'
import { submitStatement } from './actions'
import { parseYouTubeVideoId, parseTimestamp, formatTimestamp } from '@/lib/utils/youtube-url'
import { CheckCircle, AlertCircle } from 'lucide-react'

interface AddStatementFormProps {
  categories: Category[]
  politicianSlugs?: string[]
}

const SOURCE_TYPES = [
  { value: 'youtube_video', label: 'YouTube (vídeo)' },
  { value: 'youtube_live_archive', label: 'YouTube (ao vivo arquivado)' },
  { value: 'camara_tv', label: 'TV Câmara' },
  { value: 'senado_tv', label: 'TV Senado' },
  { value: 'diario_oficial', label: 'Diário Oficial' },
  { value: 'transcript_pdf', label: 'Transcrição oficial (PDF)' },
  { value: 'news_article', label: 'Artigo jornalístico' },
  { value: 'social_media_post', label: 'Publicação em redes sociais' },
  { value: 'other', label: 'Outro' },
]

export function AddStatementForm({ categories, politicianSlugs = [] }: AddStatementFormProps) {
  const [isPending, startTransition] = useTransition()
  const [result, setResult] = useState<{ ok: boolean; message: string } | null>(null)
  const [sourceUrl, setSourceUrl] = useState('')
  const [sourceType, setSourceType] = useState('youtube_video')
  const [timestampInput, setTimestampInput] = useState('')
  const detectedVideoId = parseYouTubeVideoId(sourceUrl)

  // Auto-convert timestamp from HH:MM:SS or seconds
  const parsedTimestamp = timestampInput ? (parseTimestamp(timestampInput) ?? (parseInt(timestampInput, 10) || null)) : null

  const [errors, setErrors] = useState<Record<string, string>>({})

  function validate(data: FormData): Record<string, string> {
    const errs: Record<string, string> = {}

    const slug = data.get('politician_slug')?.toString().trim()
    if (!slug) errs.politician_slug = 'Slug do político é obrigatório.'
    else if (!/^[a-z0-9-]+$/.test(slug)) errs.politician_slug = 'Slug deve conter apenas letras minúsculas, números e hifens.'

    const summary = data.get('summary')?.toString().trim()
    if (!summary) errs.summary = 'Resumo é obrigatório.'
    else if (summary.length < 10) errs.summary = 'Resumo deve ter pelo menos 10 caracteres.'

    const sourceUrl = data.get('primary_source_url')?.toString().trim()
    if (!sourceUrl) errs.primary_source_url = 'URL da fonte é obrigatória.'
    else {
      try { new URL(sourceUrl) } catch { errs.primary_source_url = 'URL inválida.' }
    }

    const date = data.get('statement_date')?.toString()
    if (!date) {
      errs.statement_date = 'Data é obrigatória.'
    } else {
      const dateObj = new Date(date + 'T00:00:00')
      if (isNaN(dateObj.getTime())) {
        errs.statement_date = 'Data inválida.'
      } else if (dateObj > new Date()) {
        errs.statement_date = 'Data não pode ser no futuro.'
      } else if (dateObj < new Date('1988-01-01')) {
        errs.statement_date = 'Data anterior a 1988 não é aceita.'
      }
    }

    const cats = data.getAll('categories')
    if (cats.length === 0) errs.categories = 'Selecione pelo menos uma categoria.'

    return errs
  }

  function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault()
    setResult(null)
    const form = e.currentTarget
    const data = new FormData(form)

    const validationErrors = validate(data)
    if (Object.keys(validationErrors).length > 0) {
      setErrors(validationErrors)
      return
    }
    setErrors({})

    startTransition(async () => {
      const res = await submitStatement(data)
      setResult(res)
      if (res.ok) {
        form.reset()
        window.scrollTo({ top: 0, behavior: 'smooth' })
      }
    })
  }

  return (
    <form onSubmit={handleSubmit} className="flex flex-col gap-6">
      {result && (
        <div
          className={`flex items-start gap-2 p-4 rounded-lg border text-sm ${
            result.ok
              ? 'bg-green-50 border-green-200 text-green-800'
              : 'bg-red-50 border-red-200 text-red-800'
          }`}
        >
          {result.ok ? <CheckCircle className="w-4 h-4 mt-0.5 flex-shrink-0" /> : <AlertCircle className="w-4 h-4 mt-0.5 flex-shrink-0" />}
          {result.message}
        </div>
      )}

      {/* Politician slug */}
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">
          Slug do político <span className="text-red-500">*</span>
        </label>
        <input
          name="politician_slug"
          required
          list="politician-slugs-list"
          placeholder="ex: jair-bolsonaro"
          spellCheck={false}
          autoCorrect="off"
          aria-describedby="politician-slug-help"
          className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        {politicianSlugs.length > 0 && (
          <datalist id="politician-slugs-list">
            {politicianSlugs.map((slug) => (
              <option key={slug} value={slug} />
            ))}
          </datalist>
        )}
        <p id="politician-slug-help" className="text-xs text-gray-500 mt-1">Deve coincidir com slug cadastrado na tabela politicians.</p>
        {errors.politician_slug && <p className="text-xs text-red-600 mt-1">{errors.politician_slug}</p>}
      </div>

      {/* Summary */}
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">
          Resumo <span className="text-red-500">*</span>
        </label>
        <textarea
          name="summary"
          required
          minLength={10}
          maxLength={500}
          rows={3}
          placeholder="Descreva a declaração em 1-2 frases objetivas, na terceira pessoa."
          className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 resize-none"
        />
        {errors.summary && <p className="text-xs text-red-600 mt-1">{errors.summary}</p>}
      </div>

      {/* Full quote */}
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">
          Citação literal
        </label>
        <textarea
          name="full_quote"
          rows={3}
          maxLength={5000}
          placeholder="Transcreva as palavras exatas, se disponíveis."
          className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 resize-none"
        />
      </div>

      {/* Context */}
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">Contexto</label>
        <textarea
          name="context"
          rows={2}
          maxLength={2000}
          placeholder="O que estava acontecendo? Onde? Para quem foi dito?"
          className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 resize-none"
        />
      </div>

      {/* Date */}
      <div className="grid grid-cols-2 gap-4">
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Data <span className="text-red-500">*</span>
          </label>
          <input
            type="date"
            name="statement_date"
            required
            aria-label="Data da declaracao"
            className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
          {errors.statement_date && <p className="text-xs text-red-600 mt-1">{errors.statement_date}</p>}
        </div>
        <div className="flex items-end pb-2">
          <label className="flex items-center gap-2 text-sm text-gray-700 cursor-pointer">
            <input type="checkbox" name="statement_date_approx" className="rounded border-gray-300" />
            Data aproximada
          </label>
        </div>
      </div>

      {/* Primary source */}
      <div className="bg-blue-50 border border-blue-200 rounded-xl p-4 flex flex-col gap-4">
        <p className="text-sm font-semibold text-blue-900">Fonte primária (obrigatória)</p>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            URL da fonte <span className="text-red-500">*</span>
          </label>
          <input
            name="primary_source_url"
            required
            type="url"
            value={sourceUrl}
            onChange={(e) => setSourceUrl(e.target.value)}
            placeholder="https://www.youtube.com/watch?v=..."
            spellCheck={false}
            autoCorrect="off"
            className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
          {errors.primary_source_url && <p className="text-xs text-red-600 mt-1">{errors.primary_source_url}</p>}
          {detectedVideoId && (
            <p className="text-xs text-green-700 mt-1">
              ID do vídeo detectado: <code className="font-mono">{detectedVideoId}</code>
            </p>
          )}
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Tipo de fonte</label>
          <select
            name="primary_source_type"
            value={sourceType}
            onChange={(e) => setSourceType(e.target.value)}
            className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
            {SOURCE_TYPES.map((t) => (
              <option key={t.value} value={t.value}>{t.label}</option>
            ))}
          </select>
        </div>

        {(sourceType === 'youtube_video' || sourceType === 'youtube_live_archive') && (
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Tempo no vídeo
            </label>
            <div className="flex gap-2 items-center">
              <input
                type="text"
                value={timestampInput}
                onChange={(e) => setTimestampInput(e.target.value)}
                placeholder="1:15:23 ou 4523"
                spellCheck={false}
                aria-describedby="timestamp-help"
                className="flex-1 border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
              {parsedTimestamp != null && parsedTimestamp > 0 && (
                <span className="text-xs text-green-700 bg-green-50 border border-green-200 px-2 py-1 rounded font-mono whitespace-nowrap">
                  {formatTimestamp(parsedTimestamp)} ({parsedTimestamp}s)
                </span>
              )}
            </div>
            <input type="hidden" name="youtube_timestamp_sec" value={parsedTimestamp ?? ''} />
            <p id="timestamp-help" className="text-xs text-gray-500 mt-1">
              Aceita formato HH:MM:SS, MM:SS ou segundos.
            </p>
          </div>
        )}

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Trecho da transcrição oficial
          </label>
          <textarea
            name="transcript_excerpt"
            rows={2}
            placeholder="Cole o trecho exato da ata ou nota taquigráfica oficial, se disponível."
            className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 resize-none"
          />
        </div>
      </div>

      {/* Venue */}
      <div className="grid grid-cols-2 gap-4">
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Local / veículo</label>
          <input
            name="venue"
            placeholder="ex: Câmara dos Deputados"
            className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Evento</label>
          <input
            name="event_name"
            placeholder="ex: Sessão Plenária"
            className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>
      </div>

      {/* Categories */}
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-2">
          Categorias <span className="text-red-500">*</span>
        </label>
        <div className="grid grid-cols-2 sm:grid-cols-3 gap-2">
          {categories.map((cat) => (
            <label key={cat.slug} className="flex items-center gap-2 cursor-pointer group">
              <input
                type="checkbox"
                name="categories"
                value={cat.slug}
                className="rounded border-gray-300"
              />
              <span
                className="w-2 h-2 rounded-full flex-shrink-0"
                style={{ backgroundColor: cat.color_hex }}
              />
              <span className="text-sm text-gray-700">{cat.label_pt}</span>
            </label>
          ))}
        </div>
        <p id="categories-help" className="text-xs text-gray-500 mt-1">A primeira categoria marcada será a principal.</p>
        {errors.categories && <p className="text-xs text-red-600 mt-1">{errors.categories}</p>}
      </div>

      {/* Severity override */}
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1" htmlFor="severity_score">
          Gravidade
        </label>
        <select
          id="severity_score"
          name="severity_score"
          defaultValue="auto"
          className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
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

      {/* Editor notes */}
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">Notas editoriais</label>
        <textarea
          name="editor_notes"
          rows={2}
          placeholder="Observações internas sobre a verificação, confiabilidade da fonte, etc."
          className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 resize-none"
        />
      </div>

      {/* Submitted by */}
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">Enviado por (handle)</label>
        <input
          name="submitted_by"
          placeholder="ex: @editor_nome"
          className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>

      <button
        type="submit"
        disabled={isPending}
        data-testid="submit-statement"
        className="inline-flex items-center justify-center gap-2 bg-blue-700 hover:bg-blue-800 disabled:opacity-60 disabled:cursor-not-allowed text-white font-medium px-6 py-3 rounded-lg text-sm transition-colors"
      >
        {isPending && (
          <span className="inline-block w-4 h-4 border-2 border-white/30 border-t-white rounded-full animate-spin" />
        )}
        {isPending ? 'Salvando...' : 'Salvar declaração'}
      </button>
    </form>
  )
}
