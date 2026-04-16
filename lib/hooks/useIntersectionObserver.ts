'use client'

import { useState, useEffect, type RefObject } from 'react'

interface Options {
  threshold?: number
  rootMargin?: string
  once?: boolean
}

/**
 * Observes an element's intersection with the viewport.
 * When `once` is true (default), stops observing after the element becomes visible.
 */
export function useIntersectionObserver(
  ref: RefObject<HTMLElement | null>,
  { threshold = 0, rootMargin = '0px', once = true }: Options = {}
): boolean {
  const [isIntersecting, setIsIntersecting] = useState(false)

  useEffect(() => {
    const el = ref.current
    if (!el) return

    const observer = new IntersectionObserver(
      ([entry]) => {
        setIsIntersecting(entry.isIntersecting)
        if (entry.isIntersecting && once) {
          observer.unobserve(el)
        }
      },
      { threshold, rootMargin }
    )

    observer.observe(el)
    return () => observer.disconnect()
  }, [ref, threshold, rootMargin, once])

  return isIntersecting
}
