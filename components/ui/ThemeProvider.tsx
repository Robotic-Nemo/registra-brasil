'use client'

import { useEffect, type ReactNode } from 'react'
import { ThemeContext, useThemePreference } from '@/lib/hooks/useTheme'

interface ThemeProviderProps {
  children: ReactNode
}

/**
 * Provides theme context and applies the `dark` class to <html>.
 * Wrap the app's root layout with this component to enable dark mode.
 */
export function ThemeProvider({ children }: ThemeProviderProps) {
  const theme = useThemePreference()

  useEffect(() => {
    const root = document.documentElement
    if (theme.resolved === 'dark') {
      root.classList.add('dark')
    } else {
      root.classList.remove('dark')
    }
  }, [theme.resolved])

  return (
    <ThemeContext value={theme}>
      {children}
    </ThemeContext>
  )
}
