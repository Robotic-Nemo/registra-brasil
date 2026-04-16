'use client'

import { useEffect, useState } from 'react'

interface CursorProps {
  /** Size of the cursor follower in pixels */
  size?: number
  /** Color of the cursor follower */
  color?: string
  /** Delay/smoothing factor (0-1, lower = smoother) */
  smoothing?: number
}

/**
 * Custom cursor follower that trails the mouse position.
 * Only renders on devices with a pointer (not touch).
 */
export function Cursor({
  size = 32,
  color = 'rgba(59, 130, 246, 0.15)',
  smoothing = 0.15,
}: CursorProps) {
  const [position, setPosition] = useState({ x: -100, y: -100 })
  const [isPointer, setIsPointer] = useState(false)
  const [visible, setVisible] = useState(false)

  useEffect(() => {
    // Only activate on devices with fine pointer
    const hasPointer = window.matchMedia('(pointer: fine)').matches
    if (!hasPointer) return

    let currentX = -100
    let currentY = -100
    let targetX = -100
    let targetY = -100
    let animId: number

    function onMouseMove(e: MouseEvent) {
      targetX = e.clientX
      targetY = e.clientY
      setVisible(true)

      // Check if hovering over a clickable element
      const target = e.target as HTMLElement
      const clickable = target.closest('a, button, [role="button"], input, select, textarea, [tabindex]')
      setIsPointer(!!clickable)
    }

    function onMouseLeave() {
      setVisible(false)
    }

    function animate() {
      currentX += (targetX - currentX) * smoothing
      currentY += (targetY - currentY) * smoothing
      setPosition({ x: currentX, y: currentY })
      animId = requestAnimationFrame(animate)
    }

    document.addEventListener('mousemove', onMouseMove)
    document.addEventListener('mouseleave', onMouseLeave)
    animate()

    return () => {
      document.removeEventListener('mousemove', onMouseMove)
      document.removeEventListener('mouseleave', onMouseLeave)
      cancelAnimationFrame(animId)
    }
  }, [smoothing])

  if (!visible) return null

  const currentSize = isPointer ? size * 1.5 : size

  return (
    <div
      className="fixed top-0 left-0 pointer-events-none z-[9999] rounded-full transition-[width,height] duration-200"
      style={{
        width: currentSize,
        height: currentSize,
        backgroundColor: color,
        transform: `translate(${position.x - currentSize / 2}px, ${position.y - currentSize / 2}px)`,
      }}
      aria-hidden="true"
    />
  )
}
