interface Props {
  value: string | number
  label: string
  context?: string
  trend?: 'up' | 'down' | 'neutral'
  className?: string
}

export function StatHighlight({ value, label, context, trend, className = '' }: Props) {
  const trendIcon = trend === 'up' ? '↑' : trend === 'down' ? '↓' : ''
  const trendColor = trend === 'up' ? 'text-emerald-600' : trend === 'down' ? 'text-rose-600' : 'text-gray-400'

  return (
    <div className={`bg-gradient-to-br from-blue-50 to-blue-100 border border-blue-200 rounded-xl p-5 text-center ${className}`}>
      <div className="flex items-center justify-center gap-1">
        <span className="text-3xl font-bold text-blue-900 tabular-nums">
          {typeof value === 'number' ? value.toLocaleString('pt-BR') : value}
        </span>
        {trend && (
          <span className={`text-lg font-medium ${trendColor}`}>{trendIcon}</span>
        )}
      </div>
      <div className="text-sm font-medium text-blue-700 mt-1">{label}</div>
      {context && (
        <div className="text-xs text-blue-500 mt-0.5">{context}</div>
      )}
    </div>
  )
}
