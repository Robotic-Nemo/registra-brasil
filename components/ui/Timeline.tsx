import type { ReactNode } from 'react'

interface TimelineItem {
  id: string
  date?: string
  icon?: ReactNode
  title: ReactNode
  content?: ReactNode
}

interface Props {
  items: TimelineItem[]
  className?: string
}

export function Timeline({ items, className = '' }: Props) {
  if (items.length === 0) return null

  return (
    <div className={`relative ${className}`}>
      {/* Vertical line */}
      <div className="absolute left-4 top-0 bottom-0 w-px bg-gray-200" aria-hidden="true" />

      <ol className="flex flex-col gap-6">
        {items.map((item) => (
          <li key={item.id} className="relative pl-10">
            {/* Dot / icon */}
            <div className="absolute left-0 w-8 h-8 rounded-full bg-white border-2 border-gray-300 flex items-center justify-center z-10">
              {item.icon ?? (
                <div className="w-2.5 h-2.5 rounded-full bg-gray-400" />
              )}
            </div>

            {/* Content */}
            <div>
              {item.date && (
                <time className="text-xs text-gray-400 block mb-0.5" dateTime={item.date}>
                  {item.date}
                </time>
              )}
              <div className="text-sm font-medium text-gray-900">{item.title}</div>
              {item.content && (
                <div className="text-sm text-gray-600 mt-1">{item.content}</div>
              )}
            </div>
          </li>
        ))}
      </ol>
    </div>
  )
}
