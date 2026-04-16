import type { ReactNode } from 'react'

type TimelineColor = 'blue' | 'green' | 'red' | 'amber' | 'gray'

interface TimelineItem {
  id: string
  date: string
  title: ReactNode
  content?: ReactNode
  icon?: ReactNode
  color?: TimelineColor
}

interface Props {
  items: TimelineItem[]
  /** Group items by date (year-month) */
  groupByDate?: boolean
  className?: string
}

const COLOR_MAP: Record<TimelineColor, { dot: string; border: string }> = {
  blue: { dot: 'bg-blue-500', border: 'border-blue-300' },
  green: { dot: 'bg-green-500', border: 'border-green-300' },
  red: { dot: 'bg-red-500', border: 'border-red-300' },
  amber: { dot: 'bg-amber-500', border: 'border-amber-300' },
  gray: { dot: 'bg-gray-400', border: 'border-gray-300' },
}

function groupItems(items: TimelineItem[]): Map<string, TimelineItem[]> {
  const groups = new Map<string, TimelineItem[]>()
  for (const item of items) {
    const key = item.date.slice(0, 7) // YYYY-MM
    const existing = groups.get(key) ?? []
    existing.push(item)
    groups.set(key, existing)
  }
  return groups
}

function formatGroupLabel(key: string): string {
  const [year, month] = key.split('-')
  const months = [
    'Janeiro', 'Fevereiro', 'Marco', 'Abril', 'Maio', 'Junho',
    'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro',
  ]
  const monthName = months[parseInt(month, 10) - 1] ?? month
  return `${monthName} ${year}`
}

function TimelineEntry({ item }: { item: TimelineItem }) {
  const { dot, border } = COLOR_MAP[item.color ?? 'gray']

  return (
    <li className="relative pl-10">
      <div
        className={`absolute left-0 w-8 h-8 rounded-full bg-white border-2 ${border} flex items-center justify-center z-10`}
      >
        {item.icon ?? <div className={`w-2.5 h-2.5 rounded-full ${dot}`} />}
      </div>
      <time className="text-xs text-gray-400 block mb-0.5">{item.date}</time>
      <div className="text-sm font-medium text-gray-900">{item.title}</div>
      {item.content && <div className="text-sm text-gray-600 mt-1">{item.content}</div>}
    </li>
  )
}

/**
 * Enhanced timeline with icons, colors, and optional date grouping.
 */
export function Timeline2({ items, groupByDate = false, className = '' }: Props) {
  if (items.length === 0) return null

  if (!groupByDate) {
    return (
      <div className={`relative ${className}`}>
        <div className="absolute left-4 top-0 bottom-0 w-px bg-gray-200" aria-hidden="true" />
        <ol className="flex flex-col gap-6">
          {items.map((item) => (
            <TimelineEntry key={item.id} item={item} />
          ))}
        </ol>
      </div>
    )
  }

  const groups = groupItems(items)

  return (
    <div className={`flex flex-col gap-8 ${className}`}>
      {Array.from(groups.entries()).map(([key, groupItems]) => (
        <section key={key}>
          <h3 className="text-sm font-semibold text-gray-700 mb-4">{formatGroupLabel(key)}</h3>
          <div className="relative">
            <div className="absolute left-4 top-0 bottom-0 w-px bg-gray-200" aria-hidden="true" />
            <ol className="flex flex-col gap-6">
              {groupItems.map((item) => (
                <TimelineEntry key={item.id} item={item} />
              ))}
            </ol>
          </div>
        </section>
      ))}
    </div>
  )
}
