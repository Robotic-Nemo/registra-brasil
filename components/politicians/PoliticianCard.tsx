import Link from 'next/link'
import Image from 'next/image'
import type { Politician } from '@/types/database'
import { MapPin } from 'lucide-react'
import { getPartyColor } from '@/lib/constants/party-colors'

type PoliticianCardProps = {
  politician: Pick<Politician, 'slug' | 'common_name' | 'full_name' | 'party' | 'state' | 'photo_url'>
  statementCount?: number
}

export function PoliticianCard({ politician, statementCount }: PoliticianCardProps) {
  return (
    <Link
      href={`/politico/${politician.slug}`}
      className="flex items-center gap-3 p-3 border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors"
      data-testid="politician-card"
    >
      {politician.photo_url ? (
        <Image
          src={politician.photo_url}
          alt={politician.common_name}
          width={40}
          height={40}
          sizes="40px"
          className="w-10 h-10 rounded-full object-cover border border-gray-200"
          loading="eager"
          fetchPriority="high"
        />
      ) : (
        <div className="w-10 h-10 rounded-full bg-gray-200 flex items-center justify-center text-sm font-bold text-gray-500">
          {politician.common_name?.[0] ?? '?'}
        </div>
      )}
      <div className="flex-1 min-w-0">
        <p className="font-medium text-gray-900 text-sm truncate" translate="no" title={politician.common_name}>{politician.common_name}</p>
        <div className="flex items-center gap-1.5 text-xs text-gray-500">
          <span
            className="px-1.5 py-0.5 rounded font-mono text-white"
            style={{ backgroundColor: getPartyColor(politician.party) }}
          >
            <span translate="no">{politician.party}</span>
          </span>
          {politician.state && (
            <>
              <MapPin className="w-3 h-3" />
              <span>{politician.state}</span>
            </>
          )}
        </div>
      </div>
      {statementCount != null && (
        <span className="text-xs bg-red-50 text-red-600 border border-red-100 px-2 py-1 rounded font-medium tabular-nums">
          {statementCount}
        </span>
      )}
    </Link>
  )
}
