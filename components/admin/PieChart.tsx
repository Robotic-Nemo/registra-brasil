'use client'

import { getChartColors } from '@/lib/utils/chart-data'
import type { DataPoint } from '@/lib/utils/chart-data'

interface PieChartProps {
  data: DataPoint[]
  size?: number
  donut?: boolean
  showLegend?: boolean
}

export function PieChart({ data, size = 200, donut = true, showLegend = true }: PieChartProps) {
  if (data.length === 0) {
    return <p className="text-sm text-gray-500 text-center py-8">Sem dados para exibir.</p>
  }

  const total = data.reduce((sum, d) => sum + d.value, 0)
  if (total === 0) return null

  const colors = getChartColors(data.length)
  const cx = size / 2
  const cy = size / 2
  const radius = size / 2 - 10
  const innerRadius = donut ? radius * 0.55 : 0

  let cumAngle = -Math.PI / 2
  const slices = data.map((d, i) => {
    const angle = (d.value / total) * 2 * Math.PI
    const startAngle = cumAngle
    const endAngle = cumAngle + angle
    cumAngle = endAngle

    const largeArc = angle > Math.PI ? 1 : 0

    const x1 = cx + radius * Math.cos(startAngle)
    const y1 = cy + radius * Math.sin(startAngle)
    const x2 = cx + radius * Math.cos(endAngle)
    const y2 = cy + radius * Math.sin(endAngle)

    const ix1 = cx + innerRadius * Math.cos(startAngle)
    const iy1 = cy + innerRadius * Math.sin(startAngle)
    const ix2 = cx + innerRadius * Math.cos(endAngle)
    const iy2 = cy + innerRadius * Math.sin(endAngle)

    const path = donut
      ? `M ${x1} ${y1} A ${radius} ${radius} 0 ${largeArc} 1 ${x2} ${y2} L ${ix2} ${iy2} A ${innerRadius} ${innerRadius} 0 ${largeArc} 0 ${ix1} ${iy1} Z`
      : `M ${cx} ${cy} L ${x1} ${y1} A ${radius} ${radius} 0 ${largeArc} 1 ${x2} ${y2} Z`

    return {
      path,
      color: d.color ?? colors[i],
      label: d.label,
      value: d.value,
      pct: Math.round((d.value / total) * 100),
    }
  })

  return (
    <div className="flex items-center gap-6">
      <svg width={size} height={size} viewBox={`0 0 ${size} ${size}`} className="shrink-0">
        {slices.map((s, i) => (
          <path key={i} d={s.path} fill={s.color} className="hover:opacity-80 transition-opacity">
            <title>{`${s.label}: ${s.value} (${s.pct}%)`}</title>
          </path>
        ))}
        {donut && (
          <text x={cx} y={cy} textAnchor="middle" dominantBaseline="middle" className="text-lg font-bold fill-gray-700">
            {total}
          </text>
        )}
      </svg>

      {showLegend && (
        <ul className="space-y-1.5 text-sm min-w-0">
          {slices.map((s, i) => (
            <li key={i} className="flex items-center gap-2">
              <span className="w-3 h-3 rounded-sm shrink-0" style={{ backgroundColor: s.color }} />
              <span className="text-gray-700 truncate">{s.label}</span>
              <span className="text-gray-400 tabular-nums ml-auto">{s.pct}%</span>
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}
