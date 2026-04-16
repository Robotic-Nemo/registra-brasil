'use client'

import { useCallback } from 'react'
import { t } from './translations'
import { useLocalStorage } from '@/lib/hooks/useLocalStorage'

const LOCALE_KEY = 'registra-brasil:locale'

/**
 * Translation hook for future internationalization.
 * Currently returns Portuguese strings by default.
 */
export function useTranslation() {
  const [locale, setLocale] = useLocalStorage<string>(LOCALE_KEY, 'pt')

  const translate = useCallback(
    (key: string, params?: Record<string, string>) => {
      return t(key, locale, params)
    },
    [locale]
  )

  return {
    t: translate,
    locale,
    setLocale,
  }
}
