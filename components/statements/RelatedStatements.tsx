import Link from 'next/link'
import { Sparkles } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { findSimilarStatements } from '@/lib/utils/similar-statements'

interface Props {
  statementId: string
  summary: string
  politicianId: string
}

/**
 * "Declarações relacionadas" panel — uses pg_trgm similarity to find
 * nearby statements in the same politician's archive. Server-rendered
 * via the RPC; empty result hides the block cleanly.
 */
export async function RelatedStatements({ statementId, summary, politicianId }: Props) {
  const supabase = getSupabaseServiceClient()
  const matches = await findSimilarStatements(supabase, summary, {
    minSimilarity: 0.3,
    limit: 5,
    politicianId,
  })

  const related = matches.filter((m) => m.id !== statementId).slice(0, 4)
  if (related.length === 0) return null

  return (
    <aside className="bg-white border border-gray-200 rounded-xl p-5 mt-6">
      <h2 className="text-sm font-semibold text-gray-900 mb-3 flex items-center gap-1.5">
        <Sparkles className="w-4 h-4 text-blue-700" aria-hidden="true" />
        Declarações relacionadas do mesmo político
      </h2>
      <ul className="flex flex-col gap-2 text-sm">
        {related.map((m) => (
          <li key={m.id}>
            <Link
              href={`/declaracao/${m.slug ?? m.id}`}
              className="flex items-start gap-3 p-2 rounded-lg hover:bg-gray-50 transition-colors"
            >
              <span className="text-[10px] font-mono text-gray-400 flex-shrink-0 w-10 text-right">
                {(m.similarity * 100).toFixed(0)}%
              </span>
              <span className="flex-1 min-w-0">
                <span className="block text-gray-900 line-clamp-2">{m.summary}</span>
                <span className="block text-xs text-gray-500 mt-0.5">{m.statement_date}</span>
              </span>
            </Link>
          </li>
        ))}
      </ul>
    </aside>
  )
}
