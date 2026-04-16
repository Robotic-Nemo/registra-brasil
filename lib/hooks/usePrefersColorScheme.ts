'use client'

import { useMediaQuery } from './useMediaQuery'

/**
 * Returns 'dark' if the user's system prefers dark mode, 'light' otherwise.
 * SSR-safe: defaults to 'light' on the server.
 */
export function usePrefersColorScheme(): 'light' | 'dark' {
  const prefersDark = useMediaQuery('(prefers-color-scheme: dark)')
  return prefersDark ? 'dark' : 'light'
}
