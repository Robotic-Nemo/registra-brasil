'use client'

import { useState } from 'react'
import Link from 'next/link'

interface TimelineEntry {
  id: string
  summary: string
  statement_date: string
  politician_name: string
  politician_slug: string
  politician_party: string
}

interface Props {
  monthKey: string
  monthLabel: string
  entries: TimelineEntry[]
  defaultExpanded?: boolean
}

export function MonthGroup({ monthKey, monthLabel, entries, defaultExpanded = true }: Props) {
  const [expanded, setExpanded] = useState(defaultExpanded)

  return (
    <section>
      <button
        onClick={() => setExpanded(!expanded)}
        className="flex items-center gap-2 text-lg font-semibold text-gray-800 sticky top-16 bg-white/90 backdrop-blur py-2 z-10 border-b border-gray-100 w-full text-left"
        aria-expanded={expanded}
      >
        <svg
          className={`w-4 h-4 text-gray-400 transition-transform ${expanded ? 'rotate-90' : ''}`}
          viewBox="0 0 16 16"
          fill="currentColor"
        >
          <path d="M6 3l5 5-5 5V3z" />
        </svg>
        {monthLabel}
        <span className="text-sm font-normal text-gray-400 ml-1">
          ({entries.length} {entries.length === 1 ? 'declaracao' : 'declaracoes'})
        </span>
      </button>

      {expanded && (
        <div className="space-y-2 mt-2 pl-6 border-l-2 border-gray-100">
          {entries.map((entry) => (
            <Link
              key={entry.id}
              href={`/declaracao/${entry.id}`}
              className="block bg-white border border-gray-200 rounded-lg px-4 py-3 hover:border-blue-300 transition-colors"
            >
              <div className="flex items-center justify-between gap-2 mb-1">
                <time className="text-xs text-gray-400 tabular-nums">{entry.statement_date}</time>
                <Link
                  href={`/politico/${entry.politician_slug}`}
                  className="text-xs text-gray-500 hover:text-blue-600"
                  onClick={(e) => e.stopPropagation()}
                >
                  {entry.politician_name} ({entry.politician_party})
                </Link>
              </div>
              <p className="text-sm text-gray-700 line-clamp-2">{entry.summary}</p>
            </Link>
          ))}
        </div>
      )}
    </section>
  )
}
