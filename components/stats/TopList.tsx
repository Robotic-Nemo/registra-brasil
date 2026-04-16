import Link from 'next/link'

export interface TopListItem {
  rank: number
  label: string
  value: number
  subtitle?: string
  href?: string
  imageUrl?: string
  color?: string
}

interface Props {
  items: TopListItem[]
  title?: string
  valueLabel?: string
  maxItems?: number
}

export function TopList({ items, title, valueLabel = 'declaracoes', maxItems = 10 }: Props) {
  const displayed = items.slice(0, maxItems)
  const maxValue = displayed[0]?.value ?? 1

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      {title && <h3 className="text-sm font-semibold text-gray-700 mb-4">{title}</h3>}
      <ol className="space-y-1" aria-label={title ?? 'Ranking'}>
        {displayed.map((item, i) => {
          const barWidth = (item.value / maxValue) * 100
          const rank = item.rank ?? i + 1

          const inner = (
            <div className="relative flex items-center gap-3 px-3 py-2 rounded-lg hover:bg-gray-50 transition-colors">
              <div
                className="absolute inset-0 rounded-lg opacity-10"
                style={{
                  width: `${barWidth}%`,
                  backgroundColor: item.color ?? '#3b82f6',
                }}
              />
              <span className="relative text-sm text-gray-400 font-medium tabular-nums w-6 text-right">
                {rank}.
              </span>
              {item.imageUrl && (
                <img
                  src={item.imageUrl}
                  alt=""
                  className="relative w-7 h-7 rounded-full object-cover bg-gray-100"
                />
              )}
              <div className="relative flex-1 min-w-0">
                <div className="text-sm font-medium text-gray-900 truncate">{item.label}</div>
                {item.subtitle && (
                  <div className="text-xs text-gray-500">{item.subtitle}</div>
                )}
              </div>
              <div className="relative text-right">
                <span className="text-sm font-bold text-gray-900 tabular-nums">
                  {item.value.toLocaleString('pt-BR')}
                </span>
                <span className="text-xs text-gray-400 ml-1">{valueLabel}</span>
              </div>
            </div>
          )

          return (
            <li key={item.label + rank}>
              {item.href ? (
                <Link href={item.href} className="block">
                  {inner}
                </Link>
              ) : (
                inner
              )}
            </li>
          )
        })}
      </ol>
    </div>
  )
}
