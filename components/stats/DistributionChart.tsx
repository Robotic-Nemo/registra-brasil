import Link from 'next/link'

export interface DistributionItem {
  label: string
  value: number
  percentage: number
  color?: string
  href?: string
}

interface Props {
  items: DistributionItem[]
  maxItems?: number
  title?: string
}

export function DistributionChart({ items, maxItems = 15, title }: Props) {
  const displayed = items.slice(0, maxItems)
  const maxValue = displayed[0]?.value ?? 1

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      {title && <h3 className="text-sm font-semibold text-gray-700 mb-4">{title}</h3>}
      <div className="space-y-2" role="list" aria-label={title ?? 'Distribuicao'}>
        {displayed.map((item) => {
          const barWidth = (item.value / maxValue) * 100
          const inner = (
            <div className="relative" role="listitem">
              <div
                className="absolute inset-y-0 left-0 rounded-r opacity-15"
                style={{ width: `${barWidth}%`, backgroundColor: item.color ?? '#3b82f6' }}
              />
              <div className="relative flex items-center justify-between px-3 py-2">
                <span className="text-sm text-gray-800 font-medium truncate">{item.label}</span>
                <div className="flex items-center gap-2 ml-2 shrink-0">
                  <span className="text-xs text-gray-500 tabular-nums">
                    {item.percentage.toFixed(1)}%
                  </span>
                  <span className="text-sm font-semibold text-gray-900 tabular-nums min-w-[3ch] text-right">
                    {item.value.toLocaleString('pt-BR')}
                  </span>
                </div>
              </div>
            </div>
          )

          return item.href ? (
            <Link key={item.label} href={item.href} className="block hover:bg-gray-50 rounded transition-colors">
              {inner}
            </Link>
          ) : (
            <div key={item.label}>{inner}</div>
          )
        })}
      </div>
      {items.length > maxItems && (
        <p className="text-xs text-gray-400 mt-3 text-center">
          Exibindo {maxItems} de {items.length} itens
        </p>
      )}
    </div>
  )
}
