import type { ReactNode } from 'react'

interface Props {
  children: ReactNode
  maxHeight?: string
  className?: string
}

/**
 * Scrollable area with styled scrollbar.
 */
export function ScrollArea({ children, maxHeight = '400px', className = '' }: Props) {
  return (
    <div
      className={`overflow-y-auto ${className}`}
      style={{
        maxHeight,
        scrollbarWidth: 'thin',
        scrollbarColor: '#d1d5db transparent',
      }}
    >
      {children}
    </div>
  )
}
