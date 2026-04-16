import type { ReactNode } from 'react'

interface StatsCardProps {
  label: string
  value: string | number
  icon?: ReactNode
  color?: 'blue' | 'green' | 'yellow' | 'red' | 'gray'
  trend?: { value: number; label: string }
}

const COLOR_MAP = {
  blue: 'text-blue-600 bg-blue-50',
  green: 'text-green-600 bg-green-50',
  yellow: 'text-yellow-600 bg-yellow-50',
  red: 'text-red-600 bg-red-50',
  gray: 'text-gray-600 bg-gray-50',
} as const

/**
 * Small card displaying a single metric with optional icon and trend indicator.
 */
export function StatsCard({ label, value, icon, color = 'blue', trend }: StatsCardProps) {
  const colorClasses = COLOR_MAP[color]

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-4">
      <div className="flex items-start justify-between">
        <div>
          <p className="text-xs text-gray-500 font-medium mb-1">{label}</p>
          <p className={`text-2xl font-bold tabular-nums ${colorClasses.split(' ')[0]}`}>
            {typeof value === 'number' ? value.toLocaleString('pt-BR') : value}
          </p>
        </div>
        {icon && (
          <div className={`p-2 rounded-lg ${colorClasses}`}>
            {icon}
          </div>
        )}
      </div>
      {trend && (
        <p className={`text-xs mt-2 ${trend.value >= 0 ? 'text-green-600' : 'text-red-600'}`}>
          {trend.value >= 0 ? '+' : ''}{trend.value}% {trend.label}
        </p>
      )}
    </div>
  )
}
