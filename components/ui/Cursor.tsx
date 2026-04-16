'use client'

import { useEffect, useRef, useState } from 'react'

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
 * Only renders on devices with a pointer (not touch) and respects
 * prefers-reduced-motion.
 *
 * Performance note: position updates are applied directly to the DOM
 * element via a ref — avoiding 60+/s React re-renders.
 */
export function Cursor({
  size = 32,
  color = 'rgba(59, 130, 246, 0.15)',
  smoothing = 0.15,
}: CursorProps) {
  const [mounted, setMounted] = useState(false)
  const ref = useRef<HTMLDivElement | null>(null)

  useEffect(() => {
    // Respect user preferences.
    const hasPointer = window.matchMedia('(pointer: fine)').matches
    const reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches
    if (!hasPointer || reduceMotion) return

    setMounted(true)

    let currentX = -100
    let currentY = -100
    let targetX = -100
    let targetY = -100
    let animId: number | null = null
    let visible = false
    let isPointer = false

    function applyTransform() {
      const el = ref.current
      if (!el) return
      const s = isPointer ? size * 1.5 : size
      el.style.width = `${s}px`
      el.style.height = `${s}px`
      el.style.transform = `translate3d(${currentX - s / 2}px, ${currentY - s / 2}px, 0)`
      el.style.opacity = visible ? '1' : '0'
    }

    function onMouseMove(e: MouseEvent) {
      targetX = e.clientX
      targetY = e.clientY
      visible = true
      const target = e.target as HTMLElement | null
      const clickable =
        !!target &&
        !!target.closest('a, button, [role="button"], input, select, textarea, [tabindex]')
      isPointer = clickable
    }

    function onMouseLeave() {
      visible = false
    }

    function animate() {
      currentX += (targetX - currentX) * smoothing
      currentY += (targetY - currentY) * smoothing
      applyTransform()
      animId = window.requestAnimationFrame(animate)
    }

    document.addEventListener('mousemove', onMouseMove, { passive: true })
    document.addEventListener('mouseleave', onMouseLeave, { passive: true })
    animate()

    return () => {
      document.removeEventListener('mousemove', onMouseMove)
      document.removeEventListener('mouseleave', onMouseLeave)
      if (animId !== null) window.cancelAnimationFrame(animId)
    }
  }, [smoothing, size])

  if (!mounted) return null

  return (
    <div
      ref={ref}
      className="fixed top-0 left-0 pointer-events-none z-[9999] rounded-full transition-[width,height,opacity] duration-200 opacity-0"
      style={{
        width: size,
        height: size,
        backgroundColor: color,
        willChange: 'transform',
      }}
      aria-hidden="true"
    />
  )
}
