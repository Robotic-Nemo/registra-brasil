import type { VerificationStatus } from '@/types/database'
import { CheckCircle, Clock, AlertTriangle, XCircle } from 'lucide-react'

interface VerificationBadgeProps {
  status: VerificationStatus
  showLabel?: boolean
}

const CONFIG = {
  verified: {
    label: 'Verificado',
    icon: CheckCircle,
    className: 'text-green-700 bg-green-50 border-green-200',
  },
  unverified: {
    label: 'Não verificado',
    icon: Clock,
    className: 'text-yellow-700 bg-yellow-50 border-yellow-200',
  },
  disputed: {
    label: 'Disputado',
    icon: AlertTriangle,
    className: 'text-orange-700 bg-orange-50 border-orange-200',
  },
  removed: {
    label: 'Removido',
    icon: XCircle,
    className: 'text-gray-500 bg-gray-50 border-gray-200',
  },
} as const

export function VerificationBadge({ status, showLabel = true }: VerificationBadgeProps) {
  const { label, icon: Icon, className } = CONFIG[status]

  return (
    <span
      className={`inline-flex items-center gap-1 text-xs font-medium px-2 py-0.5 rounded border ${className}`}
      title={label}
    >
      <Icon className="w-3 h-3 flex-shrink-0" />
      {showLabel && label}
    </span>
  )
}
