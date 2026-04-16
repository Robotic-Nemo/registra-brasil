import type { ChangelogEntry as ChangelogEntryType } from '@/lib/utils/changelog'
import { formatVersion } from '@/lib/utils/changelog'

interface ChangelogEntryProps {
  entry: ChangelogEntryType
}

const typeColors: Record<string, string> = {
  feature: 'bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-400',
  fix: 'bg-red-100 text-red-800 dark:bg-red-900/30 dark:text-red-400',
  improvement: 'bg-blue-100 text-blue-800 dark:bg-blue-900/30 dark:text-blue-400',
  breaking: 'bg-orange-100 text-orange-800 dark:bg-orange-900/30 dark:text-orange-400',
}

const typeLabels: Record<string, string> = {
  feature: 'Novidade',
  fix: 'Correcao',
  improvement: 'Melhoria',
  breaking: 'Mudanca importante',
}

export function ChangelogEntryComponent({ entry }: ChangelogEntryProps) {
  return (
    <article className="relative pl-8 pb-8 border-l-2 border-gray-200 dark:border-gray-700 last:border-transparent">
      <div className="absolute left-[-5px] top-1 w-2 h-2 rounded-full bg-blue-500" aria-hidden="true" />
      <div className="flex flex-wrap items-center gap-2 mb-2">
        <span className="text-sm font-mono text-gray-500 dark:text-gray-400">
          {formatVersion(entry.version)}
        </span>
        <time className="text-sm text-gray-400 dark:text-gray-500" dateTime={entry.date}>
          {new Date(entry.date).toLocaleDateString('pt-BR')}
        </time>
        {entry.type && (
          <span className={`text-xs font-medium px-2 py-0.5 rounded-full ${typeColors[entry.type] || ''}`}>
            {typeLabels[entry.type] || entry.type}
          </span>
        )}
      </div>
      <h3 className="text-base font-semibold text-gray-900 dark:text-white mb-2">
        {entry.title}
      </h3>
      <ul className="space-y-1">
        {entry.changes.map((change, i) => (
          <li key={i} className="text-sm text-gray-600 dark:text-gray-400 flex gap-2">
            <span className="text-gray-300 dark:text-gray-600 shrink-0" aria-hidden="true">-</span>
            {change}
          </li>
        ))}
      </ul>
    </article>
  )
}
