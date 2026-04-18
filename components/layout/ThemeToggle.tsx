'use client'

import { useEffect, useState } from 'react'
import { Sun, Moon, Monitor } from 'lucide-react'
import { readPreference, writePreference, type ThemePreference } from './ThemeProvider'

const OPTIONS: Array<{ value: ThemePreference; label: string; Icon: typeof Sun }> = [
  { value: 'light', label: 'Claro', Icon: Sun },
  { value: 'dark', label: 'Escuro', Icon: Moon },
  { value: 'auto', label: 'Automático', Icon: Monitor },
]

export function ThemeToggle({ className = '' }: { className?: string }) {
  const [pref, setPref] = useState<ThemePreference>('auto')
  useEffect(() => { setPref(readPreference()) }, [])

  function cycle() {
    const idx = OPTIONS.findIndex((o) => o.value === pref)
    const next = OPTIONS[(idx + 1) % OPTIONS.length]
    setPref(next.value)
    writePreference(next.value)
  }

  const current = OPTIONS.find((o) => o.value === pref) ?? OPTIONS[2]
  const Icon = current.Icon

  return (
    <button
      type="button"
      onClick={cycle}
      aria-label={`Tema atual: ${current.label}. Clique para trocar.`}
      title={`Tema: ${current.label}`}
      className={`inline-flex items-center justify-center w-8 h-8 rounded-lg text-gray-600 hover:text-gray-900 hover:bg-gray-100 dark:text-gray-300 dark:hover:text-white dark:hover:bg-gray-800 transition-colors focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500 ${className}`}
    >
      <Icon className="w-4 h-4" aria-hidden="true" />
    </button>
  )
}
