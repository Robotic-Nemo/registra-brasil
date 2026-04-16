import { describe, test, expect, vi, beforeEach, afterEach } from 'vitest'
import { runHealthCheck } from '../health-check'

describe('runHealthCheck', () => {
  const originalEnv = { ...process.env }

  afterEach(() => {
    process.env = { ...originalEnv }
  })

  test('returns healthy when all checks pass', async () => {
    process.env.NEXT_PUBLIC_SUPABASE_URL = 'https://test.supabase.co'
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY = 'test-key'
    process.env.SUPABASE_SERVICE_ROLE_KEY = 'service-key'
    process.env.ADMIN_SECRET = 'secret'

    const mockSupabase = {
      from: vi.fn().mockReturnValue({
        select: vi.fn().mockResolvedValue({ error: null }),
      }),
    }

    const result = await runHealthCheck(mockSupabase)
    expect(result.status).toBe('healthy')
    expect(result.checks.every(c => c.status === 'pass')).toBe(true)
  })

  test('returns unhealthy when env vars missing', async () => {
    delete process.env.NEXT_PUBLIC_SUPABASE_URL
    delete process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY

    const result = await runHealthCheck(null)
    expect(result.status).toBe('unhealthy')
    const envCheck = result.checks.find(c => c.name === 'env_vars')
    expect(envCheck?.status).toBe('fail')
  })

  test('returns unhealthy when database fails', async () => {
    process.env.NEXT_PUBLIC_SUPABASE_URL = 'https://test.supabase.co'
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY = 'test-key'
    process.env.SUPABASE_SERVICE_ROLE_KEY = 'key'
    process.env.ADMIN_SECRET = 'secret'

    const mockSupabase = {
      from: vi.fn().mockReturnValue({
        select: vi.fn().mockResolvedValue({ error: { message: 'Connection refused' } }),
      }),
    }

    const result = await runHealthCheck(mockSupabase)
    expect(result.status).toBe('unhealthy')
    const dbCheck = result.checks.find(c => c.name === 'database')
    expect(dbCheck?.status).toBe('fail')
  })

  test('returns degraded when optional env vars missing', async () => {
    process.env.NEXT_PUBLIC_SUPABASE_URL = 'https://test.supabase.co'
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY = 'test-key'
    delete process.env.SUPABASE_SERVICE_ROLE_KEY
    delete process.env.ADMIN_SECRET

    const mockSupabase = {
      from: vi.fn().mockReturnValue({
        select: vi.fn().mockResolvedValue({ error: null }),
      }),
    }

    const result = await runHealthCheck(mockSupabase)
    expect(result.status).toBe('degraded')
  })

  test('includes timestamp', async () => {
    const result = await runHealthCheck(null)
    expect(result.timestamp).toBeTruthy()
    expect(() => new Date(result.timestamp)).not.toThrow()
  })

  test('handles database check when no supabase client', async () => {
    process.env.NEXT_PUBLIC_SUPABASE_URL = 'url'
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY = 'key'

    const result = await runHealthCheck(null)
    const dbCheck = result.checks.find(c => c.name === 'database')
    expect(dbCheck?.status).toBe('fail')
    expect(dbCheck?.message).toContain('não disponível')
  })
})
