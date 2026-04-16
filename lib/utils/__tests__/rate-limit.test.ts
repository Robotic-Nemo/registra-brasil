import { describe, test, expect, vi, beforeEach, afterEach } from 'vitest'
import { checkRateLimit } from '../rate-limit'

describe('checkRateLimit', () => {
  beforeEach(() => {
    vi.useFakeTimers()
  })

  afterEach(() => {
    vi.useRealTimers()
  })

  test('allows first request', () => {
    const result = checkRateLimit('test-key-1', { limit: 5, windowMs: 60000 })
    expect(result.allowed).toBe(true)
    expect(result.remaining).toBe(4)
  })

  test('decrements remaining on each request', () => {
    const key = 'test-key-2'
    const config = { limit: 3, windowMs: 60000 }
    checkRateLimit(key, config)
    const r2 = checkRateLimit(key, config)
    expect(r2.remaining).toBe(1)
    const r3 = checkRateLimit(key, config)
    expect(r3.remaining).toBe(0)
  })

  test('blocks when limit exceeded', () => {
    const key = 'test-key-3'
    const config = { limit: 2, windowMs: 60000 }
    checkRateLimit(key, config)
    checkRateLimit(key, config)
    const r3 = checkRateLimit(key, config)
    expect(r3.allowed).toBe(false)
    expect(r3.remaining).toBe(0)
  })

  test('resets after window expires', () => {
    const key = 'test-key-4'
    const config = { limit: 1, windowMs: 1000 }
    checkRateLimit(key, config)
    const blocked = checkRateLimit(key, config)
    expect(blocked.allowed).toBe(false)

    vi.advanceTimersByTime(1500)
    const allowed = checkRateLimit(key, config)
    expect(allowed.allowed).toBe(true)
  })

  test('returns resetAt timestamp', () => {
    const result = checkRateLimit('test-key-5', { limit: 10, windowMs: 60000 })
    expect(result.resetAt).toBeGreaterThan(Date.now())
  })
})
