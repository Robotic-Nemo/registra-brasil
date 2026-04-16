import type { ReactNode } from 'react'

interface Props {
  value: string | number
  label: string
  icon?: ReactNode
  trend?: { value: string; positive?: boolean }
  className?: string
}

/**
 * Large stat number with label, optional icon, and trend indicator.
 */
export function StatDisplay({ value, label, icon, trend, className = '' }: Props) {
  return (
    <div className={`flex items-start gap-3 ${className}`}>
      {icon && (
        <div className="flex-shrink-0 w-10 h-10 rounded-lg bg-blue-50 flex items-center justify-center text-blue-600">
          {icon}
        </div>
      )}
      <div>
        <div className="text-2xl font-bold text-gray-900 leading-tight">{value}</div>
        <div className="text-xs text-gray-500 mt-0.5">{label}</div>
        {trend && (
          <div
            className={`text-xs font-medium mt-1 ${
              trend.positive ? 'text-green-600' : 'text-red-600'
            }`}
          >
            {trend.positive ? '+' : ''}{trend.value}
          </div>
        )}
      </div>
    </div>
  )
}
