import Link from 'next/link'
import type { NarrativeThread } from '@/types/narrative'
import { formatDateRange } from '@/lib/utils/narrative'

interface Props {
  thread: NarrativeThread
}

export function NarrativeCard({ thread }: Props) {
  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5 hover:border-blue-300 transition-colors">
      <div className="flex items-start justify-between gap-3 mb-3">
        <h3 className="text-base font-semibold text-gray-900 line-clamp-2">
          {thread.title}
        </h3>
        <span className="text-xs text-gray-500 whitespace-nowrap tabular-nums">
          {thread.statementCount} declaracoes
        </span>
      </div>

      <p className="text-sm text-gray-600 line-clamp-2 mb-3">{thread.description}</p>

      <div className="flex items-center gap-2 mb-3">
        <span className="text-xs text-gray-400">
          {formatDateRange(thread.dateRange.start, thread.dateRange.end)}
        </span>
      </div>

      <div className="flex flex-wrap gap-1.5">
        {thread.categories.slice(0, 3).map((cat) => (
          <span
            key={cat.slug}
            className="text-[10px] font-medium px-2 py-0.5 rounded-full"
            style={{ backgroundColor: cat.color + '20', color: cat.color }}
          >
            {cat.label}
          </span>
        ))}
        {thread.politicians.map((pol) => (
          <Link
            key={pol.id}
            href={`/politico/${pol.slug}`}
            className="text-[10px] font-medium px-2 py-0.5 rounded-full bg-gray-100 text-gray-600 hover:bg-gray-200 transition-colors"
          >
            {pol.name} ({pol.party})
          </Link>
        ))}
      </div>
    </div>
  )
}
