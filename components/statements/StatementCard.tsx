import Link from 'next/link'
import type { StatementWithRelations } from '@/types/database'
import { CategoryTag } from './CategoryTag'
import { VerificationBadge } from './VerificationBadge'
import { SourceLink } from './SourceLink'
import { formatDateShort } from '@/lib/utils/date'
import { OFFICIAL_CHANNELS } from '@/lib/youtube/constants'
import { MapPin, Building2 } from 'lucide-react'

interface StatementCardProps {
  statement: StatementWithRelations
}

const OFFICIAL_IDS = new Set(Object.values(OFFICIAL_CHANNELS))

export function StatementCard({ statement }: StatementCardProps) {
  const { politicians: politician, statement_categories } = statement
  const primaryCat = statement_categories.find((sc) => sc.is_primary)?.categories
  const allCats = statement_categories.map((sc) => sc.categories)
  const isOfficial = statement.youtube_channel_id
    ? OFFICIAL_IDS.has(statement.youtube_channel_id)
    : false

  const permalink = statement.slug
    ? `/declaracao/${statement.slug}`
    : `/declaracao/${statement.id}`

  return (
    <article className="bg-white border border-gray-200 rounded-xl p-5 hover:shadow-md transition-shadow flex flex-col gap-3">
      {/* Header */}
      <div className="flex items-start justify-between gap-2 flex-wrap">
        <Link
          href={`/politico/${politician.slug}`}
          className="flex items-center gap-2 hover:underline"
        >
          {politician.photo_url ? (
            <img
              src={politician.photo_url}
              alt={politician.common_name}
              className="w-8 h-8 rounded-full object-cover flex-shrink-0 border border-gray-200"
            />
          ) : (
            <div className="w-8 h-8 rounded-full bg-gray-200 flex-shrink-0 flex items-center justify-center text-sm font-bold text-gray-500">
              {politician.common_name[0]}
            </div>
          )}
          <div>
            <span className="font-semibold text-gray-900 text-sm">{politician.common_name}</span>
            <div className="flex items-center gap-1 text-xs text-gray-500">
              <span className="bg-gray-100 px-1.5 py-0.5 rounded font-mono">{politician.party}</span>
              {politician.state && (
                <>
                  <MapPin className="w-3 h-3" />
                  <span>{politician.state}</span>
                </>
              )}
            </div>
          </div>
        </Link>

        <div className="flex items-center gap-2 flex-shrink-0">
          <time className="text-xs text-gray-500" dateTime={statement.statement_date}>
            {formatDateShort(statement.statement_date)}
            {statement.statement_date_approx && (
              <span className="ml-1 text-gray-400 italic">aprox.</span>
            )}
          </time>
          <VerificationBadge status={statement.verification_status} />
        </div>
      </div>

      {/* Summary */}
      <Link href={permalink} className="hover:underline">
        <p className="text-gray-800 text-sm leading-relaxed line-clamp-3">{statement.summary}</p>
      </Link>

      {/* Quote excerpt */}
      {statement.full_quote && (
        <blockquote className="border-l-2 border-gray-300 pl-3 text-sm text-gray-600 italic line-clamp-2">
          "{statement.full_quote}"
        </blockquote>
      )}

      {/* Venue */}
      {statement.venue && (
        <div className="flex items-center gap-1 text-xs text-gray-500">
          <Building2 className="w-3 h-3" />
          <span>{statement.venue}</span>
          {statement.event_name && <span>— {statement.event_name}</span>}
        </div>
      )}

      {/* Categories */}
      <div className="flex flex-wrap gap-1.5">
        {allCats.map((cat) => (
          <Link key={cat.slug} href={`/categorias/${cat.slug}`}>
            <CategoryTag category={cat} size="sm" />
          </Link>
        ))}
      </div>

      {/* Primary source — most important */}
      <div className="pt-1 border-t border-gray-100">
        <SourceLink
          url={statement.primary_source_url}
          type={statement.primary_source_type}
          videoId={statement.youtube_video_id}
          timestampSec={statement.youtube_timestamp_sec}
          isOfficial={isOfficial}
        />
      </div>
    </article>
  )
}
