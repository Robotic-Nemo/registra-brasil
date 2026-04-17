'use client'

import { useEffect, useRef, useState } from 'react'
import { usePathname } from 'next/navigation'

export function ProgressBar() {
  const pathname = usePathname()
  const [progress, setProgress] = useState(0)
  const [visible, setVisible] = useState(false)
  const rafRef = useRef<number | null>(null)
  const jumpTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null)
  const doneTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null)
  const hideTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null)

  useEffect(() => {
    // Cancel any in-flight animation from the previous navigation.
    if (rafRef.current !== null) cancelAnimationFrame(rafRef.current)
    if (jumpTimerRef.current) clearTimeout(jumpTimerRef.current)
    if (doneTimerRef.current) clearTimeout(doneTimerRef.current)
    if (hideTimerRef.current) clearTimeout(hideTimerRef.current)

    setProgress(0)
    setVisible(true)
    rafRef.current = requestAnimationFrame(() => setProgress(80))

    doneTimerRef.current = setTimeout(() => {
      setProgress(100)
      hideTimerRef.current = setTimeout(() => {
        setVisible(false)
        setProgress(0)
      }, 200)
    }, 150)

    return () => {
      if (rafRef.current !== null) cancelAnimationFrame(rafRef.current)
      if (jumpTimerRef.current) clearTimeout(jumpTimerRef.current)
      if (doneTimerRef.current) clearTimeout(doneTimerRef.current)
      if (hideTimerRef.current) clearTimeout(hideTimerRef.current)
    }
  }, [pathname])

  if (!visible && progress === 0) return null

  return (
    <div
      className="fixed top-0 left-0 right-0 z-[100] h-0.5 bg-blue-100"
      role="progressbar"
      aria-label="Carregando página"
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
