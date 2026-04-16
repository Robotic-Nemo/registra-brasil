import type { ReactNode } from 'react'

interface ResponsiveTextProps {
  children: ReactNode
  as?: 'p' | 'span' | 'h1' | 'h2' | 'h3' | 'h4' | 'div'
  className?: string
  /** Minimum font size in rem. Default: 0.875 */
  minSize?: number
  /** Maximum font size in rem. Default: 1.25 */
  maxSize?: number
}

/**
 * Text component that adjusts size based on viewport width using CSS clamp.
 */
export function ResponsiveText({
  children,
  as: Tag = 'p',
  className = '',
  minSize = 0.875,
  maxSize = 1.25,
}: ResponsiveTextProps) {
  // Use CSS clamp for fluid typography
  const fontSize = `clamp(${minSize}rem, ${minSize}rem + 1vw, ${maxSize}rem)`

  return (
    <Tag className={className} style={{ fontSize }}>
      {children}
    </Tag>
  )
}
