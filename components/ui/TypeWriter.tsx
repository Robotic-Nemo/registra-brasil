'use client'

import { useState, useEffect, useRef } from 'react'

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
 *
 * Fixes:
 * - Resets animation state when `text` prop changes (was garbling output).
 * - Guards `onComplete` so it fires exactly once per completion, not on
 *   every re-render after completion.
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
  const completedRef = useRef(false)
  const onCompleteRef = useRef(onComplete)

  // Keep the callback reference fresh without retriggering the typing effect.
  useEffect(() => {
    onCompleteRef.current = onComplete
  }, [onComplete])

  // Reset when the text prop changes.
  useEffect(() => {
    setDisplayed('')
    setStarted(false)
    completedRef.current = false
  }, [text])

  useEffect(() => {
    const delayTimer = setTimeout(() => setStarted(true), Math.max(0, delay))
    return () => clearTimeout(delayTimer)
  }, [delay])

  useEffect(() => {
    if (!started) return

    if (displayed.length >= text.length) {
      if (!completedRef.current) {
        completedRef.current = true
        onCompleteRef.current?.()
      }
      return
    }

    const safeSpeed = Math.max(1, speed)
    const timer = setTimeout(() => {
      setDisplayed(text.slice(0, displayed.length + 1))
    }, safeSpeed)

    return () => clearTimeout(timer)
  }, [started, displayed, text, speed])

  return (
    <span className={className} aria-label={text}>
      {displayed}
      {cursor && displayed.length < text.length && (
        <span className="animate-pulse" aria-hidden="true">|</span>
      )}
    </span>
  )
}
