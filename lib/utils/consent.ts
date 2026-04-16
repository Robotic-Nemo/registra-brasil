/**
 * Consent management utilities for LGPD compliance.
 */

const CONSENT_KEY = 'registra-brasil:lgpd-consent'

export interface ConsentPreferences {
  analytics: boolean
  functional: boolean
  timestamp: string
}

/** Get stored consent preferences */
export function getConsent(): ConsentPreferences | null {
  if (typeof window === 'undefined') return null
  try {
    const stored = localStorage.getItem(CONSENT_KEY)
    return stored ? (JSON.parse(stored) as ConsentPreferences) : null
  } catch {
    return null
  }
}

/** Check if user has given consent at all */
export function hasConsentBeenGiven(): boolean {
  return getConsent() !== null
}

/** Check if analytics consent was given */
export function hasAnalyticsConsent(): boolean {
  return getConsent()?.analytics === true
}

/** Check if functional consent was given */
export function hasFunctionalConsent(): boolean {
  return getConsent()?.functional === true
}

/** Save consent preferences */
export function saveConsent(prefs: Omit<ConsentPreferences, 'timestamp'>): void {
  if (typeof window === 'undefined') return
  const consent: ConsentPreferences = {
    ...prefs,
    timestamp: new Date().toISOString(),
  }
  try {
    localStorage.setItem(CONSENT_KEY, JSON.stringify(consent))
  } catch {
    // Storage unavailable
  }
}

/** Revoke all consent */
export function revokeConsent(): void {
  if (typeof window === 'undefined') return
  try {
    localStorage.removeItem(CONSENT_KEY)
  } catch {
    // Storage unavailable
  }
}

/** Get consent age in days */
export function getConsentAge(): number | null {
  const consent = getConsent()
  if (!consent) return null
  const diff = Date.now() - new Date(consent.timestamp).getTime()
  return Math.floor(diff / (1000 * 60 * 60 * 24))
}

/** Check if consent needs renewal (older than 365 days) */
export function needsConsentRenewal(): boolean {
  const age = getConsentAge()
  return age === null || age > 365
}
