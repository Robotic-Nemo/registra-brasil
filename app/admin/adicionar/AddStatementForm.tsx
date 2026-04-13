'use client'

import { useState, useTransition } from 'react'
import type { Category } from '@/types/database'
import { submitStatement } from './actions'
import { parseYouTubeVideoId } from '@/lib/utils/youtube-url'
import { CheckCircle, AlertCircle } from 'lucide-react'

interface AddStatementFormProps {
  categories: Category[]
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

export function AddStatementForm({ categories }: AddStatementFormProps) {
  const [isPending, startTransition] = useTransition()
  const [result, setResult] = useState<{ ok: boolean; message: string } | null>(null)
  const [sourceUrl, setSourceUrl] = useState('')
  const [sourceType, setSourceType] = useState('youtube_video')
  const detectedVideoId = parseYouTubeVideoId(sourceUrl)

  function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault()
    setResult(null)
    const form = e.currentTarget
    const data = new FormData(form)

    startTransition(async () => {
      const res = await submitStatement(data)
      setResult(res)
      if (res.ok) form.reset()
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
          placeholder="ex: jair-bolsonaro"
          className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
        <p className="text-xs text-gray-500 mt-1">Deve coincidir com slug cadastrado na tabela politicians.</p>
      </div>

      {/* Summary */}
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">
          Resumo <span className="text-red-500">*</span>
        </label>
        <textarea
          name="summary"
          required
          rows={3}
          placeholder="Descreva a declaração em 1-2 frases objetivas, na terceira pessoa."
          className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 resize-none"
        />
      </div>

      {/* Full quote */}
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">
          Citação literal
        </label>
        <textarea
          name="full_quote"
          rows={3}
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
            className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
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
            className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
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
              Tempo no vídeo (segundos)
            </label>
            <input
              type="number"
              name="youtube_timestamp_sec"
              min={0}
              placeholder="ex: 4523 para 1h15m23s"
              className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
            <p className="text-xs text-gray-500 mt-1">
              Converta hh:mm:ss → segundos. Ex: 1:15:23 = 4523
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
        <p className="text-xs text-gray-500 mt-1">A primeira categoria marcada será a principal.</p>
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
        className="bg-blue-700 hover:bg-blue-800 disabled:opacity-60 text-white font-medium px-6 py-3 rounded-lg text-sm transition-colors"
      >
        {isPending ? 'Salvando...' : 'Salvar declaração'}
      </button>
    </form>
  )
}
