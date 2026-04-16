'use client'

import type { WeeklyCount } from '@/lib/supabase/queries/dashboard'

interface DashboardChartProps {
  data: WeeklyCount[]
  title?: string
}

export function DashboardChart({ data, title = 'Declaracoes por semana' }: DashboardChartProps) {
  if (data.length === 0) return null

  const maxCount = Math.max(...data.map((d) => d.count), 1)
  const chartWidth = 600
  const chartHeight = 200
  const padding = { top: 20, right: 20, bottom: 40, left: 40 }
  const innerWidth = chartWidth - padding.left - padding.right
  const innerHeight = chartHeight - padding.top - padding.bottom
  const barWidth = Math.max(innerWidth / data.length - 4, 8)

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      <h3 className="text-sm font-semibold text-gray-700 mb-4">{title}</h3>
      <svg
        viewBox={`0 0 ${chartWidth} ${chartHeight}`}
        className="w-full h-auto"
        aria-label={title}
      >
        {/* Y-axis gridlines */}
        {[0, 0.25, 0.5, 0.75, 1].map((tick) => {
          const y = padding.top + innerHeight * (1 - tick)
          return (
            <g key={tick}>
              <line
                x1={padding.left}
                y1={y}
                x2={chartWidth - padding.right}
                y2={y}
                stroke="#e5e7eb"
                strokeDasharray={tick === 0 ? undefined : '4,4'}
              />
              <text
                x={padding.left - 8}
                y={y + 4}
                textAnchor="end"
                className="text-[10px] fill-gray-400"
              >
                {Math.round(maxCount * tick)}
              </text>
            </g>
          )
        })}

        {/* Bars */}
        {data.map((d, i) => {
          const x = padding.left + (innerWidth / data.length) * i + (innerWidth / data.length - barWidth) / 2
          const barHeight = (d.count / maxCount) * innerHeight
          const y = padding.top + innerHeight - barHeight
          return (
            <g key={d.week}>
              <rect
                x={x}
                y={y}
                width={barWidth}
                height={barHeight}
                rx={3}
                className="fill-blue-500 hover:fill-blue-600 transition-colors"
              />
              {/* X-axis label */}
              {i % 2 === 0 && (
                <text
                  x={x + barWidth / 2}
                  y={chartHeight - padding.bottom + 16}
                  textAnchor="middle"
                  className="text-[9px] fill-gray-400"
                >
                  {formatWeekLabel(d.week)}
                </text>
              )}
              {/* Value on hover area */}
              <title>{`${formatWeekLabel(d.week)}: ${d.count} declaracao(es)`}</title>
            </g>
          )
        })}
      </svg>
    </div>
  )
}

function formatWeekLabel(isoDate: string): string {
  const d = new Date(isoDate + 'T00:00:00')
  return `${d.getDate().toString().padStart(2, '0')}/${(d.getMonth() + 1).toString().padStart(2, '0')}`
}
