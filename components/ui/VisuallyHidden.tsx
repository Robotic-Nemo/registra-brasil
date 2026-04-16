import type { ElementType, ReactNode } from 'react'

interface VisuallyHiddenProps {
  children: ReactNode
  as?: ElementType
}

/**
 * Renders children visually hidden but accessible to screen readers.
 * Uses Tailwind's `sr-only` utility class.
 */
export function VisuallyHidden({ children, as: Tag = 'span' }: VisuallyHiddenProps) {
  return <Tag className="sr-only">{children}</Tag>
}
