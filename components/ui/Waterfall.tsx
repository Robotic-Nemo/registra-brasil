'use client'

import { useEffect, useRef, useState, type ReactNode } from 'react'

interface WaterfallProps {
  children: ReactNode[]
  /** Stagger delay between items in ms */
  stagger?: number
  /** Animation duration in ms */
  duration?: number
  className?: string
}

/**
 * Waterfall/cascade layout that reveals children one by one with a stagger effect.
 */
export function Waterfall({
  children,
  stagger = 80,
  duration = 400,
  className = '',
}: WaterfallProps) {
  const containerRef = useRef<HTMLDivElement>(null)
  const [visible, setVisible] = useState(false)

  useEffect(() => {
    const el = containerRef.current
    if (!el) return

    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry?.isIntersecting) {
          setVisible(true)
          observer.disconnect()
        }
      },
      { threshold: 0.1 }
    )

    observer.observe(el)
    return () => observer.disconnect()
  }, [])

  return (
    <div ref={containerRef} className={className}>
      {children.map((child, index) => (
        <div
          key={index}
          style={{
            opacity: visible ? 1 : 0,
            transform: visible ? 'translateY(0)' : 'translateY(20px)',
            transition: `opacity ${duration}ms ease, transform ${duration}ms ease`,
            transitionDelay: visible ? `${index * stagger}ms` : '0ms',
          }}
        >
          {child}
        </div>
      ))}
    </div>
  )
}
