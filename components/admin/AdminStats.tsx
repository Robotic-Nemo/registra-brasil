import { TrendingUp, TrendingDown, Minus } from 'lucide-react'

export interface StatItem {
  label: string
  value: number
  previousValue?: number
  color?: string
  icon?: React.ReactNode
}

interface AdminStatsProps {
  stats: StatItem[]
}

function getTrend(current: number, previous?: number) {
  if (previous === undefined || previous === 0) return null
  const diff = ((current - previous) / previous) * 100
  return { value: Math.abs(diff).toFixed(1), direction: diff > 0 ? 'up' : diff < 0 ? 'down' : 'flat' as const }
}

export function AdminStats({ stats }: AdminStatsProps) {
  return (
    <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-4">
      {stats.map((stat) => {
        const trend = getTrend(stat.value, stat.previousValue)

        return (
          <div
            key={stat.label}
            className="bg-white border border-gray-200 rounded-xl p-4"
          >
            <div className="flex items-center justify-between mb-2">
              <span className="text-xs font-medium text-gray-500 uppercase tracking-wide">
                {stat.label}
              </span>
              {stat.icon && (
                <span className="text-gray-300">{stat.icon}</span>
              )}
            </div>
            <p className={`text-2xl font-bold tabular-nums ${stat.color ?? 'text-gray-900'}`}>
              {stat.value.toLocaleString('pt-BR')}
            </p>
            {trend && (
              <div className="flex items-center gap-1 mt-1">
                {trend.direction === 'up' && <TrendingUp className="w-3.5 h-3.5 text-green-500" />}
                {trend.direction === 'down' && <TrendingDown className="w-3.5 h-3.5 text-red-500" />}
                {trend.direction === 'flat' && <Minus className="w-3.5 h-3.5 text-gray-400" />}
                <span className={`text-xs font-medium ${
                  trend.direction === 'up' ? 'text-green-600' : trend.direction === 'down' ? 'text-red-600' : 'text-gray-500'
                }`}>
                  {trend.value}%
                </span>
              </div>
            )}
          </div>
        )
      })}
    </div>
  )
}
