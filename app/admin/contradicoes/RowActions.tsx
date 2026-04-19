'use client'

import { useState, useTransition } from 'react'
import { deleteContradiction, togglePublishContradiction } from './actions'

export function RowActions({ id, isPublished }: { id: string; isPublished: boolean }) {
  const [pending, start] = useTransition()
  const [pub, setPub] = useState(isPublished)
  const [err, setErr] = useState<string | null>(null)

  return (
    <div className="flex items-center gap-2">
      <button
        type="button"
        disabled={pending}
        onClick={() => {
          setErr(null)
          start(async () => {
            try {
              await togglePublishContradiction(id, !pub)
              setPub(!pub)
            } catch (e: unknown) {
              setErr(e instanceof Error ? e.message : 'erro')
            }
          })
        }}
        className={`rounded border px-2 py-0.5 text-xs font-medium ${
          pub
            ? 'border-emerald-400 bg-emerald-50 text-emerald-800 dark:border-emerald-700 dark:bg-emerald-950/40 dark:text-emerald-200'
            : 'border-gray-300 bg-white text-gray-700 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-200'
        }`}
      >
        {pub ? 'Público' : 'Rascunho'}
      </button>
      <button
        type="button"
        disabled={pending}
        onClick={() => {
          if (!confirm('Excluir esta contradição?')) return
          setErr(null)
          start(async () => {
            try {
              await deleteContradiction(id)
            } catch (e: unknown) {
              setErr(e instanceof Error ? e.message : 'erro')
            }
          })
        }}
        className="rounded border border-rose-300 px-2 py-0.5 text-xs text-rose-700 hover:bg-rose-50 dark:border-rose-800 dark:text-rose-300 dark:hover:bg-rose-950/40"
      >
        Excluir
      </button>
      {err && <span className="text-xs text-rose-600">{err}</span>}
    </div>
  )
}
