'use client'

import { useEffect, useRef, useState } from 'react'

interface Props {
  /** Target value to count to. */
  value: number
  /** Duration in milliseconds. */
  duration?: number
  /** Decimal places. */
  decimals?: number
  /** Prefix (e.g. "R$"). */
  prefix?: string
  /** Suffix (e.g. "%"). */
  suffix?: string
  className?: string
}

/**
 * Animated number counter using CSS transitions and requestAnimationFrame.
 * Counts from 0 to the target value with an easing animation.
 */
export function AnimatedCounter({
  value,
  duration = 1000,
  decimals = 0,
  prefix = '',
  suffix = '',
  className = '',
}: Props) {
  const [display, setDisplay] = useState(0)
  const startRef = useRef<number | null>(null)
  const rafRef = useRef<number | null>(null)

  useEffect(() => {
    const startValue = display
    startRef.current = null

    function step(timestamp: number) {
      if (startRef.current === null) startRef.current = timestamp
      const elapsed = timestamp - startRef.current
      const progress = Math.min(elapsed / duration, 1)

      // Ease out cubic
      const eased = 1 - Math.pow(1 - progress, 3)
      const current = startValue + (value - startValue) * eased

      setDisplay(current)

      if (progress < 1) {
        rafRef.current = requestAnimationFrame(step)
      }
    }

    rafRef.current = requestAnimationFrame(step)

    return () => {
      if (rafRef.current !== null) {
        cancelAnimationFrame(rafRef.current)
      }
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [value, duration])

  const formatted = decimals > 0
    ? display.toFixed(decimals)
    : Math.round(display).toLocaleString('pt-BR')

  return (
    <span className={className} aria-live="polite">
      {prefix}{formatted}{suffix}
    </span>
  )
}
