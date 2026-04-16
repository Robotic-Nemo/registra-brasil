interface SummaryItem {
  label: string
  value: string | number
  description?: string
}

interface Props {
  items: SummaryItem[]
}

export function StatsSummary({ items }: Props) {
  return (
    <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-3">
      {items.map((item) => (
        <div
          key={item.label}
          className="bg-white border border-gray-200 rounded-lg p-4 text-center"
        >
          <div className="text-2xl font-bold text-gray-900 tabular-nums">
            {typeof item.value === 'number' ? item.value.toLocaleString('pt-BR') : item.value}
          </div>
          <div className="text-sm text-gray-600 mt-1">{item.label}</div>
          {item.description && (
            <div className="text-xs text-gray-400 mt-0.5">{item.description}</div>
          )}
        </div>
      ))}
    </div>
  )
}
