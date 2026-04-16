import { X } from 'lucide-react'
import type { ReactNode } from 'react'

interface Props {
  children: ReactNode
  onRemove?: () => void
  color?: string
  className?: string
}

export function Chip({ children, onRemove, color, className = '' }: Props) {
  return (
    <span className={`inline-flex items-center gap-1 text-xs font-medium px-2 py-1 rounded-full border border-gray-200 bg-white ${className}`}>
      {color && <span className="w-2 h-2 rounded-full flex-shrink-0" style={{ backgroundColor: color }} />}
      {children}
      {onRemove && (
        <button
          onClick={onRemove}
          aria-label="Remover"
          className="text-gray-400 hover:text-gray-600 -mr-0.5"
        >
          <X className="w-3 h-3" />
        </button>
      )}
    </span>
  )
}
