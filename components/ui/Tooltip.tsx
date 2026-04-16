import type { ReactNode } from 'react'

type TooltipSide = 'top' | 'bottom'

interface TooltipProps {
  content: string
  children: ReactNode
  /** Position of the tooltip. Defaults to 'top'. */
  side?: TooltipSide
}

const sideClasses: Record<TooltipSide, string> = {
  top: 'bottom-full left-1/2 -translate-x-1/2 mb-2',
  bottom: 'top-full left-1/2 -translate-x-1/2 mt-2',
}

/**
 * A CSS-only tooltip that displays on hover/focus.
 * Uses `title` as a native fallback for assistive technology.
 */
export function Tooltip({ content, children, side = 'top' }: TooltipProps) {
  return (
    <span className="relative inline-block group" title={content}>
      {children}
      <span
        role="tooltip"
        className={`absolute ${sideClasses[side]} z-50 pointer-events-none opacity-0 group-hover:opacity-100 group-focus-within:opacity-100 transition-opacity duration-150 whitespace-nowrap bg-gray-900 text-white text-xs rounded px-2 py-1 shadow-lg`}
      >
        {content}
      </span>
    </span>
  )
}
