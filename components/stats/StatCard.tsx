import { Sparkline } from './Sparkline'

interface StatCardProps {
  label: string
  value: string | number
  trend?: number // percentage change
  sparklineData?: number[]
  icon?: React.ReactNode
  className?: string
}

export function StatCard({
  label,
  value,
  trend,
  sparklineData,
  icon,
  className = '',
}: StatCardProps) {
  const trendColor = trend === undefined ? '' : trend >= 0 ? 'text-emerald-600' : 'text-rose-600'
  const trendArrow = trend === undefined ? '' : trend >= 0 ? '↑' : '↓'

  return (
    <div className={`bg-white rounded-lg border border-zinc-200 p-4 ${className}`}>
      <div className="flex items-start justify-between">
        <div className="flex-1">
          <p className="text-sm text-zinc-500 font-medium">{label}</p>
          <div className="flex items-baseline gap-2 mt-1">
            <span className="text-2xl font-bold text-zinc-900 tabular-nums">
              {typeof value === 'number' ? value.toLocaleString('pt-BR') : value}
            </span>
            {trend !== undefined && (
              <span className={`text-sm font-medium ${trendColor}`}>
                {trendArrow} {Math.abs(trend).toFixed(1)}%
              </span>
            )}
          </div>
        </div>
        {icon && (
          <div className="text-zinc-400 ml-2">{icon}</div>
        )}
      </div>
      {sparklineData && sparklineData.length > 1 && (
        <div className="mt-3">
          <Sparkline data={sparklineData} width={200} height={28} />
        </div>
      )}
    </div>
  )
}
