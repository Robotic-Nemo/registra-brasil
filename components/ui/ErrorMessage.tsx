import { AlertCircle, AlertTriangle, XCircle, Info } from 'lucide-react'
import type { ReactNode } from 'react'

type Severity = 'error' | 'warning' | 'info'

// Map severity to the right ARIA live region role. Errors are assertive;
// warnings/info are polite so they don't interrupt the user.
const SEVERITY_ROLE: Record<Severity, 'alert' | 'status'> = {
  error: 'alert',
  warning: 'status',
  info: 'status',
}

interface Props {
  message: string
  details?: string
  severity?: Severity
  onRetry?: () => void
  retryLabel?: string
  children?: ReactNode
  className?: string
}

const SEVERITY_STYLES: Record<Severity, { bg: string; border: string; text: string; icon: typeof AlertCircle }> = {
  error: { bg: 'bg-red-50', border: 'border-red-200', text: 'text-red-800', icon: XCircle },
  warning: { bg: 'bg-amber-50', border: 'border-amber-200', text: 'text-amber-800', icon: AlertTriangle },
  info: { bg: 'bg-blue-50', border: 'border-blue-200', text: 'text-blue-800', icon: Info },
}

/**
 * Formatted error display with icon, optional details, and retry action.
 */
export function ErrorMessage({
  message,
  details,
  severity = 'error',
  onRetry,
  retryLabel = 'Tentar novamente',
  children,
  className = '',
}: Props) {
  const styles = SEVERITY_STYLES[severity]
  const Icon = styles.icon

  return (
    <div
      role={SEVERITY_ROLE[severity]}
      aria-live={severity === 'error' ? 'assertive' : 'polite'}
      className={`${styles.bg} ${styles.border} border rounded-lg p-4 ${className}`}
    >
      <div className="flex items-start gap-3">
        <Icon className={`w-5 h-5 ${styles.text} flex-shrink-0 mt-0.5`} aria-hidden="true" />
        <div className="flex-1 min-w-0">
          <p className={`text-sm font-medium ${styles.text}`}>{message}</p>
          {details && (
            <p className={`text-xs mt-1 ${styles.text} opacity-75`}>{details}</p>
          )}
          {children}
          {onRetry && (
            <button
              type="button"
              onClick={onRetry}
              className={`mt-3 text-xs font-medium ${styles.text} underline underline-offset-2 hover:opacity-80 transition-opacity focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-1 focus-visible:ring-current rounded`}
            >
              {retryLabel}
            </button>
          )}
        </div>
      </div>
    </div>
  )
}
