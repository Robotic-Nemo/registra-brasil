import Link from 'next/link'
import Image from 'next/image'
import { Users } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { findSimilarStatements } from '@/lib/utils/similar-statements'

interface Props {
  statementId: string
  summary: string
  politicianId: string
}

/**
 * "Quem mais disse algo parecido" — uses the catalog-wide pg_trgm
 * similarity RPC (run 3) *without* the politician filter, then drops
 * rows from the same politician (those are covered by
 * RelatedStatements). Intentionally bounded to 4 rows.
 */
export async function CrossPoliticianRelated({ statementId, summary, politicianId }: Props) {
  const supabase = getSupabaseServiceClient()
  const matches = await findSimilarStatements(supabase, summary, {
    minSimilarity: 0.3,
    limit: 20,
  })

  const other = matches.filter((m) => m.id !== statementId && m.politician_id !== politicianId).slice(0, 4)
  if (other.length === 0) return null

  // Fetch politician metadata for each
  const polIds = [...new Set(other.map((o) => o.politician_id))]
  const { data: pols } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name, party, state, photo_url')
    .in('id', polIds)
  const polById = new Map(((pols ?? []) as any[]).map((p) => [p.id, p]))

  return (
    <aside className="bg-white border border-gray-200 rounded-xl p-5 mt-6">
      <h2 className="text-sm font-semibold text-gray-900 mb-3 flex items-center gap-1.5">
        <Users className="w-4 h-4 text-blue-700" aria-hidden="true" />
        Declarações parecidas de outros políticos
      </h2>
      <ul className="flex flex-col gap-3 text-sm">
        {other.map((m) => {
          const pol = polById.get(m.politician_id)
          return (
            <li key={m.id}>
              <Link
                href={`/declaracao/${m.slug ?? m.id}`}
                className="flex items-start gap-3 p-2 rounded-lg hover:bg-gray-50 transition-colors"
              >
                {pol?.photo_url ? (
                  <Image src={pol.photo_url} alt="" width={32} height={32} unoptimized className="w-8 h-8 rounded-full object-cover border border-gray-200 flex-shrink-0" />
                ) : (
                  <div className="w-8 h-8 rounded-full bg-gray-100 flex-shrink-0 flex items-center justify-center text-xs font-bold text-gray-400">
                    {pol?.common_name?.[0] ?? '?'}
                  </div>
                )}
                <span className="flex-1 min-w-0">
                  <span className="block text-xs text-gray-500">
                    {pol ? `${pol.common_name} (${pol.party}${pol.state ? '-' + pol.state : ''})` : '—'}
                    {' · '}{m.statement_date}
                    {' · '}
                    <span className="font-mono text-blue-700">{(m.similarity * 100).toFixed(0)}%</span>
                  </span>
                  <span className="block text-gray-900 line-clamp-2 mt-0.5">{m.summary}</span>
                </span>
              </Link>
            </li>
          )
        })}
      </ul>
    </aside>
  )
}
