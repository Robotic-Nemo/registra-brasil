import Link from 'next/link'
import Image from 'next/image'
import type { Politician } from '@/types/database'
import { getPartyColor } from '@/lib/constants/party-colors'

type PoliticianCompactProps = {
  politician: Pick<Politician, 'slug' | 'common_name' | 'party' | 'photo_url'>
  /** Optional extra text shown after the party badge */
  detail?: string
}

/**
 * Compact horizontal politician card for inline use within lists,
 * statement cards, or comparison sections.
 */
export function PoliticianCompact({ politician, detail }: PoliticianCompactProps) {
  return (
    <Link
      href={`/politico/${politician.slug}`}
      className="inline-flex items-center gap-2 px-2 py-1 rounded-lg hover:bg-gray-100 transition-colors group"
    >
      {politician.photo_url ? (
        <Image
          src={politician.photo_url}
          alt={politician.common_name}
          width={24}
          height={24}
          sizes="24px"
          className="w-6 h-6 rounded-full object-cover border border-gray-200"
        />
      ) : (
        <span className="w-6 h-6 rounded-full bg-gray-200 flex items-center justify-center text-[10px] font-bold text-gray-500">
          {politician.common_name?.[0] ?? '?'}
        </span>
      )}
      <span className="text-sm font-medium text-gray-900 group-hover:text-blue-700 transition-colors truncate" translate="no">
        {politician.common_name}
      </span>
      <span
        className="text-[10px] px-1 py-0.5 rounded font-mono text-white leading-none"
        style={{ backgroundColor: getPartyColor(politician.party) }}
        translate="no"
      >
        {politician.party}
      </span>
      {detail && (
        <span className="text-xs text-gray-400">{detail}</span>
      )}
    </Link>
  )
}
