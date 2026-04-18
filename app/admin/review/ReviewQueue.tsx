'use client'

import Link from 'next/link'
import Image from 'next/image'
import { useCallback, useMemo, useState, useTransition } from 'react'
import { CheckCircle, AlertTriangle, Trash2, ExternalLink, Pencil, Loader2 } from 'lucide-react'
import { verifyStatement, disputeStatement, removeStatement, bulkChangeStatus } from './actions'
import { formatDateShort } from '@/lib/utils/date'
import { getDomain } from '@/lib/utils/url'
import type { StatementWithRelations } from '@/types/database'

interface ReviewQueueProps {
  statements: StatementWithRelations[]
}

function ReviewRow({
  statement,
  selected,
  onToggle,
}: {
  statement: StatementWithRelations
  selected: boolean
  onToggle: (id: string) => void
}) {
  const [pending, startTransition] = useTransition()
  const { politicians: politician } = statement
  const permalink = statement.slug ? `/declaracao/${statement.slug}` : `/declaracao/${statement.id}`

  return (
    <li className={`flex flex-col gap-3 p-4 rounded-xl border ${selected ? 'border-blue-400 bg-blue-50' : 'border-gray-200 bg-white'} transition-opacity ${pending ? 'opacity-40 pointer-events-none' : ''}`}>
      <div className="flex items-start gap-3">
        <input
          type="checkbox"
          checked={selected}
          onChange={() => onToggle(statement.id)}
          className="mt-2 accent-blue-600 flex-shrink-0"
          aria-label={`Selecionar declaração de ${politician.common_name}`}
        />
        {politician.photo_url ? (
          <Image src={politician.photo_url} alt={politician.common_name} width={36} height={36}
            className="w-9 h-9 rounded-full object-cover border border-gray-200 flex-shrink-0 mt-0.5" referrerPolicy="no-referrer" />
        ) : (
          <div className="w-9 h-9 rounded-full bg-gray-200 flex-shrink-0 flex items-center justify-center text-sm font-bold text-gray-500 mt-0.5">
            {politician.common_name?.[0] ?? '?'}
          </div>
        )}
        <div className="min-w-0 flex-1">
          <div className="flex items-center gap-2 flex-wrap">
            <span className="font-semibold text-gray-900 text-sm">{politician.common_name}</span>
            <span className="text-xs bg-gray-100 px-1.5 py-0.5 rounded font-mono text-gray-600">{politician.party}</span>
            <time className="text-xs text-gray-400">{formatDateShort(statement.statement_date)}</time>
            <time
              className="text-xs text-gray-400 italic"
              dateTime={statement.created_at}
              title={new Date(statement.created_at).toLocaleString('pt-BR')}
            >
              Criado em {formatDateShort(statement.created_at)}
            </time>
          </div>
          <p className="text-sm text-gray-700 mt-1 line-clamp-2">{statement.summary}</p>
          {statement.full_quote && (
            <p className="text-xs text-gray-500 italic mt-1 line-clamp-1">&quot;{statement.full_quote}&quot;</p>
          )}
        </div>
        <div className="flex items-center gap-1 flex-shrink-0 mt-0.5">
          <Link href={`/admin/editar/${statement.slug ?? statement.id}`}
            className="text-gray-400 hover:text-blue-600" title="Editar declaração">
            <Pencil className="w-4 h-4" />
          </Link>
          <Link href={permalink} target="_blank"
            className="text-gray-400 hover:text-blue-600" title="Abrir declaração">
            <ExternalLink className="w-4 h-4" />
          </Link>
        </div>
      </div>

      <div className="flex items-center gap-2 pl-12">
        <a href={statement.primary_source_url} target="_blank" rel="noopener noreferrer"
          className="text-xs text-blue-600 hover:underline truncate max-w-xs"
          title={statement.primary_source_url}>
          {getDomain(statement.primary_source_url) ?? statement.primary_source_url}
        </a>
      </div>

      <div className="flex items-center gap-2 pl-12">
        <form action={() => startTransition(() => verifyStatement(statement.id))}>
          <button type="submit" disabled={pending}
            className="flex items-center gap-1.5 text-xs px-3 py-1.5 rounded-lg bg-green-50 text-green-700 hover:bg-green-100 disabled:opacity-50 disabled:cursor-not-allowed border border-green-200 font-medium transition-colors">
            <CheckCircle className="w-3.5 h-3.5" />
            {pending ? 'Aguarde...' : 'Verificar'}
          </button>
        </form>
        <form action={() => startTransition(() => disputeStatement(statement.id))}>
          <button type="submit" disabled={pending}
            className="flex items-center gap-1.5 text-xs px-3 py-1.5 rounded-lg bg-yellow-50 text-yellow-700 hover:bg-yellow-100 disabled:opacity-50 disabled:cursor-not-allowed border border-yellow-200 font-medium transition-colors">
            <AlertTriangle className="w-3.5 h-3.5" />
            {pending ? 'Aguarde...' : 'Disputar'}
          </button>
        </form>
        <form action={() => startTransition(() => removeStatement(statement.id))}>
          <button type="submit" disabled={pending}
            className="flex items-center gap-1.5 text-xs px-3 py-1.5 rounded-lg bg-red-50 text-red-700 hover:bg-red-100 disabled:opacity-50 disabled:cursor-not-allowed border border-red-200 font-medium transition-colors">
            <Trash2 className="w-3.5 h-3.5" />
            {pending ? 'Aguarde...' : 'Remover'}
          </button>
        </form>
      </div>
    </li>
  )
}

export function ReviewQueue({ statements }: ReviewQueueProps) {
  const [selected, setSelected] = useState<Set<string>>(new Set())
  const [reason, setReason] = useState('')
  const [bulkPending, startBulk] = useTransition()
  const [bulkErr, setBulkErr] = useState<string | null>(null)
  const [bulkMsg, setBulkMsg] = useState<string | null>(null)

  const allIds = useMemo(() => statements.map((s) => s.id), [statements])
  const allSelected = selected.size > 0 && selected.size === allIds.length

  const toggle = useCallback((id: string) => {
    setSelected((prev) => {
      const next = new Set(prev)
      if (next.has(id)) next.delete(id)
      else next.add(id)
      return next
    })
  }, [])

  const toggleAll = () => {
    setSelected((prev) => prev.size === allIds.length ? new Set() : new Set(allIds))
  }

  function bulk(status: 'verified' | 'disputed' | 'removed') {
    setBulkErr(null); setBulkMsg(null)
    if (selected.size === 0) { setBulkErr('Selecione ao menos uma declaração.'); return }
    if (reason.trim().length < 3) { setBulkErr('Motivo obrigatório (≥3 caracteres).'); return }
    startBulk(async () => {
      try {
        const res = await bulkChangeStatus([...selected], status, reason)
        setBulkMsg(`${res.updated} declarações marcadas como ${status}.`)
        setSelected(new Set())
        setReason('')
      } catch (e) {
        setBulkErr(e instanceof Error ? e.message : 'Erro')
      }
    })
  }

  if (statements.length === 0) {
    return (
      <div className="text-center py-10 text-gray-400 text-sm">
        <CheckCircle className="w-8 h-8 mx-auto mb-2 text-green-400" />
        Nenhuma declaração pendente de revisão.
      </div>
    )
  }

  return (
    <div className="space-y-4">
      <div className="bg-blue-50 border border-blue-200 rounded-lg p-3 text-sm flex flex-wrap items-center gap-3">
        <label className="inline-flex items-center gap-2 cursor-pointer">
          <input type="checkbox" checked={allSelected} onChange={toggleAll} className="accent-blue-600" />
          {selected.size > 0 ? `${selected.size} selecionada${selected.size === 1 ? '' : 's'}` : 'Selecionar todas'}
        </label>
        <input
          type="text"
          maxLength={300}
          value={reason}
          onChange={(e) => setReason(e.target.value)}
          placeholder="Motivo do lote (≥3 caracteres, gravado no audit log)"
          className="flex-1 min-w-[14rem] px-2 py-1 border border-blue-300 rounded text-xs bg-white focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
        />
        <div className="flex items-center gap-2">
          <button
            type="button"
            disabled={bulkPending || selected.size === 0}
            onClick={() => bulk('verified')}
            className="inline-flex items-center gap-1 px-2.5 py-1 text-xs bg-green-600 hover:bg-green-700 disabled:bg-gray-400 text-white rounded"
          >
            {bulkPending ? <Loader2 className="w-3 h-3 animate-spin" /> : <CheckCircle className="w-3 h-3" />}
            Verificar em lote
          </button>
          <button
            type="button"
            disabled={bulkPending || selected.size === 0}
            onClick={() => bulk('disputed')}
            className="inline-flex items-center gap-1 px-2.5 py-1 text-xs bg-yellow-600 hover:bg-yellow-700 disabled:bg-gray-400 text-white rounded"
          >
            <AlertTriangle className="w-3 h-3" />
            Disputar
          </button>
          <button
            type="button"
            disabled={bulkPending || selected.size === 0}
            onClick={() => bulk('removed')}
            className="inline-flex items-center gap-1 px-2.5 py-1 text-xs bg-red-600 hover:bg-red-700 disabled:bg-gray-400 text-white rounded"
          >
            <Trash2 className="w-3 h-3" />
            Remover
          </button>
        </div>
      </div>

      {bulkErr && <div className="bg-red-50 border border-red-200 rounded p-2 text-xs text-red-900" role="alert">{bulkErr}</div>}
      {bulkMsg && <div className="bg-green-50 border border-green-200 rounded p-2 text-xs text-green-900">{bulkMsg}</div>}

      <ul className="flex flex-col gap-3">
        {statements.map((s) => (
          <ReviewRow key={s.id} statement={s} selected={selected.has(s.id)} onToggle={toggle} />
        ))}
      </ul>
    </div>
  )
}
