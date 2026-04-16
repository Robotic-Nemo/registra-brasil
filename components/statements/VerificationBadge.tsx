import type { VerificationStatus } from '@/types/database'
import { CheckCircle, Clock, AlertTriangle, XCircle } from 'lucide-react'

interface VerificationBadgeProps {
  status: VerificationStatus
  showLabel?: boolean
}

const CONFIG = {
  verified: {
    label: 'Verificado',
    description: 'Fonte primaria confirmada e revisada',
    icon: CheckCircle,
    className: 'text-green-700 bg-green-50 border-green-200',
  },
  unverified: {
    label: 'Nao verificado',
    description: 'Aguardando revisao editorial',
    icon: Clock,
    className: 'text-yellow-700 bg-yellow-50 border-yellow-200',
  },
  disputed: {
    label: 'Disputado',
    description: 'Contexto ou interpretacao questionados',
    icon: AlertTriangle,
    className: 'text-orange-700 bg-orange-50 border-orange-200',
  },
  removed: {
    label: 'Removido',
    description: 'Retirado por erro factual',
    icon: XCircle,
    className: 'text-gray-500 bg-gray-50 border-gray-200',
  },
} as const

export function VerificationBadge({ status, showLabel = true }: VerificationBadgeProps) {
  const config = CONFIG[status] ?? CONFIG.unverified
  const { label, description, icon: Icon, className } = config

  return (
    <span
      className={`inline-flex items-center gap-1 text-xs font-medium px-2 py-0.5 rounded border ${className}`}
      title={`${label}: ${description}`}
      aria-label={`Status: ${label} - ${description}`}
    >
      <Icon className="w-3 h-3 flex-shrink-0" />
      {showLabel && label}
    </span>
  )
}
