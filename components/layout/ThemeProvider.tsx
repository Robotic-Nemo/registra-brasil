'use client'

import { useEffect } from 'react'

const COOKIE_NAME = 'rb:theme'
const ONE_YEAR = 60 * 60 * 24 * 365

/**
 * Reads the persisted theme preference from cookie + system preference,
 * and keeps <html>'s `dark` class in sync. Installed once in the root
 * layout via ClientExtras — idempotent.
 *
 * We do NOT render anything; the `ThemeToggle` (see Header) owns the UI.
 */
export function ThemeProvider() {
  useEffect(() => {
    applyTheme(readPreference())
    // Re-apply when system preference changes (only if user chose 'auto').
    const mql = window.matchMedia('(prefers-color-scheme: dark)')
    const onChange = () => {
      if (readPreference() === 'auto') applyTheme('auto')
    }
    mql.addEventListener('change', onChange)
    return () => mql.removeEventListener('change', onChange)
  }, [])
  return null
}

export type ThemePreference = 'light' | 'dark' | 'auto'

export function readPreference(): ThemePreference {
  try {
    const cookie = document.cookie.split(/;\s*/).find((c) => c.startsWith(`${COOKIE_NAME}=`))
    if (cookie) {
      const v = cookie.slice(COOKIE_NAME.length + 1)
      if (v === 'dark' || v === 'light' || v === 'auto') return v
    }
  } catch { /* ignore */ }
  return 'auto'
}

export function writePreference(v: ThemePreference) {
  document.cookie = `${COOKIE_NAME}=${v}; Path=/; Max-Age=${ONE_YEAR}; SameSite=Lax`
  applyTheme(v)
}

function applyTheme(v: ThemePreference) {
  const root = document.documentElement
  const systemDark = window.matchMedia('(prefers-color-scheme: dark)').matches
  const shouldBeDark = v === 'dark' || (v === 'auto' && systemDark)
  root.classList.toggle('dark', shouldBeDark)
}
