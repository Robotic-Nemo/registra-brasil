'use client'

import { useState, useEffect } from 'react'

/**
 * Tracks reading progress as user scrolls through content.
 * Returns a value between 0 and 100.
 */
export function useReadingProgress(): number {
  const [progress, setProgress] = useState(0)

  useEffect(() => {
    function handleScroll() {
      const scrollTop = window.scrollY
      const docHeight = document.documentElement.scrollHeight - window.innerHeight
      if (docHeight <= 0) {
        setProgress(100)
        return
      }
      setProgress(Math.max(0, Math.min(100, Math.round((scrollTop / docHeight) * 100))))
    }

    window.addEventListener('scroll', handleScroll, { passive: true })
    handleScroll()
    return () => window.removeEventListener('scroll', handleScroll)
  }, [])

  return progress
}
