'use client'

import { useRef, useEffect, type RefObject } from 'react'

type SwipeDirection = 'left' | 'right' | 'up' | 'down'

interface UseSwipeGestureOptions {
  onSwipe: (direction: SwipeDirection) => void
  /** Minimum distance in px to trigger swipe. Default: 50 */
  threshold?: number
  /** Maximum time in ms for the swipe gesture. Default: 300 */
  maxTime?: number
}

/**
 * Detects swipe gestures on a referenced element.
 */
export function useSwipeGesture<T extends HTMLElement = HTMLDivElement>(
  ref: RefObject<T | null>,
  options: UseSwipeGestureOptions
) {
  const { onSwipe, threshold = 50, maxTime = 300 } = options
  const startRef = useRef<{ x: number; y: number; time: number } | null>(null)

  useEffect(() => {
    const el = ref.current
    if (!el) return

    function handleTouchStart(e: TouchEvent) {
      const touch = e.touches[0]
      startRef.current = { x: touch.clientX, y: touch.clientY, time: Date.now() }
    }

    function handleTouchEnd(e: TouchEvent) {
      if (!startRef.current) return
      const touch = e.changedTouches[0]
      const dx = touch.clientX - startRef.current.x
      const dy = touch.clientY - startRef.current.y
      const dt = Date.now() - startRef.current.time
      startRef.current = null

      if (dt > maxTime) return

      const absDx = Math.abs(dx)
      const absDy = Math.abs(dy)

      if (absDx < threshold && absDy < threshold) return

      if (absDx > absDy) {
        onSwipe(dx > 0 ? 'right' : 'left')
      } else {
        onSwipe(dy > 0 ? 'down' : 'up')
      }
    }

    el.addEventListener('touchstart', handleTouchStart, { passive: true })
    el.addEventListener('touchend', handleTouchEnd, { passive: true })
    return () => {
      el.removeEventListener('touchstart', handleTouchStart)
      el.removeEventListener('touchend', handleTouchEnd)
    }
  }, [ref, onSwipe, threshold, maxTime])
}
