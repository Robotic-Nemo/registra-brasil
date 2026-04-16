import type { NarrativeThread } from '@/types/narrative'
import { formatDateRange } from '@/lib/utils/narrative'

interface Props {
  thread: NarrativeThread
}

export function NarrativeHeader({ thread }: Props) {
  return (
    <div className="bg-gradient-to-r from-blue-950 to-blue-900 rounded-xl p-6 text-white">
      <h1 className="text-xl font-bold mb-2">{thread.title}</h1>
      <p className="text-blue-200 text-sm mb-4">{thread.description}</p>

      <div className="flex flex-wrap items-center gap-4 text-sm">
        <div>
          <span className="text-blue-300">Periodo: </span>
          <span className="font-medium">
            {formatDateRange(thread.dateRange.start, thread.dateRange.end)}
          </span>
        </div>
        <div>
          <span className="text-blue-300">Declaracoes: </span>
          <span className="font-bold tabular-nums">{thread.statementCount}</span>
        </div>
        <div>
          <span className="text-blue-300">Politicos: </span>
          <span className="font-medium">
            {thread.politicians.map((p) => p.name).join(', ')}
          </span>
        </div>
      </div>

      <div className="flex flex-wrap gap-2 mt-4">
        {thread.categories.map((cat) => (
          <span
            key={cat.slug}
            className="text-xs font-medium px-2.5 py-1 rounded-full bg-white/10"
          >
            {cat.label}
          </span>
        ))}
      </div>
    </div>
  )
}
