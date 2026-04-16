'use client'

import { useState, useEffect } from 'react'

/**
 * Detects the user's preferred language from the browser.
 * Returns the primary language code (e.g. 'pt', 'en', 'es').
 */
export function usePreferredLanguage(): string {
  const [language, setLanguage] = useState('pt')

  useEffect(() => {
    const lang = navigator.language || (navigator as { userLanguage?: string }).userLanguage || 'pt-BR'
    setLanguage(lang.split('-')[0])
  }, [])

  return language
}
