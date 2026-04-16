/**
 * Accessibility utility functions.
 */

/** Check if an element is visible and not hidden by aria */
export function isAccessible(el: HTMLElement): boolean {
  if (el.getAttribute('aria-hidden') === 'true') return false
  if (el.hasAttribute('hidden')) return false
  const style = window.getComputedStyle(el)
  if (style.display === 'none' || style.visibility === 'hidden') return false
  return true
}

/** Calculate relative luminance of a color (WCAG 2.1) */
export function relativeLuminance(r: number, g: number, b: number): number {
  const [rs, gs, bs] = [r, g, b].map((c) => {
    const s = c / 255
    return s <= 0.03928 ? s / 12.92 : Math.pow((s + 0.055) / 1.055, 2.4)
  })
  return 0.2126 * rs + 0.7152 * gs + 0.0722 * bs
}

/** Calculate contrast ratio between two colors */
export function contrastRatio(rgb1: [number, number, number], rgb2: [number, number, number]): number {
  const l1 = relativeLuminance(...rgb1)
  const l2 = relativeLuminance(...rgb2)
  const lighter = Math.max(l1, l2)
  const darker = Math.min(l1, l2)
  return (lighter + 0.05) / (darker + 0.05)
}

/** Check if contrast meets WCAG AA for normal text (4.5:1) */
export function meetsAA(rgb1: [number, number, number], rgb2: [number, number, number]): boolean {
  return contrastRatio(rgb1, rgb2) >= 4.5
}

/** Check if contrast meets WCAG AAA for normal text (7:1) */
export function meetsAAA(rgb1: [number, number, number], rgb2: [number, number, number]): boolean {
  return contrastRatio(rgb1, rgb2) >= 7
}

/** Parse hex color to RGB tuple */
export function hexToRgb(hex: string): [number, number, number] {
  const clean = hex.replace('#', '')
  const num = parseInt(clean, 16)
  return [(num >> 16) & 255, (num >> 8) & 255, num & 255]
}

/** Get all focusable elements within a container */
export function getFocusableElements(container: HTMLElement): HTMLElement[] {
  const selector = [
    'a[href]',
    'button:not([disabled])',
    'input:not([disabled]):not([type="hidden"])',
    'select:not([disabled])',
    'textarea:not([disabled])',
    '[tabindex]:not([tabindex="-1"])',
    '[contenteditable="true"]',
  ].join(', ')
  return Array.from(container.querySelectorAll<HTMLElement>(selector)).filter(isAccessible)
}

/** Announce a message to screen readers via aria-live region */
export function announceToScreenReader(message: string, priority: 'polite' | 'assertive' = 'polite'): void {
  if (typeof document === 'undefined') return
  const el = document.createElement('div')
  el.setAttribute('role', 'status')
  el.setAttribute('aria-live', priority)
  el.setAttribute('aria-atomic', 'true')
  el.className = 'sr-only'
  el.textContent = message
  document.body.appendChild(el)
  setTimeout(() => el.remove(), 1000)
}
