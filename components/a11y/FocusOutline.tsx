'use client'

import { useEffect } from 'react'

/**
 * Adds a global focus outline that only appears during keyboard navigation.
 * Mounts a single style element and listens for keyboard vs mouse input.
 */
export function FocusOutline() {
  useEffect(() => {
    const styleId = 'focus-outline-style'
    if (document.getElementById(styleId)) return

    const style = document.createElement('style')
    style.id = styleId
    style.textContent = `
      body.using-mouse *:focus {
        outline: none !important;
      }
      body:not(.using-mouse) *:focus-visible {
        outline: 2px solid #3b82f6;
        outline-offset: 2px;
        border-radius: 2px;
      }
    `
    document.head.appendChild(style)

    function handleKeyDown(e: KeyboardEvent) {
      if (e.key === 'Tab') document.body.classList.remove('using-mouse')
    }
    function handleMouseDown() {
      document.body.classList.add('using-mouse')
    }

    window.addEventListener('keydown', handleKeyDown)
    window.addEventListener('mousedown', handleMouseDown)
    document.body.classList.add('using-mouse')

    return () => {
      window.removeEventListener('keydown', handleKeyDown)
      window.removeEventListener('mousedown', handleMouseDown)
      style.remove()
    }
  }, [])

  return null
}
