import type { ReactNode } from 'react'

interface PillProps {
  children: ReactNode
  variant?: 'default' | 'primary' | 'success' | 'warning' | 'error'
  size?: 'sm' | 'md'
  removable?: boolean
  onRemove?: () => void
  className?: string
}

const VARIANTS = {
  default: 'bg-zinc-100 text-zinc-700',
  primary: 'bg-blue-100 text-blue-700',
  success: 'bg-green-100 text-green-700',
  warning: 'bg-amber-100 text-amber-700',
  error: 'bg-red-100 text-red-700',
}

const SIZES = {
  sm: 'text-[10px] px-1.5 py-0.5',
  md: 'text-xs px-2 py-1',
}

export function Pill({
  children,
  variant = 'default',
  size = 'md',
  removable = false,
  onRemove,
  className = '',
}: PillProps) {
  return (
    <span className={`inline-flex items-center gap-1 rounded-full font-medium ${VARIANTS[variant]} ${SIZES[size]} ${className}`}>
      {children}
      {removable && (
        <button
          onClick={onRemove}
          className="ml-0.5 hover:opacity-70 font-bold leading-none"
          aria-label="Remover"
        >
          ×
        </button>
      )}
    </span>
  )
}
