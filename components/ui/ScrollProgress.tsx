'use client'

import { useEffect, useState } from 'react'

interface ScrollProgressProps {
  /** Color of the progress bar */
  color?: string
  /** Height in pixels */
  height?: number
  /** z-index */
  zIndex?: number
}

/**
 * Page scroll progress indicator bar fixed to the top of the viewport.
 */
export function ScrollProgress({
  color = '#1d4ed8',
  height = 3,
  zIndex = 50,
}: ScrollProgressProps) {
  const [progress, setProgress] = useState(0)

  useEffect(() => {
    let rafId = 0
    let ticking = false
    function update() {
      ticking = false
      const scrollTop = document.documentElement.scrollTop || document.body.scrollTop
      const scrollHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight
      const pct = scrollHeight > 0 ? (scrollTop / scrollHeight) * 100 : 0
      setProgress(pct)
    }
    function onScroll() {
      if (ticking) return
      ticking = true
      rafId = window.requestAnimationFrame(update)
    }

    window.addEventListener('scroll', onScroll, { passive: true })
    update()

    return () => {
      window.removeEventListener('scroll', onScroll)
      if (rafId) window.cancelAnimationFrame(rafId)
    }
  }, [])

  if (progress <= 0) return null

  return (
    <div
      className="fixed top-0 left-0 w-full pointer-events-none"
      style={{ zIndex, height }}
      role="progressbar"
      aria-valuenow={Math.round(progress)}
      aria-valuemin={0}
      aria-valuemax={100}
      aria-label="Progresso de leitura"
    >
      <div
        className="h-full transition-[width] duration-150 ease-out"
        style={{
          width: `${progress}%`,
          backgroundColor: color,
        }}
      />
    </div>
  )
}
