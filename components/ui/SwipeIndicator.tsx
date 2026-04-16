'use client'

import { ChevronLeft, ChevronRight } from 'lucide-react'

interface SwipeIndicatorProps {
  direction: 'left' | 'right' | 'both'
  className?: string
}

/**
 * Visual indicator for swipeable content.
 */
export function SwipeIndicator({ direction, className = '' }: SwipeIndicatorProps) {
  return (
    <div
      className={`flex items-center justify-center gap-1 text-gray-400 dark:text-gray-600 ${className}`}
      aria-hidden="true"
    >
      {(direction === 'left' || direction === 'both') && (
        <ChevronLeft className="h-4 w-4 animate-pulse" />
      )}
      <span className="text-xs">Deslize</span>
      {(direction === 'right' || direction === 'both') && (
        <ChevronRight className="h-4 w-4 animate-pulse" />
      )}
    </div>
  )
}
