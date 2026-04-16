'use client'

import { useState, type FormEvent } from 'react'
import type { Statement, VerificationStatus, SourceType } from '@/types/database'

interface StatementEditorProps {
  statement?: Partial<Statement>
  onSubmit: (data: StatementFormData) => Promise<void>
  isLoading?: boolean
}

export interface StatementFormData {
  summary: string
  full_quote: string
  context: string
  statement_date: string
  primary_source_url: string
  primary_source_type: SourceType
  verification_status: VerificationStatus
  venue: string
  event_name: string
  editor_notes: string
}

const SOURCE_TYPES: { value: SourceType; label: string }[] = [
  { value: 'youtube_video', label: 'Video do YouTube' },
  { value: 'youtube_live_archive', label: 'Live/Arquivo YouTube' },
  { value: 'camara_tv', label: 'TV Camara' },
  { value: 'senado_tv', label: 'TV Senado' },
  { value: 'diario_oficial', label: 'Diario Oficial' },
  { value: 'transcript_pdf', label: 'Transcricao PDF' },
  { value: 'news_article', label: 'Artigo de Noticia' },
  { value: 'social_media_post', label: 'Postagem em Rede Social' },
  { value: 'other', label: 'Outro' },
]

const VERIFICATION_STATUSES: { value: VerificationStatus; label: string }[] = [
  { value: 'unverified', label: 'Nao verificada' },
  { value: 'verified', label: 'Verificada' },
  { value: 'disputed', label: 'Disputada' },
  { value: 'removed', label: 'Removida' },
]

/**
 * Form for creating or editing a statement.
 * Handles all statement fields with proper labels and validation hints.
 */
export function StatementEditor({ statement, onSubmit, isLoading = false }: StatementEditorProps) {
  const [formData, setFormData] = useState<StatementFormData>({
    summary: statement?.summary ?? '',
    full_quote: statement?.full_quote ?? '',
    context: statement?.context ?? '',
    statement_date: statement?.statement_date ?? '',
    primary_source_url: statement?.primary_source_url ?? '',
    primary_source_type: statement?.primary_source_type ?? 'news_article',
    verification_status: statement?.verification_status ?? 'unverified',
    venue: statement?.venue ?? '',
    event_name: statement?.event_name ?? '',
    editor_notes: statement?.editor_notes ?? '',
  })

  const handleChange = (field: keyof StatementFormData, value: string) => {
    setFormData((prev) => ({ ...prev, [field]: value }))
  }

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault()
    await onSubmit(formData)
  }

  return (
    <form onSubmit={handleSubmit} className="space-y-5">
      {/* Summary */}
      <div>
        <label htmlFor="se-summary" className="block text-sm font-medium text-gray-700 mb-1">
          Resumo *
        </label>
        <textarea
          id="se-summary"
          required
          rows={2}
          value={formData.summary}
          onChange={(e) => handleChange('summary', e.target.value)}
          className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
          placeholder="Breve resumo da declaracao"
        />
      </div>

      {/* Full quote */}
      <div>
        <label htmlFor="se-quote" className="block text-sm font-medium text-gray-700 mb-1">
          Citacao completa
        </label>
        <textarea
          id="se-quote"
          rows={4}
          value={formData.full_quote}
          onChange={(e) => handleChange('full_quote', e.target.value)}
          className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
          placeholder="Transcricao literal da fala"
        />
      </div>

      {/* Context */}
      <div>
        <label htmlFor="se-context" className="block text-sm font-medium text-gray-700 mb-1">
          Contexto
        </label>
        <textarea
          id="se-context"
          rows={2}
          value={formData.context}
          onChange={(e) => handleChange('context', e.target.value)}
          className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
          placeholder="Em que circunstancias a declaracao foi feita"
        />
      </div>

      {/* Date and status row */}
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div>
          <label htmlFor="se-date" className="block text-sm font-medium text-gray-700 mb-1">
            Data da declaracao *
          </label>
          <input
            id="se-date"
            type="date"
            required
            value={formData.statement_date}
            onChange={(e) => handleChange('statement_date', e.target.value)}
            className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
          />
        </div>
        <div>
          <label htmlFor="se-status" className="block text-sm font-medium text-gray-700 mb-1">
            Status de verificacao
          </label>
          <select
            id="se-status"
            value={formData.verification_status}
            onChange={(e) => handleChange('verification_status', e.target.value)}
            className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
          >
            {VERIFICATION_STATUSES.map((s) => (
              <option key={s.value} value={s.value}>
                {s.label}
              </option>
            ))}
          </select>
        </div>
      </div>

      {/* Source URL and type row */}
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div>
          <label htmlFor="se-source-url" className="block text-sm font-medium text-gray-700 mb-1">
            URL da fonte primaria *
          </label>
          <input
            id="se-source-url"
            type="url"
            required
            value={formData.primary_source_url}
            onChange={(e) => handleChange('primary_source_url', e.target.value)}
            className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            placeholder="https://..."
          />
        </div>
        <div>
          <label htmlFor="se-source-type" className="block text-sm font-medium text-gray-700 mb-1">
            Tipo de fonte
          </label>
          <select
            id="se-source-type"
            value={formData.primary_source_type}
            onChange={(e) => handleChange('primary_source_type', e.target.value)}
            className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
          >
            {SOURCE_TYPES.map((t) => (
              <option key={t.value} value={t.value}>
                {t.label}
              </option>
            ))}
          </select>
        </div>
      </div>

      {/* Venue and event */}
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div>
          <label htmlFor="se-venue" className="block text-sm font-medium text-gray-700 mb-1">
            Local
          </label>
          <input
            id="se-venue"
            type="text"
            value={formData.venue}
            onChange={(e) => handleChange('venue', e.target.value)}
            className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            placeholder="Ex: Plenario da Camara"
          />
        </div>
        <div>
          <label htmlFor="se-event" className="block text-sm font-medium text-gray-700 mb-1">
            Evento
          </label>
          <input
            id="se-event"
            type="text"
            value={formData.event_name}
            onChange={(e) => handleChange('event_name', e.target.value)}
            className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            placeholder="Ex: Sessao Ordinaria"
          />
        </div>
      </div>

      {/* Editor notes */}
      <div>
        <label htmlFor="se-notes" className="block text-sm font-medium text-gray-700 mb-1">
          Notas do editor
        </label>
        <textarea
          id="se-notes"
          rows={2}
          value={formData.editor_notes}
          onChange={(e) => handleChange('editor_notes', e.target.value)}
          className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
          placeholder="Notas internas (nao publicadas)"
        />
      </div>

      <div className="pt-2">
        <button
          type="submit"
          disabled={isLoading}
          className="w-full sm:w-auto px-6 py-2.5 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
        >
          {isLoading ? 'Salvando...' : 'Salvar declaracao'}
        </button>
      </div>
    </form>
  )
}
