import { describe, test, expect, beforeEach, afterEach } from 'vitest'
import { validateEnv, logEnvStatus } from '../env'

const ORIG = { ...process.env }

describe('validateEnv', () => {
  beforeEach(() => {
    // Clear required env vars
    for (const key of [
      'NEXT_PUBLIC_SUPABASE_URL', 'NEXT_PUBLIC_SUPABASE_ANON_KEY',
      'SUPABASE_SERVICE_ROLE_KEY', 'ADMIN_SECRET',
    ]) delete process.env[key]
  })

  afterEach(() => {
    process.env = { ...ORIG }
  })

  test('reports missing required vars', () => {
    const r = validateEnv()
    expect(r.valid).toBe(false)
    expect(r.errors.length).toBeGreaterThan(0)
    expect(r.errors.some((e) => e.includes('NEXT_PUBLIC_SUPABASE_URL'))).toBe(true)
  })

  test('valid when all required are set', () => {
    process.env.NEXT_PUBLIC_SUPABASE_URL = 'x'
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY = 'x'
    process.env.SUPABASE_SERVICE_ROLE_KEY = 'x'
    process.env.ADMIN_SECRET = 'x'
    const r = validateEnv()
    expect(r.valid).toBe(true)
    expect(r.errors).toEqual([])
  })

  test('reports optional as warnings', () => {
    const r = validateEnv()
    expect(Array.isArray(r.warnings)).toBe(true)
  })
})

describe('logEnvStatus', () => {
  test('does not throw', () => {
    expect(() => logEnvStatus()).not.toThrow()
  })
})
