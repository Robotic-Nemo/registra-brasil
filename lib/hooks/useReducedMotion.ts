'use client'

import { useMediaQuery } from './useMediaQuery'

/**
 * Returns true if the user has enabled "prefers-reduced-motion" in their OS settings.
 * Useful for disabling animations and transitions for accessibility.
 */
export function useReducedMotion(): boolean {
  return useMediaQuery('(prefers-reduced-motion: reduce)')
}
