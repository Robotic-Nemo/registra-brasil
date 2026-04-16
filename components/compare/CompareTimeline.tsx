import Link from 'next/link'
import type { PoliticianCompareData } from '@/lib/supabase/queries/compare'
import type { InterleavedStatement } from '@/lib/utils/compare'

interface Props {
  statements: InterleavedStatement[]
  a: PoliticianCompareData
  b: PoliticianCompareData
}

export function CompareTimeline({ statements, a, b }: Props) {
  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      <h3 className="text-sm font-semibold text-gray-700 mb-4">Linha do tempo intercalada</h3>

      <div className="space-y-2">
        {statements.slice(0, 20).map((stmt) => {
          const isA = stmt.politician === 'A'
          const politician = isA ? a : b

          return (
            <Link
              key={stmt.id}
              href={`/declaracao/${stmt.id}`}
              className={`flex items-start gap-3 rounded-lg px-3 py-2 border transition-colors ${
                isA
                  ? 'border-blue-100 hover:border-blue-300 bg-blue-50/50'
                  : 'border-red-100 hover:border-red-300 bg-red-50/50'
              }`}
            >
              <div className={`w-2 h-2 rounded-full mt-1.5 shrink-0 ${isA ? 'bg-blue-500' : 'bg-red-500'}`} />
              <div className="flex-1 min-w-0">
                <div className="flex items-center justify-between gap-2">
                  <span className={`text-xs font-medium ${isA ? 'text-blue-700' : 'text-red-700'}`}>
                    {politician.name}
                  </span>
                  <time className="text-xs text-gray-400 tabular-nums">{stmt.statement_date}</time>
                </div>
                <p className="text-sm text-gray-700 line-clamp-2 mt-0.5">{stmt.summary}</p>
              </div>
            </Link>
          )
        })}
      </div>
    </div>
  )
}
