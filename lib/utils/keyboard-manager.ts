/**
 * Global keyboard shortcut manager with scoping support.
 * Allows registering/unregistering shortcuts with scope context.
 */

interface Shortcut {
  key: string
  ctrl?: boolean
  shift?: boolean
  alt?: boolean
  callback: (e: KeyboardEvent) => void
  scope: string
  description: string
}

const shortcuts: Shortcut[] = []
let activeScope = 'global'
let initialized = false

const INPUT_TAGS = new Set(['INPUT', 'TEXTAREA', 'SELECT'])

function handleKeyDown(e: KeyboardEvent) {
  const target = e.target as HTMLElement
  if (INPUT_TAGS.has(target.tagName) || target.isContentEditable) return

  for (const shortcut of shortcuts) {
    if (shortcut.scope !== 'global' && shortcut.scope !== activeScope) continue
    if (shortcut.key.toLowerCase() !== e.key.toLowerCase()) continue
    if (shortcut.ctrl && !e.ctrlKey && !e.metaKey) continue
    if (shortcut.shift && !e.shiftKey) continue
    if (shortcut.alt && !e.altKey) continue

    e.preventDefault()
    shortcut.callback(e)
    return
  }
}

export function initKeyboardManager(): void {
  if (typeof window === 'undefined') return
  if (initialized) return
  initialized = true
  window.addEventListener('keydown', handleKeyDown)
}

export function destroyKeyboardManager(): void {
  if (typeof window === 'undefined') return
  initialized = false
  window.removeEventListener('keydown', handleKeyDown)
  shortcuts.length = 0
}

export function registerShortcut(shortcut: Shortcut): () => void {
  initKeyboardManager()
  shortcuts.push(shortcut)
  return () => {
    const idx = shortcuts.indexOf(shortcut)
    if (idx >= 0) shortcuts.splice(idx, 1)
  }
}

export function setScope(scope: string): void {
  activeScope = scope
}

export function getScope(): string {
  return activeScope
}

export function getShortcuts(scope?: string): Shortcut[] {
  if (scope) return shortcuts.filter((s) => s.scope === scope || s.scope === 'global')
  return [...shortcuts]
}
