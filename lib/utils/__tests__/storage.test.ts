import { describe, test, expect, beforeEach, afterEach } from 'vitest'
import { getItem, setItem, removeItem } from '../storage'

function mockStorage() {
  const store: Record<string, string> = {}
  return {
    getItem: (k: string) => (k in store ? store[k] : null),
    setItem: (k: string, v: string) => { store[k] = v },
    removeItem: (k: string) => { delete store[k] },
    clear: () => {},
    key: () => null,
    length: 0,
  }
}

describe('storage (browser)', () => {
  let origWin: unknown

  beforeEach(() => {
    origWin = (globalThis as Record<string, unknown>).window
    ;(globalThis as Record<string, unknown>).window = {
      localStorage: mockStorage(),
      sessionStorage: mockStorage(),
    }
  })

  afterEach(() => {
    if (origWin !== undefined) (globalThis as Record<string, unknown>).window = origWin
    else delete (globalThis as Record<string, unknown>).window
  })

  test('setItem/getItem roundtrip', () => {
    setItem('k', { n: 1 })
    expect(getItem('k', null)).toEqual({ n: 1 })
  })

  test('getItem returns default when missing', () => {
    expect(getItem('missing', 'd')).toBe('d')
  })

  test('getItem returns default on bad JSON', () => {
    ;(globalThis as any).window.localStorage.setItem('bad', '{')
    expect(getItem('bad', 'default')).toBe('default')
  })

  test('removeItem removes key', () => {
    setItem('k', 1)
    removeItem('k')
    expect(getItem('k', null)).toBeNull()
  })

  test('supports sessionStorage', () => {
    setItem('k', 'session', 'session')
    expect(getItem('k', null, 'session')).toBe('session')
  })
})

describe('storage (SSR)', () => {
  let origWin: unknown
  beforeEach(() => {
    origWin = (globalThis as Record<string, unknown>).window
    delete (globalThis as Record<string, unknown>).window
  })
  afterEach(() => {
    if (origWin !== undefined) (globalThis as Record<string, unknown>).window = origWin
  })

  test('getItem returns default without window', () => {
    expect(getItem('k', 'd')).toBe('d')
  })

  test('setItem no-op without window', () => {
    expect(() => setItem('k', 1)).not.toThrow()
  })

  test('removeItem no-op without window', () => {
    expect(() => removeItem('k')).not.toThrow()
  })
})
