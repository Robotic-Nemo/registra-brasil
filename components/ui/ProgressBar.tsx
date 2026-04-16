'use client'

import { useEffect, useState, useCallback } from 'react'
import { usePathname } from 'next/navigation'

export function ProgressBar() {
  const pathname = usePathname()
  const [progress, setProgress] = useState(0)
  const [visible, setVisible] = useState(false)

  const start = useCallback(() => {
    setProgress(0)
    setVisible(true)
    // Animate to 80% quickly, then slow down
    requestAnimationFrame(() => setProgress(80))
  }, [])

  const done = useCallback(() => {
    setProgress(100)
    setTimeout(() => {
      setVisible(false)
      setProgress(0)
    }, 200)
  }, [])

  useEffect(() => {
    start()
    // Small delay to simulate transition completion
    const timer = setTimeout(done, 150)
    return () => clearTimeout(timer)
  }, [pathname, start, done])

  if (!visible && progress === 0) return null

  return (
    <div
      className="fixed top-0 left-0 right-0 z-[100] h-0.5 bg-blue-100"
      role="progressbar"
      aria-valuenow={progress}
      aria-valuemin={0}
      aria-valuemax={100}
    >
      <div
        className="h-full bg-blue-600 transition-[width] duration-300 ease-out"
        style={{ width: `${progress}%` }}
      />
    </div>
  )
}
