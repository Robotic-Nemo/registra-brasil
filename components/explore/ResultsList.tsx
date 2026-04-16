import Link from 'next/link'
import type { StatementWithRelations } from '@/types/database'
import { VerificationBadge } from '@/components/statements/VerificationBadge'

interface Props {
  statements: StatementWithRelations[]
}

export function ResultsList({ statements }: Props) {
  if (statements.length === 0) {
    return (
      <div className="text-center py-12 text-gray-500">
        Nenhuma declaracao encontrada com os filtros selecionados.
      </div>
    )
  }

  return (
    <div className="space-y-2">
      {statements.map((s) => {
        const politician = s.politicians as unknown as {
          slug: string
          common_name: string
          party: string
          state: string | null
        }

        return (
          <Link
            key={s.id}
            href={`/declaracao/${s.id}`}
            className="flex items-start gap-3 bg-white border border-gray-200 rounded-lg px-4 py-3 hover:border-blue-300 transition-colors"
          >
            <time className="text-xs text-gray-400 tabular-nums whitespace-nowrap pt-0.5">
              {s.statement_date}
            </time>
            <div className="flex-1 min-w-0">
              <p className="text-sm text-gray-800 line-clamp-2">{s.summary}</p>
              <div className="flex items-center gap-2 mt-1">
                <span className="text-xs font-medium text-gray-600">
                  {politician.common_name}
                </span>
                <span className="text-xs text-gray-400">
                  {politician.party}
                  {politician.state ? ` - ${politician.state}` : ''}
                </span>
              </div>
            </div>
            <VerificationBadge status={s.verification_status} />
          </Link>
        )
      })}
    </div>
  )
}
