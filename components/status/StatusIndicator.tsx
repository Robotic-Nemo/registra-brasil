type Status = 'operational' | 'degraded' | 'outage' | 'maintenance'

interface StatusIndicatorProps {
  status: Status
  showLabel?: boolean
}

const config: Record<Status, { color: string; label: string }> = {
  operational: { color: 'bg-green-500', label: 'Operacional' },
  degraded: { color: 'bg-yellow-500', label: 'Degradado' },
  outage: { color: 'bg-red-500', label: 'Fora do ar' },
  maintenance: { color: 'bg-blue-500', label: 'Em manutencao' },
}

export function StatusIndicator({ status, showLabel = false }: StatusIndicatorProps) {
  const { color, label } = config[status]

  return (
    <span className="inline-flex items-center gap-2">
      <span
        className={`inline-block w-2.5 h-2.5 rounded-full ${color}`}
        aria-label={label}
        role="img"
      />
      {showLabel && (
        <span className="text-sm text-gray-600 dark:text-gray-400">{label}</span>
      )}
    </span>
  )
}
