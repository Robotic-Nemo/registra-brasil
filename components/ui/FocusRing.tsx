'use client'

import type { ReactNode } from 'react'

interface Props {
  children: ReactNode
  /** Additional classes for the wrapper */
  className?: string
  /** Ring color override (Tailwind class) */
  ringColor?: string
  /** Whether the focus ring should be inset */
  inset?: boolean
}

/**
 * Wraps a single interactive child to add a visible focus ring
 * only on keyboard navigation (:focus-visible).
 */
export function FocusRing({
  children,
  className = '',
  ringColor = 'ring-blue-500',
  inset = false,
}: Props) {
  const ringStyle = inset ? 'focus-within:ring-inset' : ''

  return (
    <div
      className={`
        rounded-lg
        focus-within:outline-none
        focus-within:ring-2
        focus-within:${ringColor}
        focus-within:ring-offset-2
        ${ringStyle}
        ${className}
      `.trim()}
    >
      {children}
    </div>
  )
}
