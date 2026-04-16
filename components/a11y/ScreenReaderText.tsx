import type { ReactNode } from 'react'

interface ScreenReaderTextProps {
  children: ReactNode
  as?: 'span' | 'div' | 'p' | 'h2' | 'h3'
}

/**
 * Visually hidden text that is accessible to screen readers.
 * Uses the sr-only pattern from Tailwind.
 */
export function ScreenReaderText({ children, as: Tag = 'span' }: ScreenReaderTextProps) {
  return (
    <Tag className="sr-only">
      {children}
    </Tag>
  )
}
