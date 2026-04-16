'use client'

import { useEffect, type RefObject } from 'react'

const FOCUSABLE = 'a[href], button:not([disabled]), input:not([disabled]), select:not([disabled]), textarea:not([disabled]), [tabindex]:not([tabindex="-1"])'

/**
 * Traps keyboard focus within the referenced element (for modals/dialogs).
 * Press Tab/Shift+Tab to cycle; focus returns to first element after last.
 */
export function useFocusTrap(ref: RefObject<HTMLElement | null>, active: boolean) {
  useEffect(() => {
    if (!active || !ref.current) return

    const container = ref.current
    const focusable = () => Array.from(container.querySelectorAll<HTMLElement>(FOCUSABLE))

    function handleKeyDown(e: KeyboardEvent) {
      if (e.key !== 'Tab') return
      const elements = focusable()
      if (elements.length === 0) return

      const first = elements[0]
      const last = elements[elements.length - 1]

      if (e.shiftKey && document.activeElement === first) {
        e.preventDefault()
        last.focus()
      } else if (!e.shiftKey && document.activeElement === last) {
        e.preventDefault()
        first.focus()
      }
    }

    // Auto-focus first element
    const elements = focusable()
    if (elements.length > 0) elements[0].focus()

    container.addEventListener('keydown', handleKeyDown)
    return () => container.removeEventListener('keydown', handleKeyDown)
  }, [ref, active])
}
