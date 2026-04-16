interface TrendPoint {
  period: string
  count: number
}

interface TrendLine {
  label: string
  data: TrendPoint[]
  color?: string
}

interface Props {
  lines: TrendLine[]
  height?: number
}

function formatMonth(period: string): string {
  const [year, month] = period.split('-')
  const monthNames = ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez']
  return `${monthNames[parseInt(month) - 1]}/${year?.slice(2)}`
}

export function TrendChart({ lines, height = 200 }: Props) {
  if (lines.length === 0) return null

  const allCounts = lines.flatMap((l) => l.data.map((d) => d.count))
  const maxCount = Math.max(...allCounts, 1)
  const periods = lines[0]?.data.map((d) => d.period) ?? []

  const defaultColors = ['#3b82f6', '#ef4444', '#10b981', '#f59e0b', '#8b5cf6', '#ec4899']

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      {lines.length > 1 && (
        <div className="flex flex-wrap gap-4 mb-4">
          {lines.map((line, i) => (
            <div key={line.label} className="flex items-center gap-1.5">
              <div
                className="w-3 h-3 rounded-full"
                style={{ backgroundColor: line.color ?? defaultColors[i % defaultColors.length] }}
              />
              <span className="text-xs text-gray-600">{line.label}</span>
            </div>
          ))}
        </div>
      )}

      <div className="relative" style={{ height }}>
        {/* Grid lines */}
        {[0, 0.25, 0.5, 0.75, 1].map((ratio) => (
          <div
            key={ratio}
            className="absolute left-0 right-0 border-t border-gray-100"
            style={{ bottom: `${ratio * 100}%` }}
          >
            <span className="absolute -left-1 -translate-x-full text-[10px] text-gray-400 tabular-nums -translate-y-1/2">
              {Math.round(maxCount * ratio)}
            </span>
          </div>
        ))}

        {/* SVG lines */}
        <svg viewBox={`0 0 ${periods.length - 1} ${maxCount}`} className="absolute inset-0 w-full h-full" preserveAspectRatio="none">
          {lines.map((line, lineIdx) => {
            const points = line.data
              .map((d, i) => `${i},${maxCount - d.count}`)
              .join(' ')
            return (
              <polyline
                key={line.label}
                points={points}
                fill="none"
                stroke={line.color ?? defaultColors[lineIdx % defaultColors.length]}
                strokeWidth={maxCount * 0.02}
                strokeLinejoin="round"
                strokeLinecap="round"
              />
            )
          })}
        </svg>
      </div>

      {/* X-axis labels */}
      {periods.length <= 24 && (
        <div className="flex justify-between mt-2">
          {periods
            .filter((_, i) => i % Math.ceil(periods.length / 12) === 0 || i === periods.length - 1)
            .map((p) => (
              <span key={p} className="text-[10px] text-gray-400 tabular-nums">
                {formatMonth(p)}
              </span>
            ))}
        </div>
      )}
    </div>
  )
}
