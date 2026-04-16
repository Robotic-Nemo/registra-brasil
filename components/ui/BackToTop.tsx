'use client'

import { useState, useEffect, useCallback } from 'react'
import { ArrowUp } from 'lucide-react'

export function BackToTop() {
  const [visible, setVisible] = useState(false)
  const [scrollPct, setScrollPct] = useState(0)

  useEffect(() => {
    let rafId = 0
    let ticking = false
    function update() {
      ticking = false
      const scrollY = window.scrollY
      const maxScroll = document.documentElement.scrollHeight - window.innerHeight
      setVisible(scrollY > 400)
      setScrollPct(maxScroll > 0 ? Math.min(100, Math.round((scrollY / maxScroll) * 100)) : 0)
    }
    function onScroll() {
      if (ticking) return
      ticking = true
      rafId = window.requestAnimationFrame(update)
    }
    // Initialize on mount (useful if page is scrolled on load).
    update()
    window.addEventListener('scroll', onScroll, { passive: true })
    return () => {
      window.removeEventListener('scroll', onScroll)
      if (rafId) window.cancelAnimationFrame(rafId)
    }
  }, [])

  const handleClick = useCallback(() => {
    const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches
    window.scrollTo({ top: 0, behavior: prefersReducedMotion ? 'instant' : 'smooth' })
  }, [])

  if (!visible) return null

  return (
    <button
      onClick={handleClick}
      className="fixed bottom-6 right-6 z-40 bg-white border border-gray-200 shadow-lg rounded-full p-3 text-gray-600 hover:text-blue-600 hover:border-blue-300 transition-all overflow-hidden"
      aria-label={`Voltar ao topo (${scrollPct}% lido)`}
      style={{ willChange: 'transform, opacity' }}
    >
      <ArrowUp className="w-5 h-5 relative z-10" />
      {/* Scroll progress bar along the bottom edge of the button */}
      <span
        className="absolute bottom-0 left-0 h-0.5 bg-blue-500 transition-[width] duration-150"
        style={{ width: `${scrollPct}%` }}
        aria-hidden="true"
      />
    </button>
  )
}
