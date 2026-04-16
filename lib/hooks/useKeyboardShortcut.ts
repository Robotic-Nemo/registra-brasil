'use client'

import { useEffect } from 'react'

interface ShortcutOptions {
  ctrl?: boolean
  shift?: boolean
  alt?: boolean
  meta?: boolean
  /** Prevent default browser behavior */
  preventDefault?: boolean
  /** Only trigger when no input is focused */
  ignoreInputs?: boolean
}

const INPUT_TAGS = new Set(['INPUT', 'TEXTAREA', 'SELECT'])

/**
 * Register a keyboard shortcut.
 * @param key - The key to listen for (e.g. 'k', 'Escape', '/')
 * @param callback - Function to call when shortcut triggers
 * @param options - Modifier keys and behavior options
 */
export function useKeyboardShortcut(
  key: string,
  callback: (e: KeyboardEvent) => void,
  options: ShortcutOptions = {}
) {
  const { ctrl, shift, alt, meta, preventDefault = true, ignoreInputs = true } = options

  useEffect(() => {
    function handler(e: KeyboardEvent) {
      if (ctrl && !e.ctrlKey && !e.metaKey) return
      if (shift && !e.shiftKey) return
      if (alt && !e.altKey) return
      if (meta && !e.metaKey) return
      if (e.key.toLowerCase() !== key.toLowerCase() && e.code !== key) return

      if (ignoreInputs) {
        const target = e.target as HTMLElement
        if (INPUT_TAGS.has(target.tagName) || target.isContentEditable) return
      }

      if (preventDefault) e.preventDefault()
      callback(e)
    }

    window.addEventListener('keydown', handler)
    return () => window.removeEventListener('keydown', handler)
  }, [key, callback, ctrl, shift, alt, meta, preventDefault, ignoreInputs])
}
