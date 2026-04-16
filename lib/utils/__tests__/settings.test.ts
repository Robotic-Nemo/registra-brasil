import { describe, test, expect, beforeEach, afterEach } from 'vitest'
import { loadSettings, formatSettingKey, getEnvVarName } from '../settings'

describe('loadSettings', () => {
  const ORIGINAL = { ...process.env }
  const RELEVANT = [
    'SITE_NAME', 'SITE_DESCRIPTION', 'NEXT_PUBLIC_SITE_URL',
    'STATEMENTS_PER_PAGE', 'REQUIRE_REVIEW', 'ALERT_EMAIL',
    'NOTIFY_NEW_SUGGESTIONS', 'MAINTENANCE_MODE', 'ENABLE_API',
    'CACHE_ENABLED', 'CACHE_TTL_SECONDS',
  ]

  beforeEach(() => {
    for (const k of RELEVANT) delete process.env[k]
  })

  afterEach(() => {
    process.env = { ...ORIGINAL }
  })

  test('returns defaults when env unset', () => {
    const s = loadSettings()
    expect(typeof s.siteName).toBe('string')
    expect(typeof s.requireReview).toBe('boolean')
    expect(typeof s.statementsPerPage).toBe('number')
  })

  test('overrides from env', () => {
    process.env.SITE_NAME = 'Test Site'
    expect(loadSettings().siteName).toBe('Test Site')
  })

  test('maintenanceMode true only when set to "true"', () => {
    expect(loadSettings().maintenanceMode).toBe(false)
    process.env.MAINTENANCE_MODE = 'true'
    expect(loadSettings().maintenanceMode).toBe(true)
  })

  test('requireReview true by default, false only when "false"', () => {
    expect(loadSettings().requireReview).toBe(true)
    process.env.REQUIRE_REVIEW = 'false'
    expect(loadSettings().requireReview).toBe(false)
  })

  test('statementsPerPage parses int', () => {
    process.env.STATEMENTS_PER_PAGE = '42'
    expect(loadSettings().statementsPerPage).toBe(42)
  })

  test('statementsPerPage falls back on invalid int', () => {
    process.env.STATEMENTS_PER_PAGE = 'abc'
    expect(typeof loadSettings().statementsPerPage).toBe('number')
  })
})

describe('formatSettingKey', () => {
  test('formats camelCase to Title Case', () => {
    expect(formatSettingKey('siteName')).toBe('Site Name')
  })
  test('handles already-cased', () => {
    expect(formatSettingKey('name')).toBe('Name')
  })
  test('handles multiple caps', () => {
    expect(formatSettingKey('cacheTtlSeconds')).toBe('Cache Ttl Seconds')
  })
})

describe('getEnvVarName', () => {
  test('maps siteName', () => {
    expect(getEnvVarName('siteName')).toBe('SITE_NAME')
  })
  test('maps siteUrl', () => {
    expect(getEnvVarName('siteUrl')).toBe('NEXT_PUBLIC_SITE_URL')
  })
  test('maps cacheTtlSeconds', () => {
    expect(getEnvVarName('cacheTtlSeconds')).toBe('CACHE_TTL_SECONDS')
  })
})
