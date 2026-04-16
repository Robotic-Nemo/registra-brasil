/** Common key codes for keyboard event handlers */
export const Keys = {
  Enter: 'Enter',
  Space: ' ',
  Escape: 'Escape',
  ArrowUp: 'ArrowUp',
  ArrowDown: 'ArrowDown',
  ArrowLeft: 'ArrowLeft',
  ArrowRight: 'ArrowRight',
  Home: 'Home',
  End: 'End',
  Tab: 'Tab',
} as const

/** Check if a keyboard event is an activation key (Enter or Space) */
export function isActivationKey(e: { key: string }): boolean {
  return e.key === Keys.Enter || e.key === Keys.Space
}

/** Check if a keyboard event is an arrow key */
export function isArrowKey(e: { key: string }): boolean {
  return (
    e.key === Keys.ArrowUp ||
    e.key === Keys.ArrowDown ||
    e.key === Keys.ArrowLeft ||
    e.key === Keys.ArrowRight
  )
}

/**
 * Handle roving tabindex navigation for a list of items.
 * Returns the new focused index or -1 if the key was not handled.
 */
export function rovingIndex(
  key: string,
  currentIndex: number,
  itemCount: number,
  orientation: 'horizontal' | 'vertical' = 'vertical'
): number {
  const prev = orientation === 'vertical' ? Keys.ArrowUp : Keys.ArrowLeft
  const next = orientation === 'vertical' ? Keys.ArrowDown : Keys.ArrowRight

  if (key === next) return (currentIndex + 1) % itemCount
  if (key === prev) return currentIndex <= 0 ? itemCount - 1 : currentIndex - 1
  if (key === Keys.Home) return 0
  if (key === Keys.End) return itemCount - 1

  return -1
}
