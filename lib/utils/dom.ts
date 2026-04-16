/** Check if the code is running in a browser environment */
export function isBrowser(): boolean {
  return typeof window !== 'undefined'
}

/** Get the current URL path (browser only) */
export function getPath(): string {
  return isBrowser() ? window.location.pathname : '/'
}

/** Check if an element is in the viewport */
export function isInViewport(el: HTMLElement): boolean {
  if (!isBrowser()) return false
  const rect = el.getBoundingClientRect()
  return (
    rect.top >= 0 &&
    rect.left >= 0 &&
    rect.bottom <= window.innerHeight &&
    rect.right <= window.innerWidth
  )
}

/** Lock body scroll (for modals/overlays) */
export function lockScroll(): () => void {
  if (!isBrowser()) return () => {}
  const scrollY = window.scrollY
  document.body.style.position = 'fixed'
  document.body.style.top = `-${scrollY}px`
  document.body.style.width = '100%'

  return () => {
    document.body.style.position = ''
    document.body.style.top = ''
    document.body.style.width = ''
    window.scrollTo(0, scrollY)
  }
}

/** Focus the first focusable element within a container */
export function focusFirst(container: HTMLElement): void {
  const focusable = container.querySelector<HTMLElement>(
    'a[href], button:not([disabled]), input:not([disabled]), select, textarea, [tabindex]:not([tabindex="-1"])'
  )
  focusable?.focus()
}
