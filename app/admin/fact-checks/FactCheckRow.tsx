'use client'

import Link from 'next/link'
import { useTransition } from 'react'
import { ExternalLink, Trash2, Loader2 } from 'lucide-react'
import { removeFactCheck } from './actions'
import { RATING_LABELS, RATING_CLASSES } from '@/lib/fact-checks/outlets'

interface Props {
  fc: {
    id: string
    statement_id: string
    outlet_label: string
    url: string
    title: string | null
    rating: string | null
    rating_label: string | null
    published_at: string | null
    created_at: string
    statements: { slug: string | null; summary: string; politicians: { common_name: string; party: string } | null } | null
  }
}

export function FactCheckRow({ fc }: Props) {
  const [pending, start] = useTransition()

  const ratingCls = fc.rating ? RATING_CLASSES[fc.rating] ?? '' : 'bg-gray-100 text-gray-700 border-gray-300'
  const ratingLabel = fc.rating_label || (fc.rating ? RATING_LABELS[fc.rating] : null)

  return (
    <li className="bg-white border border-gray-200 rounded p-3 text-sm">
      <div className="flex items-center justify-between gap-3 mb-1">
        <div className="flex items-center gap-2 flex-wrap">
          <span className="text-xs font-semibold px-2 py-0.5 rounded bg-blue-100 text-blue-800">{fc.outlet_label}</span>
          {ratingLabel && (
            <span className={`text-xs font-medium px-2 py-0.5 rounded border ${ratingCls}`}>{ratingLabel}</span>
          )}
          {fc.published_at && <span className="text-xs text-gray-500">{fc.published_at}</span>}
        </div>
        <button
          type="button"
          onClick={() => {
            if (!confirm('Remover esta checagem?')) return
            start(() => removeFactCheck(fc.id).catch(() => {}))
          }}
          disabled={pending}
          className="text-xs text-red-700 hover:text-red-900 inline-flex items-center gap-1"
        >
          {pending ? <Loader2 className="w-3 h-3 animate-spin" /> : <Trash2 className="w-3 h-3" />}
          Remover
        </button>
      </div>

      {fc.title && <p className="text-gray-900 mb-1">{fc.title}</p>}
      <a href={fc.url} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1 text-xs text-blue-700 hover:underline truncate block mb-1">
        <ExternalLink className="w-3 h-3" aria-hidden="true" />
        {fc.url}
      </a>

      {fc.statements && (
        <p className="text-xs text-gray-600">
          Declaração:{' '}
          <Link href={`/declaracao/${fc.statements.slug ?? fc.statement_id}`} className="text-blue-700 underline">
            {fc.statements.politicians?.common_name ? `${fc.statements.politicians.common_name}: ` : ''}
            {fc.statements.summary.slice(0, 100)}{fc.statements.summary.length > 100 ? '…' : ''}
          </Link>
        </p>
      )}
    </li>
  )
}
