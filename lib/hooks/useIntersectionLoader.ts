'use client'

import { useState, useEffect, useRef, type RefObject } from 'react'

interface UseIntersectionLoaderOptions {
  threshold?: number
  rootMargin?: string
  triggerOnce?: boolean
}

/**
 * Triggers content loading when an element enters the viewport.
 * Returns [ref, isVisible] — attach ref to the sentinel element.
 */
export function useIntersectionLoader<T extends HTMLElement = HTMLDivElement>(
  options: UseIntersectionLoaderOptions = {}
): [RefObject<T | null>, boolean] {
  const { threshold = 0, rootMargin = '200px', triggerOnce = true } = options
  const ref = useRef<T | null>(null)
  const [isVisible, setIsVisible] = useState(false)

  useEffect(() => {
    const el = ref.current
    if (!el) return
    if (typeof IntersectionObserver === 'undefined') {
      setIsVisible(true)
      return
    }

    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          setIsVisible(true)
          if (triggerOnce) observer.unobserve(el)
        } else if (!triggerOnce) {
          setIsVisible(false)
        }
      },
      { threshold, rootMargin }
    )

    observer.observe(el)
    return () => observer.disconnect()
  }, [threshold, rootMargin, triggerOnce])

  return [ref, isVisible]
}
