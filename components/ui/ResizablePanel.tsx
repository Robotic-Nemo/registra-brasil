'use client'

import { useState, useRef, useCallback } from 'react'

interface ResizablePanelProps {
  children: [React.ReactNode, React.ReactNode]
  defaultSize?: number // percentage for first panel
  minSize?: number
  maxSize?: number
  direction?: 'horizontal' | 'vertical'
  className?: string
}

export function ResizablePanel({
  children,
  defaultSize = 50,
  minSize = 20,
  maxSize = 80,
  direction = 'horizontal',
  className = '',
}: ResizablePanelProps) {
  const [size, setSize] = useState(defaultSize)
  const containerRef = useRef<HTMLDivElement>(null)
  const dragging = useRef(false)

  const handleMouseDown = useCallback(() => {
    dragging.current = true
    document.body.style.cursor = direction === 'horizontal' ? 'col-resize' : 'row-resize'
    document.body.style.userSelect = 'none'

    const handleMouseMove = (e: MouseEvent) => {
      if (!dragging.current || !containerRef.current) return
      const rect = containerRef.current.getBoundingClientRect()
      const pos = direction === 'horizontal'
        ? ((e.clientX - rect.left) / rect.width) * 100
        : ((e.clientY - rect.top) / rect.height) * 100
      setSize(Math.min(Math.max(pos, minSize), maxSize))
    }

    const handleMouseUp = () => {
      dragging.current = false
      document.body.style.cursor = ''
      document.body.style.userSelect = ''
      document.removeEventListener('mousemove', handleMouseMove)
      document.removeEventListener('mouseup', handleMouseUp)
    }

    document.addEventListener('mousemove', handleMouseMove)
    document.addEventListener('mouseup', handleMouseUp)
  }, [direction, minSize, maxSize])

  const isHorizontal = direction === 'horizontal'

  return (
    <div
      ref={containerRef}
      className={`flex ${isHorizontal ? 'flex-row' : 'flex-col'} ${className}`}
      style={{ height: '100%' }}
    >
      <div style={{ [isHorizontal ? 'width' : 'height']: `${size}%` }} className="overflow-auto">
        {children[0]}
      </div>
      <div
        className={`flex-shrink-0 ${isHorizontal ? 'w-1 cursor-col-resize hover:bg-blue-300' : 'h-1 cursor-row-resize hover:bg-blue-300'} bg-zinc-200 transition-colors`}
        onMouseDown={handleMouseDown}
        role="separator"
        aria-orientation={isHorizontal ? 'vertical' : 'horizontal'}
        aria-valuenow={Math.round(size)}
      />
      <div className="flex-1 overflow-auto">
        {children[1]}
      </div>
    </div>
  )
}
