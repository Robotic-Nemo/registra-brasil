'use client'

import { useEffect, useRef, useCallback } from 'react'

interface UseKeyboardNavigationOptions {
  items: number
  onSelect?: (index: number) => void
  wrap?: boolean
  orientation?: 'vertical' | 'horizontal'
}

/**
 * Hook for keyboard navigation through a list of items (arrow keys + enter)
 */
export function useKeyboardNavigation({
  items,
  onSelect,
  wrap = true,
  orientation = 'vertical',
}: UseKeyboardNavigationOptions) {
  const activeIndexRef = useRef(-1)
  const containerRef = useRef<HTMLElement>(null)

  const setActiveIndex = useCallback((index: number) => {
    activeIndexRef.current = index
    // Focus the item
    const container = containerRef.current
    if (!container) return
    const children = container.querySelectorAll('[data-nav-item]')
    if (children[index]) {
      (children[index] as HTMLElement).focus()
    }
  }, [])

  useEffect(() => {
    const container = containerRef.current
    if (!container) return

    const handleKeyDown = (e: KeyboardEvent) => {
      const prevKey = orientation === 'vertical' ? 'ArrowUp' : 'ArrowLeft'
      const nextKey = orientation === 'vertical' ? 'ArrowDown' : 'ArrowRight'

      if (e.key === nextKey) {
        e.preventDefault()
        let next = activeIndexRef.current + 1
        if (next >= items) next = wrap ? 0 : items - 1
        setActiveIndex(next)
      } else if (e.key === prevKey) {
        e.preventDefault()
        let prev = activeIndexRef.current - 1
        if (prev < 0) prev = wrap ? items - 1 : 0
        setActiveIndex(prev)
      } else if (e.key === 'Enter' || e.key === ' ') {
        e.preventDefault()
        if (activeIndexRef.current >= 0) {
          onSelect?.(activeIndexRef.current)
        }
      } else if (e.key === 'Home') {
        e.preventDefault()
        setActiveIndex(0)
      } else if (e.key === 'End') {
        e.preventDefault()
        setActiveIndex(items - 1)
      }
    }

    container.addEventListener('keydown', handleKeyDown)
    return () => container.removeEventListener('keydown', handleKeyDown)
  }, [items, onSelect, wrap, orientation, setActiveIndex])

  return {
    containerRef,
    activeIndex: activeIndexRef.current,
    setActiveIndex,
  }
}
