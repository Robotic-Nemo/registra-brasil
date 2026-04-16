type Status = 'success' | 'warning' | 'error' | 'info' | 'neutral'

interface Props {
  status: Status
  label?: string
  pulse?: boolean
  className?: string
}

const colors: Record<Status, string> = {
  success: 'bg-green-500',
  warning: 'bg-amber-500',
  error: 'bg-red-500',
  info: 'bg-blue-500',
  neutral: 'bg-gray-400',
}

export function StatusDot({ status, label, pulse = false, className = '' }: Props) {
  return (
    <span className={`inline-flex items-center gap-1.5 ${className}`}>
      <span className={`w-2 h-2 rounded-full ${colors[status]} ${pulse ? 'animate-pulse' : ''}`} />
      {label && <span className="text-xs text-gray-600">{label}</span>}
    </span>
  )
}
