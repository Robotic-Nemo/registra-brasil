import { AlertTriangle, Info, CheckCircle, XCircle } from 'lucide-react'
import type { ReactNode } from 'react'

type Variant = 'info' | 'success' | 'warning' | 'error'

interface Props {
  variant?: Variant
  title?: string
  children: ReactNode
  className?: string
}

const config = {
  info: { icon: Info, bg: 'bg-blue-50', border: 'border-blue-200', text: 'text-blue-800', iconColor: 'text-blue-500' },
  success: { icon: CheckCircle, bg: 'bg-green-50', border: 'border-green-200', text: 'text-green-800', iconColor: 'text-green-500' },
  warning: { icon: AlertTriangle, bg: 'bg-amber-50', border: 'border-amber-200', text: 'text-amber-800', iconColor: 'text-amber-500' },
  error: { icon: XCircle, bg: 'bg-red-50', border: 'border-red-200', text: 'text-red-800', iconColor: 'text-red-500' },
} as const

export function Alert({ variant = 'info', title, children, className = '' }: Props) {
  const { icon: Icon, bg, border, text, iconColor } = config[variant]

  return (
    <div className={`${bg} ${border} ${text} border rounded-lg p-4 text-sm ${className}`} role="alert">
      <div className="flex gap-3">
        <Icon className={`w-5 h-5 flex-shrink-0 mt-0.5 ${iconColor}`} />
        <div>
          {title && <p className="font-semibold mb-1">{title}</p>}
          <div>{children}</div>
        </div>
      </div>
    </div>
  )
}
