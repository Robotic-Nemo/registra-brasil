import type { ReactNode } from 'react'

interface Props {
  /** Content to wrap with the badge. */
  children: ReactNode
  /** Count to display. 0 hides the badge. */
  count?: number
  /** Show a dot instead of count. */
  dot?: boolean
  /** Maximum number to show before "99+". */
  max?: number
  /** Badge color variant. */
  variant?: 'danger' | 'warning' | 'info'
  className?: string
}

const variantMap = {
  danger: 'bg-red-500 text-white',
  warning: 'bg-amber-500 text-white',
  info: 'bg-blue-500 text-white',
} as const

/**
 * Badge overlay on icons or other elements. Shows a count or dot indicator.
 */
export function NotificationBadge({
  children,
  count = 0,
  dot = false,
  max = 99,
  variant = 'danger',
  className = '',
}: Props) {
  const showBadge = dot || count > 0

  const label = dot ? '' : count > max ? `${max}+` : String(count)

  return (
    <span className={`relative inline-flex ${className}`}>
      {children}
      {showBadge && (
        <span
          className={`absolute -top-1 -right-1 flex items-center justify-center ${variantMap[variant]} ${
            dot
              ? 'w-2.5 h-2.5 rounded-full'
              : 'min-w-[18px] h-[18px] px-1 rounded-full text-[10px] font-bold leading-none'
          }`}
          aria-label={dot ? 'Nova notificacao' : `${count} notificacoes`}
        >
          {!dot && label}
        </span>
      )}
    </span>
  )
}
