/**
 * Focus management utilities.
 */

const focusStack: HTMLElement[] = []

/** Save the currently focused element to the stack */
export function saveFocus(): void {
  if (typeof document === 'undefined') return
  const active = document.activeElement as HTMLElement
  if (active) focusStack.push(active)
}

/** Restore focus to the last saved element */
export function restoreFocus(): void {
  const el = focusStack.pop()
  if (el && typeof el.focus === 'function') {
    requestAnimationFrame(() => el.focus())
  }
}

/** Move focus to a specific element */
export function moveFocus(element: HTMLElement | null): void {
  if (!element) return
  requestAnimationFrame(() => element.focus())
}

/** Move focus to the first focusable child of a container */
export function focusFirstChild(container: HTMLElement): void {
  const selector = 'a[href], button:not([disabled]), input:not([disabled]), select:not([disabled]), textarea:not([disabled]), [tabindex]:not([tabindex="-1"])'
  const first = container.querySelector<HTMLElement>(selector)
  if (first) moveFocus(first)
}

/** Move focus to the last focusable child of a container */
export function focusLastChild(container: HTMLElement): void {
  const selector = 'a[href], button:not([disabled]), input:not([disabled]), select:not([disabled]), textarea:not([disabled]), [tabindex]:not([tabindex="-1"])'
  const all = container.querySelectorAll<HTMLElement>(selector)
  if (all.length > 0) moveFocus(all[all.length - 1])
}

/** Check if an element is currently focused */
export function isFocused(element: HTMLElement): boolean {
  return typeof document !== 'undefined' && document.activeElement === element
}

/** Focus an element by ID */
export function focusById(id: string): void {
  if (typeof document === 'undefined') return
  const el = document.getElementById(id)
  if (el) moveFocus(el)
}
