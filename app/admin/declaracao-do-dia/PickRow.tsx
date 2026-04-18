'use client'

import Link from 'next/link'
import { useTransition } from 'react'
import { Loader2, Trash2, ExternalLink } from 'lucide-react'
import { deletePick } from './actions'

interface Row {
  pick_date: string
  curator_note: string | null
  statement_id: string
  statements: { id: string; slug: string | null; summary: string; politicians: { common_name: string; party: string } | null } | null
}

export function PickRow({ row, readOnly }: { row: Row; readOnly?: boolean }) {
  const [pending, start] = useTransition()
  const s = row.statements
  const pol = s?.politicians

  function onDelete() {
    if (!confirm(`Remover pick de ${row.pick_date}?`)) return
    start(() => deletePick(row.pick_date).catch(() => {}))
  }

  return (
    <li className="bg-white border border-gray-200 rounded p-3 text-sm">
      <div className="flex items-center justify-between gap-3 mb-1">
        <time className="font-mono text-xs text-gray-700" dateTime={row.pick_date}>{row.pick_date}</time>
        <div className="flex items-center gap-2">
          {s && (
            <Link href={`/declaracao/${s.slug ?? row.statement_id}`} target="_blank" className="inline-flex items-center gap-0.5 text-xs text-blue-700 hover:underline">
              <ExternalLink className="w-3 h-3" aria-hidden="true" />
              Ver
            </Link>
          )}
          {!readOnly && (
            <button
              type="button"
              onClick={onDelete}
              disabled={pending}
              className="inline-flex items-center gap-0.5 text-xs text-red-700 hover:text-red-900"
            >
              {pending ? <Loader2 className="w-3 h-3 animate-spin" /> : <Trash2 className="w-3 h-3" />}
              Remover
            </button>
          )}
        </div>
      </div>
      {pol && <p className="text-xs text-gray-500">{pol.common_name} ({pol.party})</p>}
      <p className="text-gray-900 mt-0.5">{s?.summary?.slice(0, 180) ?? '(declaração removida)'}</p>
      {row.curator_note && <p className="text-xs italic text-blue-900 mt-1">“{row.curator_note}”</p>}
    </li>
  )
}
