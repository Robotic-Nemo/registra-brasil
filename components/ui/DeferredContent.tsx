'use client'

import { useState, useEffect, type ReactNode } from 'react'

interface DeferredContentProps {
  children: ReactNode
  fallback?: ReactNode
  /** Delay in ms after initial paint. Defaults to 0 (next frame). */
  delay?: number
}

/**
 * Renders children only after the initial paint, reducing blocking content.
 */
export function DeferredContent({ children, fallback = null, delay = 0 }: DeferredContentProps) {
  const [ready, setReady] = useState(false)

  useEffect(() => {
    if (delay <= 0) {
      requestAnimationFrame(() => setReady(true))
    } else {
      const timer = setTimeout(() => setReady(true), delay)
      return () => clearTimeout(timer)
    }
  }, [delay])

  return <>{ready ? children : fallback}</>
}
