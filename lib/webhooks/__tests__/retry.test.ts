import { describe, test, expect, vi } from 'vitest'
import {
  calculateRetryDelay,
  getNextRetryAt,
  shouldRetry,
  getRetrySchedule,
  DEFAULT_RETRY_CONFIG,
} from '../retry'

describe('calculateRetryDelay', () => {
  test('returns null when max attempts reached', () => {
    expect(calculateRetryDelay(DEFAULT_RETRY_CONFIG.maxAttempts)).toBeNull()
  })

  test('returns a number for first attempt', () => {
    const delay = calculateRetryDelay(0)
    expect(typeof delay).toBe('number')
    expect(delay).toBeGreaterThanOrEqual(1000)
  })

  test('respects maxDelayMs', () => {
    const cfg = { maxAttempts: 20, baseDelayMs: 1000, maxDelayMs: 10000, jitterFactor: 0 }
    const delay = calculateRetryDelay(10, cfg)
    expect(delay).toBeLessThanOrEqual(10000)
  })

  test('applies exponential backoff without jitter', () => {
    const cfg = { maxAttempts: 10, baseDelayMs: 1000, maxDelayMs: 1_000_000, jitterFactor: 0 }
    expect(calculateRetryDelay(0, cfg)).toBe(1000)
    expect(calculateRetryDelay(1, cfg)).toBe(2000)
    expect(calculateRetryDelay(2, cfg)).toBe(4000)
    expect(calculateRetryDelay(3, cfg)).toBe(8000)
  })

  test('applies jitter', () => {
    const cfg = { maxAttempts: 10, baseDelayMs: 1000, maxDelayMs: 1_000_000, jitterFactor: 0.5 }
    const values = Array.from({ length: 10 }, () => calculateRetryDelay(2, cfg))
    // Expect some variance
    expect(new Set(values).size).toBeGreaterThan(1)
  })
})

describe('getNextRetryAt', () => {
  test('returns ISO date for valid attempt', () => {
    const iso = getNextRetryAt(0)
    expect(iso).toMatch(/\d{4}-\d{2}-\d{2}T/)
  })

  test('returns null when max reached', () => {
    expect(getNextRetryAt(DEFAULT_RETRY_CONFIG.maxAttempts)).toBeNull()
  })
})

describe('shouldRetry', () => {
  test('null (network error) retries', () => {
    expect(shouldRetry(null)).toBe(true)
  })
  test('429 retries', () => {
    expect(shouldRetry(429)).toBe(true)
  })
  test('500 retries', () => {
    expect(shouldRetry(500)).toBe(true)
  })
  test('503 retries', () => {
    expect(shouldRetry(503)).toBe(true)
  })
  test('200 does not retry', () => {
    expect(shouldRetry(200)).toBe(false)
  })
  test('400 does not retry', () => {
    expect(shouldRetry(400)).toBe(false)
  })
  test('404 does not retry', () => {
    expect(shouldRetry(404)).toBe(false)
  })
})

describe('getRetrySchedule', () => {
  test('returns schedule strings', () => {
    const schedule = getRetrySchedule()
    expect(schedule.length).toBe(DEFAULT_RETRY_CONFIG.maxAttempts)
    for (const s of schedule) {
      expect(typeof s).toBe('string')
      expect(s).toMatch(/Attempt/)
    }
  })

  test('scales units (s/min/h)', () => {
    const schedule = getRetrySchedule({ maxAttempts: 15, baseDelayMs: 1000, maxDelayMs: 3_600_000, jitterFactor: 0 })
    const joined = schedule.join('\n')
    expect(joined).toMatch(/s|min|h/)
  })
})
