'use client'

import Link from 'next/link'
import Image from 'next/image'
import { useTransition } from 'react'
import { CheckCircle, AlertTriangle, Trash2, ExternalLink, Pencil } from 'lucide-react'
import { verifyStatement, disputeStatement, removeStatement } from './actions'
import { formatDateShort } from '@/lib/utils/date'
import { getDomain } from '@/lib/utils/url'
import type { StatementWithRelations } from '@/types/database'

interface ReviewQueueProps {
  statements: StatementWithRelations[]
}

function ReviewRow({ statement }: { statement: StatementWithRelations }) {
  const [pending, startTransition] = useTransition()
  const { politicians: politician } = statement
  const permalink = statement.slug
    ? `/declaracao/${statement.slug}`
    : `/declaracao/${statement.id}`

  return (
    <li className={`flex flex-col gap-3 p-4 rounded-xl border border-gray-200 bg-white transition-opacity ${pending ? 'opacity-40 pointer-events-none' : ''}`}>
      <div className="flex items-start gap-3">
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
            <p className="text-xs text-gray-500 italic mt-1 line-clamp-1">"{statement.full_quote}"</p>
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
  if (statements.length === 0) {
    return (
      <div className="text-center py-10 text-gray-400 text-sm">
        <CheckCircle className="w-8 h-8 mx-auto mb-2 text-green-400" />
        Nenhuma declaração pendente de revisão.
      </div>
    )
  }

  return (
    <ul className="flex flex-col gap-3">
      {statements.map((s) => (
        <ReviewRow key={s.id} statement={s} />
      ))}
    </ul>
  )
}
