'use client'

import { useState, useEffect, useRef, useCallback, type ReactNode } from 'react'

interface VirtualListProps<T> {
  /** All items to render. */
  items: T[]
  /** Height of each item in pixels. */
  itemHeight: number
  /** Maximum visible height of the container in pixels. */
  containerHeight: number
  /** Render function for each item. */
  renderItem: (item: T, index: number) => ReactNode
  /** Number of items to render above/below the visible area. Defaults to 5. */
  overscan?: number
  /** Optional CSS class for the container. */
  className?: string
  /** Key extractor. Defaults to index. */
  getKey?: (item: T, index: number) => string | number
}

/**
 * Simple virtualized list using IntersectionObserver-based approach.
 * Only renders items that are visible in the viewport plus overscan buffer.
 */
export function VirtualList<T>({
  items,
  itemHeight,
  containerHeight,
  renderItem,
  overscan = 5,
  className = '',
  getKey,
}: VirtualListProps<T>) {
  const containerRef = useRef<HTMLDivElement>(null)
  const [scrollTop, setScrollTop] = useState(0)

  const totalHeight = items.length * itemHeight
  const visibleCount = Math.ceil(containerHeight / itemHeight)
  const startIndex = Math.max(0, Math.floor(scrollTop / itemHeight) - overscan)
  const endIndex = Math.min(items.length - 1, startIndex + visibleCount + overscan * 2)

  const handleScroll = useCallback(() => {
    if (containerRef.current) {
      setScrollTop(containerRef.current.scrollTop)
    }
  }, [])

  useEffect(() => {
    const container = containerRef.current
    if (!container) return

    container.addEventListener('scroll', handleScroll, { passive: true })
    return () => container.removeEventListener('scroll', handleScroll)
  }, [handleScroll])

  const visibleItems = []
  for (let i = startIndex; i <= endIndex; i++) {
    const item = items[i]
    const key = getKey ? getKey(item, i) : i
    visibleItems.push(
      <div
        key={key}
        style={{
          position: 'absolute',
          top: i * itemHeight,
          height: itemHeight,
          left: 0,
          right: 0,
        }}
      >
        {renderItem(item, i)}
      </div>
    )
  }

  return (
    <div
      ref={containerRef}
      className={className}
      style={{
        height: containerHeight,
        overflow: 'auto',
        position: 'relative',
      }}
    >
      <div style={{ height: totalHeight, position: 'relative' }}>
        {visibleItems}
      </div>
    </div>
  )
}
