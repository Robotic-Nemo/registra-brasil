'use client'

import { useState, useEffect } from 'react'

interface ScrollPosition {
  x: number
  y: number
  direction: 'up' | 'down' | null
}

/**
 * Tracks scroll position and direction.
 * Useful for show/hide header on scroll patterns.
 */
export function useScrollPosition(): ScrollPosition {
  const [position, setPosition] = useState<ScrollPosition>({ x: 0, y: 0, direction: null })

  useEffect(() => {
    let prevY = window.scrollY

    function onScroll() {
      const y = window.scrollY
      setPosition({
        x: window.scrollX,
        y,
        direction: y > prevY ? 'down' : y < prevY ? 'up' : null,
      })
      prevY = y
    }

    window.addEventListener('scroll', onScroll, { passive: true })
    return () => window.removeEventListener('scroll', onScroll)
  }, [])

  return position
}
