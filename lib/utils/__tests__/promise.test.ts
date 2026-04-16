import { describe, test, expect, vi, beforeEach, afterEach } from 'vitest'
import { sleep, withTimeout, retryWithBackoff, parallelLimit, createDeferred } from '../promise'

describe('sleep', () => {
  beforeEach(() => { vi.useFakeTimers() })
  afterEach(() => { vi.useRealTimers() })

  test('resolves after given time', async () => {
    const promise = sleep(100)
    vi.advanceTimersByTime(100)
    await expect(promise).resolves.toBeUndefined()
  })
})

describe('withTimeout', () => {
  beforeEach(() => { vi.useFakeTimers() })
  afterEach(() => { vi.useRealTimers() })

  test('resolves if promise finishes before timeout', async () => {
    const promise = withTimeout(Promise.resolve(42), 1000)
    await expect(promise).resolves.toBe(42)
  })

  test('rejects if promise exceeds timeout', async () => {
    const slow = new Promise(() => {}) // never resolves
    const promise = withTimeout(slow, 100)
    vi.advanceTimersByTime(100)
    await expect(promise).rejects.toThrow('Timeout after 100ms')
  })

  test('uses custom message', async () => {
    const slow = new Promise(() => {})
    const promise = withTimeout(slow, 100, 'Custom timeout')
    vi.advanceTimersByTime(100)
    await expect(promise).rejects.toThrow('Custom timeout')
  })
})

describe('retryWithBackoff', () => {
  test('returns value on first success', async () => {
    const fn = vi.fn().mockResolvedValue('ok')
    const result = await retryWithBackoff(fn, { maxRetries: 3, baseDelayMs: 1 })
    expect(result).toBe('ok')
    expect(fn).toHaveBeenCalledTimes(1)
  })

  test('retries and succeeds eventually', async () => {
    const fn = vi.fn()
      .mockRejectedValueOnce(new Error('fail'))
      .mockResolvedValue('ok')
    const result = await retryWithBackoff(fn, { maxRetries: 3, baseDelayMs: 1, maxDelayMs: 5 })
    expect(result).toBe('ok')
    expect(fn).toHaveBeenCalledTimes(2)
  })

  test('throws after max retries', async () => {
    const fn = vi.fn().mockRejectedValue(new Error('always fail'))
    await expect(
      retryWithBackoff(fn, { maxRetries: 2, baseDelayMs: 1, maxDelayMs: 2 })
    ).rejects.toThrow('always fail')
    expect(fn).toHaveBeenCalledTimes(3) // initial + 2 retries
  })
})

describe('parallelLimit', () => {
  test('processes all items', async () => {
    const items = [1, 2, 3, 4, 5]
    const results = await parallelLimit(items, 2, async (n) => n * 2)
    expect(results).toEqual([2, 4, 6, 8, 10])
  })

  test('handles empty array', async () => {
    const results = await parallelLimit([], 3, async (n: number) => n)
    expect(results).toEqual([])
  })

  test('respects concurrency limit', async () => {
    let maxConcurrent = 0
    let current = 0
    const items = [1, 2, 3, 4]

    await parallelLimit(items, 2, async () => {
      current++
      maxConcurrent = Math.max(maxConcurrent, current)
      await new Promise(r => setTimeout(r, 10))
      current--
    })

    expect(maxConcurrent).toBeLessThanOrEqual(2)
  })
})

describe('createDeferred', () => {
  test('resolves when resolve is called', async () => {
    const { promise, resolve } = createDeferred<string>()
    resolve('hello')
    await expect(promise).resolves.toBe('hello')
  })

  test('rejects when reject is called', async () => {
    const { promise, reject } = createDeferred<string>()
    reject(new Error('fail'))
    await expect(promise).rejects.toThrow('fail')
  })
})
