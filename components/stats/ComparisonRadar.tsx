interface RadarDataPoint {
  label: string
  values: number[]
}

interface ComparisonRadarProps {
  data: RadarDataPoint[]
  labels: string[]
  colors?: string[]
  size?: number
  className?: string
}

export function ComparisonRadar({
  data,
  labels,
  colors = ['#3b82f6', '#ef4444', '#10b981'],
  size = 280,
  className = '',
}: ComparisonRadarProps) {
  if (data.length === 0 || labels.length === 0) return null

  const center = size / 2
  const radius = size / 2 - 40
  const angleStep = (2 * Math.PI) / data.length
  const levels = 4

  // Find max across all values for normalization
  const maxValue = Math.max(...data.flatMap(d => d.values), 1)

  // Generate axis lines and labels
  const axes = data.map((d, i) => {
    const angle = i * angleStep - Math.PI / 2
    const x = center + radius * Math.cos(angle)
    const y = center + radius * Math.sin(angle)
    const labelX = center + (radius + 20) * Math.cos(angle)
    const labelY = center + (radius + 20) * Math.sin(angle)

    return { x, y, labelX, labelY, label: d.label, angle }
  })

  // Generate polygons for each person
  const polygons = labels.map((_, personIdx) => {
    const points = data.map((d, i) => {
      const value = d.values[personIdx] ?? 0
      const normalized = value / maxValue
      const angle = i * angleStep - Math.PI / 2
      return {
        x: center + radius * normalized * Math.cos(angle),
        y: center + radius * normalized * Math.sin(angle),
      }
    })
    return points.map(p => `${p.x},${p.y}`).join(' ')
  })

  return (
    <div className={className}>
      <svg width={size} height={size} viewBox={`0 0 ${size} ${size}`}>
        {/* Grid circles */}
        {Array.from({ length: levels }, (_, i) => {
          const r = (radius / levels) * (i + 1)
          const points = data.map((_, j) => {
            const angle = j * angleStep - Math.PI / 2
            return `${center + r * Math.cos(angle)},${center + r * Math.sin(angle)}`
          })
          return (
            <polygon
              key={i}
              points={points.join(' ')}
              fill="none"
              stroke="#e4e4e7"
              strokeWidth={0.5}
            />
          )
        })}

        {/* Axis lines */}
        {axes.map((axis, i) => (
          <line
            key={i}
            x1={center}
            y1={center}
            x2={axis.x}
            y2={axis.y}
            stroke="#e4e4e7"
            strokeWidth={0.5}
          />
        ))}

        {/* Data polygons */}
        {polygons.map((points, i) => (
          <polygon
            key={i}
            points={points}
            fill={colors[i % colors.length]}
            fillOpacity={0.15}
            stroke={colors[i % colors.length]}
            strokeWidth={1.5}
          />
        ))}

        {/* Axis labels */}
        {axes.map((axis, i) => (
          <text
            key={i}
            x={axis.labelX}
            y={axis.labelY}
            textAnchor="middle"
            dominantBaseline="middle"
            className="text-[10px] fill-zinc-500"
          >
            {axis.label}
          </text>
        ))}
      </svg>

      {/* Legend */}
      <div className="flex items-center justify-center gap-4 mt-2">
        {labels.map((label, i) => (
          <div key={label} className="flex items-center gap-1.5">
            <div
              className="w-3 h-3 rounded-full"
              style={{ backgroundColor: colors[i % colors.length] }}
            />
            <span className="text-xs text-zinc-600">{label}</span>
          </div>
        ))}
      </div>
    </div>
  )
}
