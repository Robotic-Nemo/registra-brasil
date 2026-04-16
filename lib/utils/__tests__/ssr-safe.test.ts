import { describe, test, expect, beforeEach, afterEach } from 'vitest'
import {
  isBrowser,
  isServer,
  safeWindow,
  safeDocument,
  safeLocalStorage,
  safeSessionStorage,
  getStorageItem,
  setStorageItem,
  getCurrentPath,
} from '../ssr-safe'

describe('SSR-safe utilities (server side)', () => {
  let originalWindow: unknown

  beforeEach(() => {
    originalWindow = (globalThis as Record<string, unknown>).window
    delete (globalThis as Record<string, unknown>).window
  })

  afterEach(() => {
    if (originalWindow !== undefined) {
      ;(globalThis as Record<string, unknown>).window = originalWindow
    }
  })

  test('isBrowser returns false without window', () => {
    expect(isBrowser()).toBe(false)
  })

  test('isServer returns true without window', () => {
    expect(isServer()).toBe(true)
  })

  test('safeWindow returns undefined', () => {
    expect(safeWindow()).toBeUndefined()
  })

  test('safeDocument returns undefined', () => {
    expect(safeDocument()).toBeUndefined()
  })

  test('safeLocalStorage returns undefined', () => {
    expect(safeLocalStorage()).toBeUndefined()
  })

  test('safeSessionStorage returns undefined', () => {
    expect(safeSessionStorage()).toBeUndefined()
  })

  test('getStorageItem returns default on server', () => {
    expect(getStorageItem('k', 'default')).toBe('default')
  })

  test('setStorageItem silently no-ops on server', () => {
    expect(() => setStorageItem('k', 'v')).not.toThrow()
  })

  test('getCurrentPath returns empty on server', () => {
    expect(getCurrentPath()).toBe('')
  })
})

describe('SSR-safe utilities (browser side)', () => {
  let originalWindow: unknown

  beforeEach(() => {
    originalWindow = (globalThis as Record<string, unknown>).window
    const store: Record<string, string> = {}
    const storage = {
      getItem: (k: string) => (k in store ? store[k] : null),
      setItem: (k: string, v: string) => { store[k] = v },
      removeItem: (k: string) => { delete store[k] },
      clear: () => {},
      key: () => null,
      length: 0,
    }
    ;(globalThis as Record<string, unknown>).window = {
      localStorage: storage,
      sessionStorage: storage,
      location: { pathname: '/test' },
      document: {},
    }
    ;(globalThis as Record<string, unknown>).document = (globalThis as Record<string, unknown>).window
      ? ((globalThis as Record<string, unknown>).window as { document: unknown }).document
      : undefined
  })

  afterEach(() => {
    if (originalWindow !== undefined) {
      ;(globalThis as Record<string, unknown>).window = originalWindow
    } else {
      delete (globalThis as Record<string, unknown>).window
    }
  })

  test('isBrowser returns true', () => {
    expect(isBrowser()).toBe(true)
  })

  test('safeWindow returns the window object', () => {
    expect(safeWindow()).toBeDefined()
  })

  test('setStorageItem/getStorageItem roundtrip', () => {
    setStorageItem('key', { a: 1 })
    expect(getStorageItem('key', null)).toEqual({ a: 1 })
  })

  test('getStorageItem returns default for missing key', () => {
    expect(getStorageItem('missing', 'default')).toBe('default')
  })

  test('getStorageItem returns default on invalid JSON', () => {
    ;(globalThis as any).window.localStorage.setItem('bad', '{invalid')
    expect(getStorageItem('bad', 'fallback')).toBe('fallback')
  })

  test('getCurrentPath returns pathname', () => {
    expect(getCurrentPath()).toBe('/test')
  })
})
