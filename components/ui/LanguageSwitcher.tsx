'use client'

import { useState } from 'react'
import { Globe } from 'lucide-react'

interface Language {
  code: string
  label: string
  flag: string
}

const languages: Language[] = [
  { code: 'pt', label: 'Portugues', flag: 'BR' },
  { code: 'en', label: 'English', flag: 'US' },
  { code: 'es', label: 'Espanol', flag: 'ES' },
]

interface LanguageSwitcherProps {
  currentLanguage?: string
  onLanguageChange?: (code: string) => void
}

/**
 * Language switcher component (prep for future i18n).
 */
export function LanguageSwitcher({
  currentLanguage = 'pt',
  onLanguageChange,
}: LanguageSwitcherProps) {
  const [open, setOpen] = useState(false)
  const current = languages.find((l) => l.code === currentLanguage) ?? languages[0]

  return (
    <div className="relative">
      <button
        onClick={() => setOpen(!open)}
        className="inline-flex items-center gap-1.5 px-2.5 py-1.5 text-sm text-gray-600 dark:text-gray-400 hover:text-gray-800 dark:hover:text-gray-200 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors"
        aria-label="Selecionar idioma"
        aria-expanded={open}
      >
        <Globe className="h-4 w-4" aria-hidden="true" />
        <span>{current.flag}</span>
      </button>

      {open && (
        <div className="absolute right-0 top-full mt-1 w-40 bg-white dark:bg-gray-800 rounded-lg shadow-xl border border-gray-200 dark:border-gray-700 py-1 z-50">
          {languages.map((lang) => (
            <button
              key={lang.code}
              onClick={() => {
                onLanguageChange?.(lang.code)
                setOpen(false)
              }}
              className={`w-full text-left px-3 py-2 text-sm flex items-center gap-2 hover:bg-gray-100 dark:hover:bg-gray-700 transition-colors ${
                lang.code === currentLanguage
                  ? 'text-blue-600 dark:text-blue-400 font-medium'
                  : 'text-gray-700 dark:text-gray-300'
              }`}
            >
              <span>{lang.flag}</span>
              <span>{lang.label}</span>
            </button>
          ))}
        </div>
      )}
    </div>
  )
}
