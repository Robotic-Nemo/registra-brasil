'use client'

import { useState, useEffect } from 'react'

interface Props {
  text: string
  /** Typing speed in milliseconds per character */
  speed?: number
  /** Delay before starting to type */
  delay?: number
  /** Show blinking cursor */
  cursor?: boolean
  className?: string
  onComplete?: () => void
}

/**
 * Typewriter text effect that types out text character by character.
 */
export function TypeWriter({
  text,
  speed = 50,
  delay = 0,
  cursor = true,
  className = '',
  onComplete,
}: Props) {
  const [displayed, setDisplayed] = useState('')
  const [started, setStarted] = useState(false)

  useEffect(() => {
    const delayTimer = setTimeout(() => setStarted(true), delay)
    return () => clearTimeout(delayTimer)
  }, [delay])

  useEffect(() => {
    if (!started) return

    if (displayed.length >= text.length) {
      onComplete?.()
      return
    }

    const timer = setTimeout(() => {
      setDisplayed(text.slice(0, displayed.length + 1))
    }, speed)

    return () => clearTimeout(timer)
  }, [started, displayed, text, speed, onComplete])

  return (
    <span className={className} aria-label={text}>
      {displayed}
      {cursor && displayed.length < text.length && (
        <span className="animate-pulse" aria-hidden="true">|</span>
      )}
    </span>
  )
}
