'use client'

import { createContext, useContext, useCallback, useSyncExternalStore } from 'react'

export type ThemePreference = 'system' | 'light' | 'dark'
export type ResolvedTheme = 'light' | 'dark'

const STORAGE_KEY = 'registra-brasil-theme'

function getStoredPreference(): ThemePreference {
  if (typeof window === 'undefined') return 'system'
  const stored = localStorage.getItem(STORAGE_KEY)
  if (stored === 'light' || stored === 'dark' || stored === 'system') return stored
  return 'system'
}

function getSystemTheme(): ResolvedTheme {
  if (typeof window === 'undefined') return 'light'
  return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'
}

function resolveTheme(preference: ThemePreference): ResolvedTheme {
  if (preference === 'system') return getSystemTheme()
  return preference
}

export interface ThemeContextValue {
  preference: ThemePreference
  resolved: ResolvedTheme
  setPreference: (pref: ThemePreference) => void
}

export const ThemeContext = createContext<ThemeContextValue>({
  preference: 'system',
  resolved: 'light',
  setPreference: () => {},
})

/** Subscribe to theme changes (localStorage + system media query) */
const themeListeners = new Set<() => void>()

function subscribe(callback: () => void): () => void {
  themeListeners.add(callback)
  return () => themeListeners.delete(callback)
}

function notifyListeners(): void {
  themeListeners.forEach((cb) => cb())
}

let currentPreference: ThemePreference = getStoredPreference()

function getSnapshot(): ThemePreference {
  return currentPreference
}

function getServerSnapshot(): ThemePreference {
  return 'system'
}

export function useThemePreference(): ThemeContextValue {
  const preference = useSyncExternalStore(subscribe, getSnapshot, getServerSnapshot)
  const resolved = resolveTheme(preference)

  const setPreference = useCallback((pref: ThemePreference) => {
    currentPreference = pref
    if (typeof window !== 'undefined') {
      localStorage.setItem(STORAGE_KEY, pref)
    }
    notifyListeners()
  }, [])

  return { preference, resolved, setPreference }
}

/** Convenience hook for consuming the ThemeContext */
export function useTheme(): ThemeContextValue {
  return useContext(ThemeContext)
}
