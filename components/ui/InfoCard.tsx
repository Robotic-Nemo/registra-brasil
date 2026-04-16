import type { ReactNode } from 'react'

interface Props {
  title: string
  description: string
  icon?: ReactNode
  variant?: 'default' | 'blue' | 'green' | 'amber' | 'red'
  className?: string
}

const VARIANT_STYLES = {
  default: 'bg-white border-gray-200',
  blue: 'bg-blue-50 border-blue-200',
  green: 'bg-green-50 border-green-200',
  amber: 'bg-amber-50 border-amber-200',
  red: 'bg-red-50 border-red-200',
}

const VARIANT_TITLE_STYLES = {
  default: 'text-gray-900',
  blue: 'text-blue-900',
  green: 'text-green-900',
  amber: 'text-amber-900',
  red: 'text-red-900',
}

const VARIANT_DESC_STYLES = {
  default: 'text-gray-600',
  blue: 'text-blue-700',
  green: 'text-green-700',
  amber: 'text-amber-700',
  red: 'text-red-700',
}

export function InfoCard({ title, description, icon, variant = 'default', className = '' }: Props) {
  return (
    <div className={`border rounded-lg p-4 ${VARIANT_STYLES[variant]} ${className}`}>
      <div className="flex items-start gap-3">
        {icon && (
          <div className="shrink-0 mt-0.5">{icon}</div>
        )}
        <div>
          <h3 className={`font-semibold text-sm ${VARIANT_TITLE_STYLES[variant]}`}>{title}</h3>
          <p className={`text-sm mt-1 ${VARIANT_DESC_STYLES[variant]}`}>{description}</p>
        </div>
      </div>
    </div>
  )
}
