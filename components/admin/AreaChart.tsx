'use client'

import type { TimeSeriesPoint } from '@/lib/utils/chart-data'

interface AreaChartProps {
  data: TimeSeriesPoint[]
  width?: number
  height?: number
  color?: string
  fillOpacity?: number
}

export function AreaChart({
  data,
  width = 600,
  height = 200,
  color = '#3B82F6',
  fillOpacity = 0.15,
}: AreaChartProps) {
  if (data.length === 0) {
    return <p className="text-sm text-gray-500 text-center py-8">Sem dados para exibir.</p>
  }

  const padding = { top: 20, right: 20, bottom: 40, left: 45 }
  const innerWidth = width - padding.left - padding.right
  const innerHeight = height - padding.top - padding.bottom

  const maxVal = Math.max(...data.map((d) => d.value), 1)

  function xPos(i: number): number {
    return padding.left + (i / Math.max(data.length - 1, 1)) * innerWidth
  }

  function yPos(val: number): number {
    return padding.top + innerHeight - (val / maxVal) * innerHeight
  }

  const baseline = padding.top + innerHeight

  // Line path
  const linePath = data
    .map((d, i) => `${i === 0 ? 'M' : 'L'} ${xPos(i)} ${yPos(d.value)}`)
    .join(' ')

  // Area path
  const areaPath = `${linePath} L ${xPos(data.length - 1)} ${baseline} L ${xPos(0)} ${baseline} Z`

  // Y-axis ticks
  const yTicks = [0, 0.25, 0.5, 0.75, 1].map((t) => ({
    value: Math.round(t * maxVal),
    y: padding.top + innerHeight * (1 - t),
  }))

  return (
    <svg viewBox={`0 0 ${width} ${height}`} className="w-full h-auto">
      {/* Grid */}
      {yTicks.map((tick) => (
        <g key={tick.value}>
          <line
            x1={padding.left}
            y1={tick.y}
            x2={width - padding.right}
            y2={tick.y}
            stroke="#e5e7eb"
            strokeDasharray="4,4"
          />
          <text
            x={padding.left - 8}
            y={tick.y + 4}
            textAnchor="end"
            className="text-[10px] fill-gray-400"
          >
            {tick.value}
          </text>
        </g>
      ))}

      {/* Area fill */}
      <path d={areaPath} fill={color} opacity={fillOpacity} />

      {/* Line */}
      <path
        d={linePath}
        fill="none"
        stroke={color}
        strokeWidth={2}
        strokeLinecap="round"
        strokeLinejoin="round"
      />

      {/* Data points */}
      {data.map((d, i) => (
        <g key={d.date}>
          <circle cx={xPos(i)} cy={yPos(d.value)} r={2.5} fill={color} />
          <title>{`${d.date}: ${d.value}`}</title>
        </g>
      ))}

      {/* X-axis labels */}
      {data.map((d, i) => {
        const step = Math.max(Math.ceil(data.length / 8), 1)
        if (i % step !== 0 && i !== data.length - 1) return null
        return (
          <text
            key={d.date}
            x={xPos(i)}
            y={height - padding.bottom + 16}
            textAnchor="middle"
            className="text-[9px] fill-gray-400"
          >
            {formatLabel(d.date)}
          </text>
        )
      })}
    </svg>
  )
}

function formatLabel(dateStr: string): string {
  if (dateStr.length === 7) {
    const [y, m] = dateStr.split('-')
    return `${m}/${y.slice(2)}`
  }
  const d = new Date(dateStr + 'T00:00:00')
  return `${d.getDate().toString().padStart(2, '0')}/${(d.getMonth() + 1).toString().padStart(2, '0')}`
}
