import { describe, test, expect } from 'vitest'
import { getVariant, isInVariant, generateABTestUserId, AB_TEST_COOKIE } from '../ab-test'
import type { ABTestConfig } from '../ab-test'

const testConfig: ABTestConfig = {
  name: 'test-experiment',
  variants: ['control', 'variant_a', 'variant_b'],
}

describe('getVariant', () => {
  test('returns a valid variant', () => {
    const variant = getVariant(testConfig, 'user-123')
    expect(testConfig.variants).toContain(variant)
  })

  test('returns consistent variant for same user', () => {
    const v1 = getVariant(testConfig, 'user-123')
    const v2 = getVariant(testConfig, 'user-123')
    expect(v1).toBe(v2)
  })

  test('may return different variants for different users', () => {
    const variants = new Set<string>()
    for (let i = 0; i < 100; i++) {
      variants.add(getVariant(testConfig, `user-${i}`))
    }
    // With 100 users and 3 variants, we should get at least 2 different variants
    expect(variants.size).toBeGreaterThanOrEqual(2)
  })

  test('throws for empty variants', () => {
    expect(() => getVariant({ name: 'test', variants: [] }, 'user')).toThrow()
  })

  test('returns the only variant for single-variant test', () => {
    expect(getVariant({ name: 'test', variants: ['only'] }, 'user')).toBe('only')
  })
})

describe('isInVariant', () => {
  test('returns true when user matches variant', () => {
    const variant = getVariant(testConfig, 'user-123')
    expect(isInVariant(testConfig, 'user-123', variant)).toBe(true)
  })

  test('returns false when user does not match variant', () => {
    const variant = getVariant(testConfig, 'user-123')
    const other = testConfig.variants.find(v => v !== variant) ?? 'x'
    expect(isInVariant(testConfig, 'user-123', other)).toBe(false)
  })
})

describe('generateABTestUserId', () => {
  test('returns a non-empty string', () => {
    const id = generateABTestUserId()
    expect(id.length).toBeGreaterThan(0)
  })

  test('generates unique IDs', () => {
    const ids = new Set(Array.from({ length: 50 }, () => generateABTestUserId()))
    expect(ids.size).toBe(50)
  })
})

describe('AB_TEST_COOKIE', () => {
  test('is a string', () => {
    expect(typeof AB_TEST_COOKIE).toBe('string')
    expect(AB_TEST_COOKIE).toBe('rb_ab_uid')
  })
})
