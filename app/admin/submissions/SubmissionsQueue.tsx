'use client'

import { useState, useTransition } from 'react'
import { ExternalLink, Calendar, User, Mail, MapPin } from 'lucide-react'
import { approveSubmission, rejectSubmission, markDuplicate } from './actions'

interface Submission {
  id: string
  politician_id: string | null
  politician_name_raw: string | null
  summary: string
  full_quote: string | null
  statement_date: string | null
  venue: string | null
  primary_source_url: string
  context: string | null
  submitter_email: string | null
  submitter_name: string | null
  submitter_notes: string | null
  status: string
  reviewer_notes: string | null
  reviewed_at: string | null
  created_at: string
  similar_statement_id: string | null
  similarity_score: number | null
  politicians: { slug: string; common_name: string; party: string; state: string | null } | null
  similar: { id: string; slug: string | null; summary: string } | null
}

interface Props {
  submissions: Submission[]
}

export function SubmissionsQueue({ submissions }: Props) {
  if (submissions.length === 0) {
    return <p className="text-sm text-gray-600">Nada nesta fila.</p>
  }

  return (
    <ul className="flex flex-col gap-4">
      {submissions.map((s) => (
        <SubmissionItem key={s.id} sub={s} />
      ))}
    </ul>
  )
}

function SubmissionItem({ sub }: { sub: Submission }) {
  const [note, setNote] = useState('')
  const [pending, startTransition] = useTransition()
  const [err, setErr] = useState<string | null>(null)

  function run(fn: () => Promise<void>) {
    setErr(null)
    startTransition(async () => {
      try {
        await fn()
      } catch (e) {
        setErr(e instanceof Error ? e.message : 'Erro')
      }
    })
  }

  const isPending = sub.status === 'pending'
  const polLabel = sub.politicians
    ? `${sub.politicians.common_name} (${sub.politicians.party}${sub.politicians.state ? '/' + sub.politicians.state : ''})`
    : sub.politician_name_raw
    ? `${sub.politician_name_raw} (não mapeado)`
    : '— sem político —'

  return (
    <li className="bg-white border border-gray-200 rounded-lg p-4 text-sm">
      <div className="flex items-start justify-between gap-3 mb-2">
        <div className="flex-1">
          <p className="font-semibold text-gray-900">{polLabel}</p>
          <p className="text-xs text-gray-500">
            Recebido em {new Date(sub.created_at).toLocaleString('pt-BR')}
            {sub.reviewed_at && ` • revisado em ${new Date(sub.reviewed_at).toLocaleString('pt-BR')}`}
          </p>
        </div>
        <span className={`text-xs px-2 py-1 rounded font-medium ${
          sub.status === 'pending' ? 'bg-amber-100 text-amber-800' :
          sub.status === 'approved' ? 'bg-green-100 text-green-800' :
          sub.status === 'rejected' ? 'bg-red-100 text-red-800' :
          'bg-gray-100 text-gray-800'
        }`}>{sub.status}</span>
      </div>

      <p className="text-gray-900 mb-2">{sub.summary}</p>

      {sub.full_quote && (
        <blockquote className="border-l-2 border-gray-300 pl-3 text-sm text-gray-700 italic mb-2">
          {sub.full_quote}
        </blockquote>
      )}

      <dl className="grid grid-cols-1 sm:grid-cols-2 gap-x-6 gap-y-1 text-xs text-gray-600 mb-3">
        {sub.statement_date && (
          <div className="flex items-center gap-1.5">
            <Calendar className="w-3.5 h-3.5" aria-hidden="true" />
            <span>{sub.statement_date}</span>
          </div>
        )}
        {sub.venue && (
          <div className="flex items-center gap-1.5">
            <MapPin className="w-3.5 h-3.5" aria-hidden="true" />
            <span>{sub.venue}</span>
          </div>
        )}
        <div className="flex items-center gap-1.5 sm:col-span-2">
          <ExternalLink className="w-3.5 h-3.5" aria-hidden="true" />
          <a href={sub.primary_source_url} target="_blank" rel="noopener noreferrer" className="text-blue-700 underline truncate">
            {sub.primary_source_url}
          </a>
        </div>
        {sub.submitter_name && (
          <div className="flex items-center gap-1.5">
            <User className="w-3.5 h-3.5" aria-hidden="true" />
            <span>{sub.submitter_name}</span>
          </div>
        )}
        {sub.submitter_email && (
          <div className="flex items-center gap-1.5">
            <Mail className="w-3.5 h-3.5" aria-hidden="true" />
            <a href={`mailto:${sub.submitter_email}`} className="text-blue-700 underline">{sub.submitter_email}</a>
          </div>
        )}
      </dl>

      {sub.submitter_notes && (
        <p className="text-xs text-gray-600 bg-gray-50 border border-gray-200 rounded p-2 mb-3">
          <strong>Obs:</strong> {sub.submitter_notes}
        </p>
      )}

      {sub.similar && sub.similarity_score && (
        <div className="text-xs text-amber-900 bg-amber-50 border border-amber-200 rounded p-2 mb-3">
          <strong>Possível duplicata ({(sub.similarity_score * 100).toFixed(0)}%):</strong>{' '}
          <a
            href={`/declaracao/${sub.similar.slug ?? sub.similar.id}`}
            target="_blank"
            rel="noopener noreferrer"
            className="underline"
          >
            {sub.similar.summary.slice(0, 140)}{sub.similar.summary.length > 140 ? '…' : ''}
          </a>
        </div>
      )}

      {sub.reviewer_notes && (
        <p className="text-xs text-gray-600 bg-blue-50 border border-blue-200 rounded p-2 mb-3">
          <strong>Revisão:</strong> {sub.reviewer_notes}
        </p>
      )}

      {err && <p className="text-xs text-red-700 mb-2">{err}</p>}

      {isPending && (
        <div className="flex flex-col gap-2 border-t border-gray-100 pt-3">
          <input
            type="text"
            placeholder="Observação da revisão (obrigatório para rejeição)"
            value={note}
            onChange={(e) => setNote(e.target.value)}
            className="w-full px-2 py-1.5 text-xs border border-gray-300 rounded focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
          />
          <div className="flex gap-2 flex-wrap">
            <button
              type="button"
              disabled={pending || !sub.politician_id}
              onClick={() => run(() => approveSubmission(sub.id, sub.politician_id as string, 'unverified'))}
              className="px-3 py-1.5 text-xs bg-green-600 hover:bg-green-700 disabled:bg-gray-400 text-white rounded"
              title={!sub.politician_id ? 'Mapeie o político primeiro' : 'Cria declaração unverified'}
            >
              Aprovar (unverified)
            </button>
            <button
              type="button"
              disabled={pending || !sub.politician_id}
              onClick={() => run(() => approveSubmission(sub.id, sub.politician_id as string, 'verified'))}
              className="px-3 py-1.5 text-xs bg-green-700 hover:bg-green-800 disabled:bg-gray-400 text-white rounded"
            >
              Aprovar (verified)
            </button>
            <button
              type="button"
              disabled={pending || !note.trim()}
              onClick={() => run(() => rejectSubmission(sub.id, note))}
              className="px-3 py-1.5 text-xs bg-red-600 hover:bg-red-700 disabled:bg-gray-400 text-white rounded"
            >
              Rejeitar
            </button>
            <button
              type="button"
              disabled={pending}
              onClick={() => run(() => markDuplicate(sub.id))}
              className="px-3 py-1.5 text-xs bg-gray-600 hover:bg-gray-700 text-white rounded"
            >
              Duplicata
            </button>
          </div>
        </div>
      )}
    </li>
  )
}
