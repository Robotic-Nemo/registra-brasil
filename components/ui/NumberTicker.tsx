'use client'

import { useCountUp } from '@/lib/hooks/useCountUp'
import { useIntersectionObserver } from '@/lib/hooks/useIntersectionObserver'
import { useRef } from 'react'

interface NumberTickerProps {
  value: number
  duration?: number
  formatter?: (n: number) => string
  className?: string
}

/**
 * Animated number that counts up when scrolled into view
 */
export function NumberTicker({
  value,
  duration = 1000,
  formatter = (n) => n.toLocaleString('pt-BR'),
  className = '',
}: NumberTickerProps) {
  const ref = useRef<HTMLSpanElement>(null)
  const isVisible = useIntersectionObserver(ref as React.RefObject<HTMLElement>, {
    threshold: 0.5,
    once: true,
  })

  const animatedValue = useCountUp({
    end: value,
    duration,
    enabled: isVisible,
  })

  return (
    <span ref={ref} className={`tabular-nums ${className}`}>
      {formatter(isVisible ? animatedValue : 0)}
    </span>
  )
}
