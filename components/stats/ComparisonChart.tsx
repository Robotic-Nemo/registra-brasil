interface ComparisonItem {
  label: string
  valueA: number
  valueB: number
}

interface Props {
  items: ComparisonItem[]
  labelA: string
  labelB: string
  colorA?: string
  colorB?: string
  maxItems?: number
}

export function ComparisonChart({
  items,
  labelA,
  labelB,
  colorA = '#3b82f6',
  colorB = '#ef4444',
  maxItems = 10,
}: Props) {
  const displayed = items.slice(0, maxItems)
  const maxValue = Math.max(...displayed.flatMap((d) => [d.valueA, d.valueB]), 1)

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      <div className="flex items-center gap-4 mb-4">
        <div className="flex items-center gap-1.5">
          <div className="w-3 h-3 rounded-full" style={{ backgroundColor: colorA }} />
          <span className="text-xs text-gray-600">{labelA}</span>
        </div>
        <div className="flex items-center gap-1.5">
          <div className="w-3 h-3 rounded-full" style={{ backgroundColor: colorB }} />
          <span className="text-xs text-gray-600">{labelB}</span>
        </div>
      </div>

      <div className="space-y-3">
        {displayed.map((item) => (
          <div key={item.label}>
            <div className="text-sm text-gray-700 font-medium mb-1">{item.label}</div>
            <div className="flex items-center gap-2">
              <div className="flex-1 flex items-center gap-1">
                <div
                  className="h-5 rounded-r transition-all"
                  style={{
                    width: `${(item.valueA / maxValue) * 100}%`,
                    backgroundColor: colorA,
                    minWidth: item.valueA > 0 ? 4 : 0,
                  }}
                />
                <span className="text-xs text-gray-500 tabular-nums">{item.valueA}</span>
              </div>
              <div className="flex-1 flex items-center gap-1">
                <div
                  className="h-5 rounded-r transition-all"
                  style={{
                    width: `${(item.valueB / maxValue) * 100}%`,
                    backgroundColor: colorB,
                    minWidth: item.valueB > 0 ? 4 : 0,
                  }}
                />
                <span className="text-xs text-gray-500 tabular-nums">{item.valueB}</span>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
