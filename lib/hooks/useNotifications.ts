'use client'

import { useState, useCallback, useEffect } from 'react'

const STORAGE_KEY = 'registra-brasil:notification-prefs'

export interface NotificationPreferences {
  /** Show toast notifications for search results */
  searchAlerts: boolean
  /** Show banner for new features */
  featureAnnouncements: boolean
  /** Show verification status updates */
  verificationUpdates: boolean
  /** Sound enabled for notifications */
  soundEnabled: boolean
}

const DEFAULT_PREFS: NotificationPreferences = {
  searchAlerts: true,
  featureAnnouncements: true,
  verificationUpdates: true,
  soundEnabled: false,
}

function readPrefs(): NotificationPreferences {
  if (typeof window === 'undefined') return DEFAULT_PREFS
  try {
    const raw = localStorage.getItem(STORAGE_KEY)
    if (!raw) return DEFAULT_PREFS
    return { ...DEFAULT_PREFS, ...JSON.parse(raw) }
  } catch {
    return DEFAULT_PREFS
  }
}

function writePrefs(prefs: NotificationPreferences) {
  try {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(prefs))
  } catch {
    // Storage unavailable
  }
}

/**
 * Hook to manage notification preferences persisted in localStorage.
 */
export function useNotifications() {
  const [prefs, setPrefs] = useState<NotificationPreferences>(DEFAULT_PREFS)

  useEffect(() => {
    setPrefs(readPrefs())
  }, [])

  const updatePref = useCallback(<K extends keyof NotificationPreferences>(
    key: K,
    value: NotificationPreferences[K],
  ) => {
    setPrefs((prev) => {
      const next = { ...prev, [key]: value }
      writePrefs(next)
      return next
    })
  }, [])

  const resetPrefs = useCallback(() => {
    setPrefs(DEFAULT_PREFS)
    writePrefs(DEFAULT_PREFS)
  }, [])

  return { prefs, updatePref, resetPrefs } as const
}
