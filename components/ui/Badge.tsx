import type { ReactNode } from 'react'
import type { LucideProps } from 'lucide-react'

type BadgeVariant = 'default' | 'success' | 'warning' | 'error'

interface BadgeProps {
  children: ReactNode
  variant?: BadgeVariant
  icon?: React.ComponentType<LucideProps>
}

const variantClasses: Record<BadgeVariant, string> = {
  default: 'bg-gray-100 text-gray-700 border-gray-200',
  success: 'bg-green-50 text-green-700 border-green-200',
  warning: 'bg-yellow-50 text-yellow-700 border-yellow-200',
  error: 'bg-red-50 text-red-700 border-red-200',
}

export function Badge({ children, variant = 'default', icon: Icon }: BadgeProps) {
  return (
    <span
      className={`inline-flex items-center gap-1 text-xs font-medium px-2 py-0.5 rounded-full border ${variantClasses[variant]}`}
    >
      {Icon && <Icon className="w-3 h-3" />}
      {children}
    </span>
  )
}
