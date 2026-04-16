'use client'

import { useMemo } from 'react'

interface MasonryProps {
  children: React.ReactNode[]
  columns?: number
  gap?: number
  className?: string
}

/**
 * CSS columns-based masonry layout
 */
export function Masonry({
  children,
  columns = 3,
  gap = 16,
  className = '',
}: MasonryProps) {
  const style = useMemo(() => ({
    columnCount: columns,
    columnGap: `${gap}px`,
  }), [columns, gap])

  return (
    <div className={className} style={style}>
      {children.map((child, i) => (
        <div
          key={i}
          style={{
            breakInside: 'avoid',
            marginBottom: `${gap}px`,
          }}
        >
          {child}
        </div>
      ))}
    </div>
  )
}
