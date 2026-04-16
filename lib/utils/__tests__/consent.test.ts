import { describe, test, expect, beforeEach, vi } from 'vitest'
import {
  getConsent,
  hasConsentBeenGiven,
  hasAnalyticsConsent,
  hasFunctionalConsent,
  saveConsent,
  revokeConsent,
  getConsentAge,
  needsConsentRenewal,
} from '../consent'

function mockLocalStorage() {
  let store: Record<string, string> = {}
  return {
    getItem: (key: string) => (key in store ? store[key] : null),
    setItem: (key: string, value: string) => { store[key] = value },
    removeItem: (key: string) => { delete store[key] },
    clear: () => { store = {} },
    get _store() { return store },
  }
}

describe('consent utilities', () => {
  beforeEach(() => {
    const ls = mockLocalStorage()
    // @ts-expect-error - shim localStorage on globalThis
    globalThis.window = { localStorage: ls }
    // @ts-expect-error - allow global
    globalThis.localStorage = ls
  })

  test('getConsent returns null when no consent stored', () => {
    expect(getConsent()).toBeNull()
  })

  test('hasConsentBeenGiven is false initially', () => {
    expect(hasConsentBeenGiven()).toBe(false)
  })

  test('saveConsent persists preferences', () => {
    saveConsent({ analytics: true, functional: true })
    expect(hasConsentBeenGiven()).toBe(true)
    expect(hasAnalyticsConsent()).toBe(true)
    expect(hasFunctionalConsent()).toBe(true)
  })

  test('saveConsent adds timestamp', () => {
    saveConsent({ analytics: false, functional: true })
    const consent = getConsent()!
    expect(consent.timestamp).toBeDefined()
    expect(new Date(consent.timestamp).toString()).not.toBe('Invalid Date')
  })

  test('hasAnalyticsConsent false when not granted', () => {
    saveConsent({ analytics: false, functional: true })
    expect(hasAnalyticsConsent()).toBe(false)
  })

  test('revokeConsent clears storage', () => {
    saveConsent({ analytics: true, functional: true })
    revokeConsent()
    expect(getConsent()).toBeNull()
  })

  test('getConsentAge returns null when not set', () => {
    expect(getConsentAge()).toBeNull()
  })

  test('getConsentAge returns 0 for fresh consent', () => {
    saveConsent({ analytics: true, functional: true })
    expect(getConsentAge()).toBe(0)
  })

  test('needsConsentRenewal true when no consent', () => {
    expect(needsConsentRenewal()).toBe(true)
  })

  test('needsConsentRenewal false when fresh', () => {
    saveConsent({ analytics: true, functional: true })
    expect(needsConsentRenewal()).toBe(false)
  })

  test('needsConsentRenewal true for consent older than 365 days', () => {
    // Manually insert old consent
    localStorage.setItem(
      'registra-brasil:lgpd-consent',
      JSON.stringify({
        analytics: true,
        functional: true,
        timestamp: new Date(Date.now() - 366 * 24 * 60 * 60 * 1000).toISOString(),
      }),
    )
    expect(needsConsentRenewal()).toBe(true)
  })

  test('getConsent returns null on malformed JSON', () => {
    localStorage.setItem('registra-brasil:lgpd-consent', '{bad json')
    expect(getConsent()).toBeNull()
  })
})
