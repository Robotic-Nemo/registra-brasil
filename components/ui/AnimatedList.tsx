'use client'

import { useEffect, useState, type ReactNode } from 'react'

interface Props {
  children: ReactNode[]
  /** Stagger delay between items in ms */
  stagger?: number
  className?: string
}

/**
 * Staggered list animation that reveals items one by one.
 */
export function AnimatedList({ children, stagger = 80, className = '' }: Props) {
  const [visibleCount, setVisibleCount] = useState(0)

  useEffect(() => {
    if (visibleCount >= children.length) return

    const timer = setTimeout(() => {
      setVisibleCount((prev) => prev + 1)
    }, stagger)

    return () => clearTimeout(timer)
  }, [visibleCount, children.length, stagger])

  return (
    <div className={className}>
      {children.map((child, i) => (
        <div
          key={i}
          className="transition-all duration-300"
          style={{
            opacity: i < visibleCount ? 1 : 0,
            transform: i < visibleCount ? 'translateY(0)' : 'translateY(8px)',
          }}
        >
          {child}
        </div>
      ))}
    </div>
  )
}
