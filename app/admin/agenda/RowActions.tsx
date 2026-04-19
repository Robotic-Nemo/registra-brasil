'use client'

import { useState, useTransition } from 'react'
import { deleteEvent, togglePublishEvent } from './actions'

export function RowActions({ id, isPublished }: { id: string; isPublished: boolean }) {
  const [pub, setPub] = useState(isPublished)
  const [pending, start] = useTransition()

  return (
    <div className="flex items-center gap-2">
      <button
        type="button"
        disabled={pending}
        onClick={() => {
          start(async () => {
            try {
              await togglePublishEvent(id, !pub)
              setPub(!pub)
            } catch (e) {
              alert(e instanceof Error ? e.message : 'erro')
            }
          })
        }}
        className={`rounded border px-2 py-0.5 text-xs ${pub ? 'border-emerald-400 bg-emerald-50 text-emerald-800 dark:border-emerald-700 dark:bg-emerald-950/40 dark:text-emerald-200' : 'border-gray-300 bg-white text-gray-700 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-200'}`}
      >
        {pub ? 'Público' : 'Rascunho'}
      </button>
      <button
        type="button"
        disabled={pending}
        onClick={() => {
          if (!confirm('Excluir este evento?')) return
          start(async () => {
            try { await deleteEvent(id) } catch (e) { alert(e instanceof Error ? e.message : 'erro') }
          })
        }}
        className="rounded border border-rose-300 px-2 py-0.5 text-xs text-rose-700 hover:bg-rose-50 dark:border-rose-800 dark:text-rose-300 dark:hover:bg-rose-950/40"
      >
        Excluir
      </button>
    </div>
  )
}
