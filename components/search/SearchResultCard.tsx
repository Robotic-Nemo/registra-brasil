import Link from 'next/link'
import Image from 'next/image'
import type { StatementWithRelations } from '@/types/database'
import { getPartyColor } from '@/lib/constants/party-colors'
import { CategoryBadge } from '@/components/categories/CategoryBadge'

interface SearchResultCardProps {
  statement: StatementWithRelations
  /** Search query to highlight in text */
  query?: string
}

/**
 * Enhanced search result card with highlighted query matches.
 */
export function SearchResultCard({ statement, query }: SearchResultCardProps) {
  const politician = statement.politicians
  const primaryCategory = statement.statement_categories?.find((sc) => sc.is_primary)?.categories
  const otherCategories = statement.statement_categories?.filter((sc) => !sc.is_primary && sc.categories) ?? []

  const formattedDate = new Date(statement.statement_date + 'T00:00:00').toLocaleDateString('pt-BR', {
    day: 'numeric',
    month: 'short',
    year: 'numeric',
  })

  return (
    <article className="bg-white border border-gray-200 rounded-xl p-4 hover:shadow-md transition-shadow">
      {/* Politician info */}
      <div className="flex items-center gap-2 mb-3">
        {politician?.photo_url ? (
          <Image
            src={politician.photo_url}
            alt={politician.common_name}
            width={28}
            height={28}
            sizes="28px"
            className="w-7 h-7 rounded-full object-cover border border-gray-200"
          />
        ) : (
          <span className="w-7 h-7 rounded-full bg-gray-200 flex items-center justify-center text-xs font-bold text-gray-500">
            {politician?.common_name?.[0] ?? '?'}
          </span>
        )}
        {politician && (
          <Link
            href={`/politico/${politician.slug}`}
            className="text-sm font-medium text-gray-900 hover:text-blue-700 transition-colors"
            translate="no"
          >
            {politician.common_name}
          </Link>
        )}
        {politician && (
          <span
            className="text-[10px] px-1 py-0.5 rounded font-mono text-white"
            style={{ backgroundColor: getPartyColor(politician.party) }}
            translate="no"
          >
            {politician.party}
          </span>
        )}
        <span className="text-xs text-gray-400 ml-auto">{formattedDate}</span>
      </div>

      {/* Summary with highlighted query */}
      <Link
        href={`/declaracao/${statement.slug ?? statement.id}`}
        className="block group"
      >
        <p className="text-gray-900 group-hover:text-blue-700 transition-colors leading-relaxed">
          <HighlightedText text={statement.summary} query={query} />
        </p>
      </Link>

      {/* Categories */}
      {(primaryCategory || otherCategories.length > 0) && (
        <div className="flex flex-wrap gap-1.5 mt-3">
          {primaryCategory && (
            <CategoryBadge
              slug={primaryCategory.slug}
              label={primaryCategory.label_pt}
              colorHex={primaryCategory.color_hex}
            />
          )}
          {otherCategories.map((sc) => (
            <CategoryBadge
              key={sc.categories.slug}
              slug={sc.categories.slug}
              label={sc.categories.label_pt}
              colorHex={sc.categories.color_hex}
            />
          ))}
        </div>
      )}
    </article>
  )
}

function HighlightedText({ text, query }: { text: string; query?: string }) {
  if (!query || !query.trim()) {
    return <>{text}</>
  }

  const escaped = query.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')
  const regex = new RegExp(`(${escaped})`, 'gi')
  const parts = text.split(regex)

  return (
    <>
      {parts.map((part, i) =>
        i % 2 === 1 ? (
          <mark key={i} className="bg-yellow-100 text-yellow-900 rounded px-0.5">
            {part}
          </mark>
        ) : (
          <span key={i}>{part}</span>
        )
      )}
    </>
  )
}
