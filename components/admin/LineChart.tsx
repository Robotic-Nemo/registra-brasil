'use client'

import type { TimeSeriesPoint } from '@/lib/utils/chart-data'

interface LineChartProps {
  data: TimeSeriesPoint[]
  width?: number
  height?: number
  color?: string
  showDots?: boolean
}

export function LineChart({
  data,
  width = 600,
  height = 200,
  color = '#3B82F6',
  showDots = true,
}: LineChartProps) {
  if (data.length === 0) {
    return <p className="text-sm text-gray-500 text-center py-8">Sem dados para exibir.</p>
  }

  const padding = { top: 20, right: 20, bottom: 40, left: 45 }
  const innerWidth = width - padding.left - padding.right
  const innerHeight = height - padding.top - padding.bottom

  const maxVal = Math.max(...data.map((d) => d.value), 1)
  const minVal = 0

  function x(i: number): number {
    return padding.left + (i / Math.max(data.length - 1, 1)) * innerWidth
  }

  function y(val: number): number {
    return padding.top + innerHeight - ((val - minVal) / (maxVal - minVal)) * innerHeight
  }

  const linePath = data.map((d, i) => `${i === 0 ? 'M' : 'L'} ${x(i)} ${y(d.value)}`).join(' ')

  // Y-axis ticks
  const yTicks = [0, 0.25, 0.5, 0.75, 1].map((t) => ({
    value: Math.round(minVal + t * (maxVal - minVal)),
    y: padding.top + innerHeight * (1 - t),
  }))

  return (
    <svg viewBox={`0 0 ${width} ${height}`} className="w-full h-auto">
      {/* Grid lines */}
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

      {/* Line */}
      <path d={linePath} fill="none" stroke={color} strokeWidth={2} strokeLinecap="round" strokeLinejoin="round" />

      {/* Dots */}
      {showDots && data.map((d, i) => (
        <g key={d.date}>
          <circle cx={x(i)} cy={y(d.value)} r={3} fill={color} />
          <title>{`${d.date}: ${d.value}`}</title>
        </g>
      ))}

      {/* X-axis labels */}
      {data.map((d, i) => {
        // Show every nth label to avoid overlap
        const step = Math.max(Math.ceil(data.length / 8), 1)
        if (i % step !== 0 && i !== data.length - 1) return null
        return (
          <text
            key={d.date}
            x={x(i)}
            y={height - padding.bottom + 16}
            textAnchor="middle"
            className="text-[9px] fill-gray-400"
          >
            {formatDateLabel(d.date)}
          </text>
        )
      })}
    </svg>
  )
}

function formatDateLabel(dateStr: string): string {
  if (dateStr.length === 7) {
    // YYYY-MM format
    const [y, m] = dateStr.split('-')
    return `${m}/${y.slice(2)}`
  }
  const d = new Date(dateStr + 'T00:00:00')
  return `${d.getDate().toString().padStart(2, '0')}/${(d.getMonth() + 1).toString().padStart(2, '0')}`
}
