'use client'

import { useEffect, useRef, useState, type ReactNode } from 'react'

interface FadeInProps {
  children: ReactNode
  /** Animation duration in ms */
  duration?: number
  /** Delay before animation starts in ms */
  delay?: number
  /** Direction to fade from */
  direction?: 'up' | 'down' | 'left' | 'right' | 'none'
  /** Distance to translate in px */
  distance?: number
  /** IntersectionObserver threshold */
  threshold?: number
  className?: string
}

/**
 * Fade-in on scroll wrapper. Reveals children when they enter the viewport.
 */
export function FadeIn({
  children,
  duration = 500,
  delay = 0,
  direction = 'up',
  distance = 20,
  threshold = 0.1,
  className = '',
}: FadeInProps) {
  const ref = useRef<HTMLDivElement>(null)
  const [isVisible, setIsVisible] = useState(false)

  useEffect(() => {
    const el = ref.current
    if (!el) return

    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry?.isIntersecting) {
          setIsVisible(true)
          observer.disconnect()
        }
      },
      { threshold }
    )

    observer.observe(el)
    return () => observer.disconnect()
  }, [threshold])

  const transforms: Record<string, string> = {
    up: `translateY(${distance}px)`,
    down: `translateY(-${distance}px)`,
    left: `translateX(${distance}px)`,
    right: `translateX(-${distance}px)`,
    none: 'none',
  }

  return (
    <div
      ref={ref}
      className={className}
      style={{
        opacity: isVisible ? 1 : 0,
        transform: isVisible ? 'none' : transforms[direction],
        transition: `opacity ${duration}ms ease, transform ${duration}ms ease`,
        transitionDelay: `${delay}ms`,
      }}
    >
      {children}
    </div>
  )
}
