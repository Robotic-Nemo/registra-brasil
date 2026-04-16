import Link from 'next/link'

interface TimelineStatement {
  id: string
  summary: string
  statement_date: string
  politician_name: string
  politician_party: string
}

interface Props {
  statements: TimelineStatement[]
}

export function NarrativeTimeline({ statements }: Props) {
  return (
    <div className="relative">
      {/* Vertical line */}
      <div className="absolute left-3 top-0 bottom-0 w-0.5 bg-gray-200" />

      <div className="space-y-4">
        {statements.map((stmt, i) => (
          <div key={stmt.id} className="relative pl-8">
            {/* Dot */}
            <div className="absolute left-1.5 top-2 w-3 h-3 rounded-full bg-blue-500 border-2 border-white" />

            <Link
              href={`/declaracao/${stmt.id}`}
              className="block bg-white border border-gray-200 rounded-lg p-3 hover:border-blue-300 transition-colors"
            >
              <div className="flex items-center justify-between gap-2 mb-1">
                <time className="text-xs text-gray-400 tabular-nums">{stmt.statement_date}</time>
                <span className="text-xs text-gray-500">
                  {stmt.politician_name} ({stmt.politician_party})
                </span>
              </div>
              <p className="text-sm text-gray-700 line-clamp-2">{stmt.summary}</p>
            </Link>
          </div>
        ))}
      </div>
    </div>
  )
}
