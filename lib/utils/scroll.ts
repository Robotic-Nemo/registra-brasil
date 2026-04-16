/**
 * Smooth scroll utilities.
 */

const isBrowser = typeof window !== 'undefined'

/** Scroll to the top of the page smoothly. */
export function scrollToTop(): void {
  if (!isBrowser) return
  window.scrollTo({ top: 0, behavior: 'smooth' })
}

/** Scroll to an element by ID with optional offset for sticky headers. */
export function scrollToElement(id: string, offset = 80): void {
  if (!isBrowser) return
  const el = document.getElementById(id)
  if (!el) return
  const y = el.getBoundingClientRect().top + window.scrollY - offset
  window.scrollTo({ top: y, behavior: 'smooth' })
}

/** Scroll to an element only if it's not currently visible in the viewport. */
export function scrollIntoViewIfNeeded(el: HTMLElement, offset = 80): void {
  if (!isBrowser) return
  const rect = el.getBoundingClientRect()
  const isVisible = rect.top >= offset && rect.bottom <= window.innerHeight
  if (!isVisible) {
    const y = rect.top + window.scrollY - offset
    window.scrollTo({ top: y, behavior: 'smooth' })
  }
}

/** Lock body scroll (for modals/overlays). Returns an unlock function. */
export function lockBodyScroll(): () => void {
  if (!isBrowser) return () => {}
  const scrollY = window.scrollY
  document.body.style.position = 'fixed'
  document.body.style.top = `-${scrollY}px`
  document.body.style.width = '100%'
  document.body.style.overflow = 'hidden'

  return () => {
    document.body.style.position = ''
    document.body.style.top = ''
    document.body.style.width = ''
    document.body.style.overflow = ''
    window.scrollTo(0, scrollY)
  }
}
