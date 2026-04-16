interface BarListItem {
  label: string
  value: number
  href?: string
  color?: string
}

interface BarListProps {
  items: BarListItem[]
  maxItems?: number
  valueFormatter?: (value: number) => string
  className?: string
}

export function BarList({
  items,
  maxItems = 10,
  valueFormatter = (v) => String(v),
  className = '',
}: BarListProps) {
  const sorted = [...items].sort((a, b) => b.value - a.value).slice(0, maxItems)
  const maxValue = sorted[0]?.value ?? 1

  return (
    <div className={`space-y-2 ${className}`} role="list" aria-label="Ranking">
      {sorted.map((item, i) => {
        const widthPercent = (item.value / maxValue) * 100

        const content = (
          <div className="relative" role="listitem">
            <div
              className="absolute inset-y-0 left-0 rounded-r"
              style={{
                width: `${widthPercent}%`,
                backgroundColor: item.color ?? '#dbeafe',
              }}
            />
            <div className="relative flex items-center justify-between px-3 py-1.5">
              <span className="text-sm text-zinc-800 font-medium truncate">
                <span className="text-zinc-400 mr-2 text-xs">{i + 1}.</span>
                {item.label}
              </span>
              <span className="text-sm text-zinc-600 font-semibold ml-2 tabular-nums">
                {valueFormatter(item.value)}
              </span>
            </div>
          </div>
        )

        if (item.href) {
          return (
            <a
              key={item.label}
              href={item.href}
              className="block hover:bg-zinc-50 rounded transition-colors"
            >
              {content}
            </a>
          )
        }

        return <div key={item.label}>{content}</div>
      })}
    </div>
  )
}
