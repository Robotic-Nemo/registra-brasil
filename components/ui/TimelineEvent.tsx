import Link from 'next/link'

interface Props {
  date: string
  title: string
  description?: string
  href?: string
  metadata?: { label: string; value: string }[]
  dotColor?: string
}

export function TimelineEvent({ date, title, description, href, metadata, dotColor = '#3b82f6' }: Props) {
  const content = (
    <div className="bg-white border border-gray-200 rounded-lg p-3 hover:border-blue-300 transition-colors">
      <div className="flex items-center justify-between gap-2 mb-1">
        <time className="text-xs text-gray-400 tabular-nums">{date}</time>
        {metadata && metadata.length > 0 && (
          <div className="flex items-center gap-2">
            {metadata.map((m) => (
              <span key={m.label} className="text-[10px] text-gray-500">
                <span className="font-medium">{m.label}:</span> {m.value}
              </span>
            ))}
          </div>
        )}
      </div>
      <h4 className="text-sm font-medium text-gray-900">{title}</h4>
      {description && (
        <p className="text-sm text-gray-600 mt-0.5 line-clamp-2">{description}</p>
      )}
    </div>
  )

  return (
    <div className="relative pl-6">
      <div
        className="absolute left-0 top-3 w-3 h-3 rounded-full border-2 border-white"
        style={{ backgroundColor: dotColor }}
      />
      {href ? (
        <Link href={href} className="block">
          {content}
        </Link>
      ) : (
        content
      )}
    </div>
  )
}
