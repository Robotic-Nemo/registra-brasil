import Link from 'next/link'
import type { StatementWithRelations } from '@/types/database'
import { VerificationBadge } from './VerificationBadge'
import { formatDatePtBR } from '@/lib/utils/date'

interface Props {
  statements: StatementWithRelations[]
}

export function StatementList({ statements }: Props) {
  if (statements.length === 0) return null

  return (
    <div className="divide-y divide-gray-200 border-y border-gray-200">
      {statements.map((s) => {
        const href = `/declaracao/${s.slug ?? s.id}`
        return (
          <article key={s.id} className="py-3 flex items-start gap-3 group">
            <time
              dateTime={s.statement_date}
              className="text-xs text-gray-400 tabular-nums whitespace-nowrap pt-0.5 w-20 flex-shrink-0"
            >
              {formatDatePtBR(s.statement_date)}
            </time>
            <div className="flex-1 min-w-0">
              <Link href={href} className="group-hover:text-blue-700 transition-colors">
                <p className="text-sm text-gray-900 line-clamp-2">{s.summary}</p>
              </Link>
              <div className="flex items-center gap-2 mt-1">
                <Link
                  href={`/politico/${s.politicians.slug}`}
                  className="text-xs text-gray-500 hover:text-gray-700"
                >
                  {s.politicians.common_name}
                </Link>
                <span className="text-xs text-gray-300">·</span>
                <span className="text-xs text-gray-400">{s.politicians.party}</span>
                <VerificationBadge status={s.verification_status} />
              </div>
            </div>
          </article>
        )
      })}
    </div>
  )
}
