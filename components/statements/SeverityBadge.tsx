import { AlertTriangle, AlertOctagon, AlertCircle, Info, ShieldAlert } from 'lucide-react'
import type { ReactNode } from 'react'
import { SEVERITY_STYLES, type Severity } from '@/lib/utils/severity'

interface SeverityBadgeProps {
  severity: Severity
  /** 'badge' (default) = pill with label; 'dot' = tiny circle; 'bar' = progress bar. */
  variant?: 'badge' | 'dot' | 'bar'
  /** Show short label text. Ignored for 'dot'. */
  showLabel?: boolean
  className?: string
}

const ICONS: Record<Severity, (props: { className?: string; 'aria-hidden'?: boolean }) => ReactNode> = {
  1: (p) => <Info {...p} />,
  2: (p) => <AlertCircle {...p} />,
  3: (p) => <AlertTriangle {...p} />,
  4: (p) => <AlertOctagon {...p} />,
  5: (p) => <ShieldAlert {...p} />,
}

export function SeverityBadge({
  severity,
  variant = 'badge',
  showLabel = true,
  className = '',
}: SeverityBadgeProps) {
  const style = SEVERITY_STYLES[severity]
  const Icon = ICONS[severity]

  if (variant === 'dot') {
    return (
      <span
        className={`inline-block w-2 h-2 rounded-full ${style.badge} ${className}`}
        role="img"
        aria-label={style.label}
        title={style.label}
      />
    )
  }

  if (variant === 'bar') {
    return (
      <div
        className={`relative h-1.5 w-full rounded-full bg-gray-100 overflow-hidden ${className}`}
        role="progressbar"
        aria-valuenow={severity}
        aria-valuemin={1}
        aria-valuemax={5}
        aria-label={style.label}
      >
        <div
          className={`h-full ${style.badge.split(' ').find((c) => c.startsWith('bg-')) ?? 'bg-gray-300'}`}
          style={{ width: `${style.fillPct}%` }}
        />
      </div>
    )
  }

  return (
    <span
      className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full border text-xs font-medium ${style.badge} ${className}`}
      role="img"
      aria-label={`Gravidade: ${style.label}`}
      title={style.label}
    >
      {Icon({ className: 'w-3 h-3', 'aria-hidden': true })}
      {showLabel && <span>{style.short}</span>}
    </span>
  )
}
