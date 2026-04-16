'use client'

import { useState, useEffect } from 'react'

/**
 * Detects whether the user is navigating with keyboard (focus-visible).
 * Returns true when the user last used keyboard to focus.
 */
export function useFocusVisible(): boolean {
  const [isKeyboard, setIsKeyboard] = useState(false)

  useEffect(() => {
    function handleKeyDown(e: KeyboardEvent) {
      if (e.key === 'Tab') setIsKeyboard(true)
    }
    function handleMouseDown() {
      setIsKeyboard(false)
    }

    window.addEventListener('keydown', handleKeyDown)
    window.addEventListener('mousedown', handleMouseDown)
    return () => {
      window.removeEventListener('keydown', handleKeyDown)
      window.removeEventListener('mousedown', handleMouseDown)
    }
  }, [])

  return isKeyboard
}
