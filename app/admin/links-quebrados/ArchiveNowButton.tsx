'use client'

import { useState } from 'react'
import { Loader2, Archive, ExternalLink, AlertCircle } from 'lucide-react'

interface Props {
  statementId: string
  existingWaybackUrl?: string | null
}

export function ArchiveNowButton({ statementId, existingWaybackUrl }: Props) {
  const [state, setState] = useState<'idle' | 'working' | 'ok' | 'err'>('idle')
  const [url, setUrl] = useState<string | null>(existingWaybackUrl ?? null)

  async function run() {
    setState('working')
    try {
      const res = await fetch('/api/admin/archive-source', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ statement_id: statementId }),
      })
      const j = await res.json()
      if (j.ok && j.url) {
        setUrl(j.url)
        setState('ok')
      } else {
        setState('err')
      }
    } catch {
      setState('err')
    }
  }

  if (state === 'ok' && url) {
    return (
      <a
        href={url}
        target="_blank"
        rel="noopener noreferrer"
        className="inline-flex items-center gap-1 text-xs text-green-700 hover:underline"
        title="Arquivo criado no Wayback Machine"
      >
        <ExternalLink className="w-3 h-3" aria-hidden="true" />
        Snapshot
      </a>
    )
  }

  if (url && state === 'idle') {
    return (
      <div className="flex items-center gap-2">
        <a
          href={url}
          target="_blank"
          rel="noopener noreferrer"
          className="inline-flex items-center gap-1 text-xs text-blue-700 hover:underline"
        >
          <ExternalLink className="w-3 h-3" aria-hidden="true" />
          Wayback
        </a>
        <button
          type="button"
          onClick={run}
          className="inline-flex items-center gap-1 text-xs text-gray-600 hover:text-gray-900"
          title="Re-arquivar"
        >
          <Archive className="w-3 h-3" aria-hidden="true" />
          Refazer
        </button>
      </div>
    )
  }

  return (
    <button
      type="button"
      onClick={run}
      disabled={state === 'working'}
      className="inline-flex items-center gap-1 text-xs text-purple-700 hover:text-purple-900 disabled:opacity-60"
      title="Salvar no Internet Archive (Save Page Now)"
    >
      {state === 'working' ? (
        <>
          <Loader2 className="w-3 h-3 animate-spin" aria-hidden="true" />
          Arquivando…
        </>
      ) : state === 'err' ? (
        <>
          <AlertCircle className="w-3 h-3" aria-hidden="true" />
          Falhou — tentar novamente
        </>
      ) : (
        <>
          <Archive className="w-3 h-3" aria-hidden="true" />
          Arquivar agora
        </>
      )}
    </button>
  )
}
