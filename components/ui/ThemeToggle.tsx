'use client'

import { Sun, Moon, Monitor } from 'lucide-react'
import { useTheme, type ThemePreference } from '@/lib/hooks/useTheme'

const CYCLE: ThemePreference[] = ['system', 'light', 'dark']

const ICONS: Record<ThemePreference, typeof Sun> = {
  system: Monitor,
  light: Sun,
  dark: Moon,
}

const LABELS: Record<ThemePreference, string> = {
  system: 'Tema do sistema',
  light: 'Tema claro',
  dark: 'Tema escuro',
}

/**
 * Cycles through system -> light -> dark theme preferences.
 * Renders the appropriate icon for the current preference.
 */
export function ThemeToggle() {
  const { preference, setPreference } = useTheme()

  const handleToggle = () => {
    const currentIndex = CYCLE.indexOf(preference)
    const nextIndex = (currentIndex + 1) % CYCLE.length
    setPreference(CYCLE[nextIndex])
  }

  const Icon = ICONS[preference]
  const label = LABELS[preference]

  return (
    <button
      type="button"
      onClick={handleToggle}
      className="inline-flex items-center justify-center w-9 h-9 rounded-lg text-gray-500 hover:text-gray-900 hover:bg-gray-100 transition-colors"
      aria-label={label}
      title={label}
    >
      <Icon className="w-5 h-5" />
    </button>
  )
}
