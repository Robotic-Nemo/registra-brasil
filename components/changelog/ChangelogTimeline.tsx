import { sortChangelog, type ChangelogEntry } from '@/lib/utils/changelog'
import { ChangelogEntryComponent } from './ChangelogEntry'

interface ChangelogTimelineProps {
  entries: ChangelogEntry[]
}

export function ChangelogTimeline({ entries }: ChangelogTimelineProps) {
  const sorted = sortChangelog(entries)

  if (sorted.length === 0) {
    return (
      <p className="text-gray-500 dark:text-gray-400 text-center py-8">
        Nenhuma atualizacao registrada.
      </p>
    )
  }

  return (
    <div className="space-y-0" role="feed" aria-label="Historico de atualizacoes">
      {sorted.map((entry) => (
        <ChangelogEntryComponent key={entry.version} entry={entry} />
      ))}
    </div>
  )
}
