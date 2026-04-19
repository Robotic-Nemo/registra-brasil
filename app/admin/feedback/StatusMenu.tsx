'use client'

import { useState, useTransition } from 'react'
import { setIssueStatus } from './actions'

const OPTIONS = [
  { id: 'open', label: 'Aberto' },
  { id: 'acknowledged', label: 'Reconhecido' },
  { id: 'resolved', label: 'Resolvido' },
  { id: 'spam', label: 'Spam' },
]

export function StatusMenu({ id, status }: { id: string; status: string }) {
  const [current, setCurrent] = useState(status)
  const [pending, start] = useTransition()
  return (
    <select
      value={current}
      disabled={pending}
      onChange={(e) => {
        const next = e.target.value
        setCurrent(next)
        start(async () => {
          try {
            await setIssueStatus(id, next)
          } catch (err) {
            // Revert on error
            alert(err instanceof Error ? err.message : 'erro')
            setCurrent(status)
          }
        })
      }}
      className="rounded border border-gray-300 bg-white px-2 py-0.5 text-xs dark:border-gray-700 dark:bg-gray-900"
    >
      {OPTIONS.map((o) => (
        <option key={o.id} value={o.id}>{o.label}</option>
      ))}
    </select>
  )
}
