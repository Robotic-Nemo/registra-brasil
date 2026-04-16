import { describe, test, expect, vi } from 'vitest'
import { retryWithBackoff } from '../retry'

describe('retryWithBackoff', () => {
  test('returns result on success', async () => {
    expect(await retryWithBackoff(async () => 42, { attempts: 1 })).toBe(42)
  })

  test('retries on failure then succeeds', async () => {
    let count = 0
    const fn = vi.fn().mockImplementation(async () => {
      count++
      if (count < 2) throw new Error('fail')
      return 'ok'
    })
    const result = await retryWithBackoff(fn, { attempts: 3, baseDelayMs: 1, maxDelayMs: 5 })
    expect(result).toBe('ok')
    expect(fn).toHaveBeenCalledTimes(2)
  })

  test('throws after max attempts', async () => {
    await expect(
      retryWithBackoff(async () => { throw new Error('nope') }, { attempts: 2, baseDelayMs: 1, maxDelayMs: 5 }),
    ).rejects.toThrow('nope')
  })

  test('calls onRetry callback', async () => {
    const onRetry = vi.fn()
    try {
      await retryWithBackoff(
        async () => { throw new Error('x') },
        { attempts: 3, baseDelayMs: 1, maxDelayMs: 5, onRetry },
      )
    } catch { /* expected */ }
    expect(onRetry).toHaveBeenCalledTimes(2)
  })

  test('respects shouldRetry predicate', async () => {
    let count = 0
    await expect(
      retryWithBackoff(
        async () => { count++; throw new Error('stop') },
        { attempts: 5, baseDelayMs: 1, shouldRetry: () => false },
      ),
    ).rejects.toThrow('stop')
    expect(count).toBe(1)
  })
})
