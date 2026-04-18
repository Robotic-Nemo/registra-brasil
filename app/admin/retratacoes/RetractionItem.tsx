'use client'

import Link from 'next/link'
import { useState, useTransition } from 'react'
import { ExternalLink, Mail, User } from 'lucide-react'
import { decideRetraction } from './actions'

interface Req {
  id: string
  statement_id: string | null
  statement_url: string | null
  kind: string
  status: string
  petitioner_name: string
  petitioner_email: string
  petitioner_role: string | null
  claim: string
  desired_remedy: string | null
  evidence_urls: string | null
  reviewer_notes: string | null
  reviewed_at: string | null
  public_reply: string | null
  created_at: string
  statements: { id: string; slug: string | null; summary: string } | null
  represents: { common_name: string; slug: string } | null
}

const KIND_LABELS: Record<string, string> = {
  correction: 'Correção',
  retraction: 'Retratação',
  right_of_reply: 'Direito de resposta',
  clarification: 'Esclarecimento',
  takedown_privacy: 'Privacidade',
}

export function RetractionItem({ req }: { req: Req }) {
  const [notes, setNotes] = useState(req.reviewer_notes ?? '')
  const [reply, setReply] = useState(req.public_reply ?? '')
  const [err, setErr] = useState<string | null>(null)
  const [pending, start] = useTransition()

  function act(decision: 'accept' | 'reject' | 'reply' | 'in_review') {
    setErr(null)
    start(async () => {
      try {
        await decideRetraction(req.id, decision, notes, decision === 'reply' ? reply : undefined)
      } catch (e) {
        setErr(e instanceof Error ? e.message : 'Erro')
      }
    })
  }

  const stmtHref = req.statements
    ? `/declaracao/${req.statements.slug ?? req.statements.id}`
    : req.statement_url ?? '#'
  const stmtLabel = req.statements?.summary ?? req.statement_url ?? '—'

  const open = req.status === 'pending' || req.status === 'in_review'

  return (
    <li className="bg-white border border-gray-200 rounded-lg p-4 text-sm">
      <div className="flex items-center justify-between gap-3 mb-2">
        <span className="text-xs font-semibold px-2 py-0.5 rounded bg-blue-100 text-blue-800">
          {KIND_LABELS[req.kind] ?? req.kind}
        </span>
        <span className="text-xs text-gray-500">
          {new Date(req.created_at).toLocaleString('pt-BR', { dateStyle: 'short', timeStyle: 'short' })}
          {req.reviewed_at && ` · rev. ${new Date(req.reviewed_at).toLocaleDateString('pt-BR')}`}
        </span>
      </div>

      <div className="mb-2">
        <p className="text-xs text-gray-500 uppercase tracking-wider mb-0.5">Alvo</p>
        <Link href={stmtHref} target="_blank" rel="noopener noreferrer" className="text-blue-700 hover:underline inline-flex items-center gap-1">
          {stmtLabel.slice(0, 180)}{stmtLabel.length > 180 ? '…' : ''}
          <ExternalLink className="w-3 h-3" aria-hidden="true" />
        </Link>
      </div>

      <div className="mb-3 grid grid-cols-1 sm:grid-cols-2 gap-x-4 gap-y-1 text-xs text-gray-600">
        <div className="flex items-center gap-1.5"><User className="w-3.5 h-3.5" /> {req.petitioner_name}{req.petitioner_role ? ` · ${req.petitioner_role}` : ''}</div>
        <div className="flex items-center gap-1.5"><Mail className="w-3.5 h-3.5" /> <a href={`mailto:${req.petitioner_email}`} className="text-blue-700 underline">{req.petitioner_email}</a></div>
        {req.represents && <div className="sm:col-span-2">Representa: <strong>{req.represents.common_name}</strong></div>}
      </div>

      <div className="mb-3">
        <p className="text-xs text-gray-500 uppercase tracking-wider mb-0.5">Reclamação</p>
        <p className="text-gray-900 whitespace-pre-wrap">{req.claim}</p>
      </div>

      {req.desired_remedy && (
        <div className="mb-3">
          <p className="text-xs text-gray-500 uppercase tracking-wider mb-0.5">Remédio pretendido</p>
          <p className="text-gray-800 whitespace-pre-wrap bg-gray-50 border border-gray-200 rounded p-2">{req.desired_remedy}</p>
        </div>
      )}

      {req.evidence_urls && (
        <div className="mb-3">
          <p className="text-xs text-gray-500 uppercase tracking-wider mb-0.5">Evidências</p>
          <pre className="text-xs text-blue-800 whitespace-pre-wrap bg-gray-50 border border-gray-200 rounded p-2 overflow-x-auto">{req.evidence_urls}</pre>
        </div>
      )}

      {req.public_reply && (
        <div className="mb-3 bg-amber-50 border border-amber-200 rounded p-2">
          <p className="text-xs text-amber-800 uppercase tracking-wider mb-0.5">Réplica pública publicada</p>
          <p className="text-sm text-amber-900 whitespace-pre-wrap">{req.public_reply}</p>
        </div>
      )}

      {open && (
        <div className="border-t border-gray-100 pt-3 space-y-2">
          <input
            type="text"
            value={notes}
            onChange={(e) => setNotes(e.target.value)}
            placeholder="Notas internas da revisão"
            className="w-full px-2 py-1.5 text-xs border border-gray-300 rounded focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
          />
          <textarea
            value={reply}
            onChange={(e) => setReply(e.target.value)}
            rows={3}
            placeholder="Texto da réplica pública (só se for publicar)"
            maxLength={5000}
            className="w-full px-2 py-1.5 text-xs border border-gray-300 rounded focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
          />
          {err && <p className="text-xs text-red-700" role="alert">{err}</p>}
          <div className="flex gap-2 flex-wrap">
            <button type="button" disabled={pending} onClick={() => act('in_review')} className="px-3 py-1.5 text-xs bg-blue-600 hover:bg-blue-700 text-white rounded">Em revisão</button>
            <button type="button" disabled={pending} onClick={() => act('accept')} className="px-3 py-1.5 text-xs bg-green-600 hover:bg-green-700 text-white rounded">Aceitar</button>
            <button type="button" disabled={pending || reply.trim().length < 10} onClick={() => act('reply')} className="px-3 py-1.5 text-xs bg-amber-600 hover:bg-amber-700 disabled:bg-gray-400 text-white rounded">Publicar réplica</button>
            <button type="button" disabled={pending} onClick={() => act('reject')} className="px-3 py-1.5 text-xs bg-red-600 hover:bg-red-700 text-white rounded">Rejeitar</button>
          </div>
        </div>
      )}
    </li>
  )
}
