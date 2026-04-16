import type { ReactNode } from 'react'

interface Props {
  children: ReactNode
  /** Tailwind gradient classes, e.g. "from-blue-600 to-purple-600" */
  gradient?: string
  as?: 'span' | 'h1' | 'h2' | 'h3' | 'p'
  className?: string
}

/**
 * Text component with gradient color effect.
 */
export function GradientText({
  children,
  gradient = 'from-blue-600 via-purple-600 to-pink-500',
  as: Tag = 'span',
  className = '',
}: Props) {
  return (
    <Tag
      className={`bg-gradient-to-r ${gradient} bg-clip-text text-transparent ${className}`}
    >
      {children}
    </Tag>
  )
}
