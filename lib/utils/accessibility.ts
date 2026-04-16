/**
 * Generate a unique ID for ARIA attributes.
 * Uses a counter to ensure uniqueness within a session.
 */
let counter = 0
export function generateAriaId(prefix = 'aria'): string {
  counter += 1
  return `${prefix}-${counter}`
}

/**
 * Screen-reader-only text helper.
 * Returns class string for visually hidden but accessible text.
 */
export const SR_ONLY = 'sr-only' as const

/**
 * Build aria-describedby from an array of IDs, filtering out falsy values.
 */
export function ariaDescribedBy(...ids: (string | undefined | null | false)[]): string | undefined {
  const filtered = ids.filter(Boolean) as string[]
  return filtered.length > 0 ? filtered.join(' ') : undefined
}

/**
 * Announce a message to screen readers using a live region.
 * Creates a temporary element that is automatically removed.
 */
export function announce(message: string, priority: 'polite' | 'assertive' = 'polite'): void {
  if (typeof document === 'undefined') return

  const el = document.createElement('div')
  el.setAttribute('role', 'status')
  el.setAttribute('aria-live', priority)
  el.setAttribute('aria-atomic', 'true')
  el.className = 'sr-only'
  el.textContent = message
  document.body.appendChild(el)

  setTimeout(() => {
    document.body.removeChild(el)
  }, 1000)
}
