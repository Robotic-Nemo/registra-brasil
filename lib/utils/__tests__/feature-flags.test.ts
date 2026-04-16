import { describe, test, expect, beforeEach, afterEach } from 'vitest'
import { isFeatureEnabled, getEnabledFeatures, requireFeature, isClientFeatureEnabled } from '../feature-flags'

describe('feature-flags', () => {
  const ORIGINAL = { ...process.env }

  beforeEach(() => {
    for (const key of Object.keys(process.env)) {
      if (key.startsWith('FEATURE_') || key.startsWith('NEXT_PUBLIC_FEATURE_')) {
        delete process.env[key]
      }
    }
  })

  afterEach(() => {
    process.env = { ...ORIGINAL }
  })

  test('isFeatureEnabled returns false by default', () => {
    expect(isFeatureEnabled('dark_mode')).toBe(false)
  })

  test('isFeatureEnabled true when "true"', () => {
    process.env.FEATURE_DARK_MODE = 'true'
    expect(isFeatureEnabled('dark_mode')).toBe(true)
  })

  test('isFeatureEnabled true when "1"', () => {
    process.env.FEATURE_DARK_MODE = '1'
    expect(isFeatureEnabled('dark_mode')).toBe(true)
  })

  test('isFeatureEnabled false for "false"', () => {
    process.env.FEATURE_DARK_MODE = 'false'
    expect(isFeatureEnabled('dark_mode')).toBe(false)
  })

  test('isFeatureEnabled false for empty string', () => {
    process.env.FEATURE_DARK_MODE = ''
    expect(isFeatureEnabled('dark_mode')).toBe(false)
  })

  test('getEnabledFeatures returns enabled flags', () => {
    process.env.FEATURE_DARK_MODE = 'true'
    process.env.FEATURE_ADVANCED_SEARCH = '1'
    const enabled = getEnabledFeatures()
    expect(enabled).toContain('dark_mode')
    expect(enabled).toContain('advanced_search')
  })

  test('getEnabledFeatures returns empty when none set', () => {
    expect(getEnabledFeatures()).toEqual([])
  })

  test('requireFeature throws when disabled', () => {
    expect(() => requireFeature('dark_mode')).toThrow(/dark_mode/)
  })

  test('requireFeature passes when enabled', () => {
    process.env.FEATURE_DARK_MODE = 'true'
    expect(() => requireFeature('dark_mode')).not.toThrow()
  })

  test('isClientFeatureEnabled false without window', () => {
    // In node environment, window is undefined
    // @ts-expect-error safety
    delete globalThis.window
    expect(isClientFeatureEnabled('dark_mode')).toBe(false)
  })
})
