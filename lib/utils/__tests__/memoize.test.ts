import { describe, test, expect, vi, beforeEach, afterEach } from 'vitest'
import { memoize, memoizeAsync } from '../memoize'

describe('memoize', () => {
  test('returns cached result for same arguments', () => {
    const fn = vi.fn((x: number) => x * 2)
    const memoized = memoize(fn)
    expect(memoized(5)).toBe(10)
    expect(memoized(5)).toBe(10)
    expect(fn).toHaveBeenCalledTimes(1)
  })

  test('recomputes for different arguments', () => {
    const fn = vi.fn((x: number) => x * 2)
    const memoized = memoize(fn)
    expect(memoized(5)).toBe(10)
    expect(memoized(3)).toBe(6)
    expect(fn).toHaveBeenCalledTimes(2)
  })

  test('evicts oldest entry at maxSize', () => {
    const fn = vi.fn((x: number) => x * 2)
    const memoized = memoize(fn, { maxSize: 2 })
    memoized(1)
    memoized(2)
    memoized(3) // Should evict 1
    memoized(1) // Should recompute
    expect(fn).toHaveBeenCalledTimes(4)
  })

  test('uses custom key function', () => {
    const fn = vi.fn((obj: { id: number }) => obj.id * 2)
    const memoized = memoize(fn, { keyFn: (obj) => String(obj.id) })
    memoized({ id: 1 })
    memoized({ id: 1 }) // Different object, same id
    expect(fn).toHaveBeenCalledTimes(1)
  })
})

describe('memoizeAsync', () => {
  test('caches async results', async () => {
    const fn = vi.fn(async (x: number) => x * 2)
    const memoized = memoizeAsync(fn)
    expect(await memoized(5)).toBe(10)
    expect(await memoized(5)).toBe(10)
    expect(fn).toHaveBeenCalledTimes(1)
  })

  test('deduplicates concurrent calls', async () => {
    let resolvePromise: (v: number) => void
    const fn = vi.fn(() => new Promise<number>(r => { resolvePromise = r }))
    const memoized = memoizeAsync(fn)

    const p1 = memoized()
    const p2 = memoized()
    resolvePromise!(42)

    expect(await p1).toBe(42)
    expect(await p2).toBe(42)
    expect(fn).toHaveBeenCalledTimes(1)
  })

  test('respects TTL expiry', async () => {
    vi.useFakeTimers()
    const fn = vi.fn(async () => 'value')
    const memoized = memoizeAsync(fn, { ttlMs: 100 })

    await memoized()
    expect(fn).toHaveBeenCalledTimes(1)

    vi.advanceTimersByTime(150)
    await memoized()
    expect(fn).toHaveBeenCalledTimes(2)

    vi.useRealTimers()
  })

  test('removes pending on error', async () => {
    const fn = vi.fn()
      .mockRejectedValueOnce(new Error('fail'))
      .mockResolvedValue('ok')
    const memoized = memoizeAsync(fn)

    await expect(memoized()).rejects.toThrow('fail')
    expect(await memoized()).toBe('ok')
    expect(fn).toHaveBeenCalledTimes(2)
  })
})
