import { describe, test, expect, vi, afterEach } from 'vitest'
import { copyToClipboard, readFromClipboard } from '../clipboard'

function setNavigator(value: unknown) {
  try {
    Object.defineProperty(globalThis, 'navigator', { value, configurable: true })
    return true
  } catch {
    return false
  }
}

describe('copyToClipboard', () => {
  afterEach(() => {
    try { Object.defineProperty(globalThis, 'navigator', { value: undefined, configurable: true }) } catch { /* */ }
  })

  test('uses Clipboard API when available', async () => {
    const writeText = vi.fn().mockResolvedValue(undefined)
    if (!setNavigator({ clipboard: { writeText } })) return
    const ok = await copyToClipboard('hello')
    expect(ok).toBe(true)
    expect(writeText).toHaveBeenCalledWith('hello')
  })

  test('returns a boolean even without clipboard', async () => {
    setNavigator({})
    const r = await copyToClipboard('x')
    expect(typeof r).toBe('boolean')
  })
})

describe('readFromClipboard', () => {
  afterEach(() => {
    try { Object.defineProperty(globalThis, 'navigator', { value: undefined, configurable: true }) } catch { /* */ }
  })

  test('returns text when readText works', async () => {
    if (!setNavigator({ clipboard: { readText: () => Promise.resolve('hi') } })) return
    expect(await readFromClipboard()).toBe('hi')
  })

  test('returns null on rejection', async () => {
    if (!setNavigator({ clipboard: { readText: () => Promise.reject(new Error('x')) } })) return
    expect(await readFromClipboard()).toBeNull()
  })

  test('returns null without clipboard', async () => {
    if (!setNavigator({})) return
    expect(await readFromClipboard()).toBeNull()
  })
})
