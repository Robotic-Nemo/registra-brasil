'use client'

import { useMemo, useState } from 'react'
import { Rss, Link as LinkIcon, Copy, Check } from 'lucide-react'

interface Props {
  qs: string
  summary: string
  totalResults: number
}

/**
 * Appears on /buscar when the reader has active filters. Converts the
 * current query into a shareable permalink + RSS subscription. Stateless:
 * the identity of the saved search is the querystring itself, so no
 * server-side storage is needed.
 */
export function SaveSearchPanel({ qs, summary, totalResults }: Props) {
  const origin = typeof window === 'undefined' ? '' : window.location.origin
  const htmlUrl = useMemo(() => `${origin}/buscar${qs ? `?${qs}` : ''}`, [origin, qs])
  const rssUrl = useMemo(() => `${origin}/api/saved-search/feed.xml${qs ? `?${qs}` : ''}`, [origin, qs])

  const [copied, setCopied] = useState<null | 'html' | 'rss'>(null)

  function copy(text: string, which: 'html' | 'rss') {
    navigator.clipboard.writeText(text).then(() => {
      setCopied(which)
      setTimeout(() => setCopied(null), 1500)
    })
  }

  return (
    <section
      aria-label="Salvar esta busca"
      className="my-4 rounded-xl border border-indigo-200 bg-indigo-50/60 p-4 dark:border-indigo-900/50 dark:bg-indigo-950/20"
    >
      <div className="flex flex-wrap items-start justify-between gap-3">
        <div className="min-w-0 flex-1">
          <h2 className="flex items-center gap-1.5 text-sm font-semibold text-indigo-900 dark:text-indigo-200">
            <LinkIcon className="h-4 w-4" aria-hidden />
            Salvar esta busca
          </h2>
          <p className="mt-1 text-xs text-indigo-900/80 dark:text-indigo-300/80">
            {summary} · {totalResults.toLocaleString('pt-BR')} resultado
            {totalResults === 1 ? '' : 's'}. Copie o link para voltar mais tarde
            ou assine por RSS.
          </p>
        </div>
      </div>

      <div className="mt-3 flex flex-col gap-2 md:flex-row md:items-center">
        <input
          type="text"
          value={htmlUrl}
          readOnly
          className="flex-1 rounded border border-gray-300 bg-white px-2 py-1 font-mono text-xs text-gray-700 dark:border-gray-700 dark:bg-gray-950 dark:text-gray-300"
          onClick={(e) => (e.currentTarget as HTMLInputElement).select()}
          aria-label="URL permanente"
        />
        <div className="flex items-center gap-2">
          <button
            type="button"
            onClick={() => copy(htmlUrl, 'html')}
            className="inline-flex items-center gap-1 rounded border border-indigo-300 bg-white px-3 py-1 text-xs font-medium text-indigo-800 hover:bg-indigo-50 dark:border-indigo-800 dark:bg-gray-900 dark:text-indigo-200 dark:hover:bg-indigo-950/40"
          >
            {copied === 'html' ? <Check className="h-3 w-3" /> : <Copy className="h-3 w-3" />}
            {copied === 'html' ? 'Copiado' : 'Copiar link'}
          </button>
          <a
            href={rssUrl}
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center gap-1 rounded border border-orange-300 bg-orange-50 px-3 py-1 text-xs font-medium text-orange-800 hover:bg-orange-100 dark:border-orange-800 dark:bg-orange-950/40 dark:text-orange-200"
          >
            <Rss className="h-3 w-3" />
            RSS
          </a>
          <button
            type="button"
            onClick={() => copy(rssUrl, 'rss')}
            className="inline-flex items-center gap-1 rounded border border-gray-300 bg-white px-3 py-1 text-xs text-gray-700 hover:bg-gray-50 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 dark:hover:bg-gray-800"
          >
            {copied === 'rss' ? <Check className="h-3 w-3" /> : <Copy className="h-3 w-3" />}
            {copied === 'rss' ? 'Copiado' : 'URL RSS'}
          </button>
        </div>
      </div>
    </section>
  )
}
