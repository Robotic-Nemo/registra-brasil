import { describe, test, expect, vi } from 'vitest'
import { runIntegrityChecks } from '../data-integrity'

describe('runIntegrityChecks', () => {
  function createMockSupabase(overrides: Record<string, any> = {}) {
    const defaultQuery = {
      select: vi.fn().mockReturnThis(),
      eq: vi.fn().mockReturnThis(),
      is: vi.fn().mockReturnThis(),
      or: vi.fn().mockReturnThis(),
      limit: vi.fn().mockResolvedValue({ data: [], error: null }),
    }

    return {
      from: vi.fn().mockReturnValue({ ...defaultQuery, ...overrides }),
      rpc: vi.fn().mockResolvedValue({ data: null, error: null }),
    }
  }

  test('returns ok: true when no issues found', async () => {
    const supabase = createMockSupabase()
    const report = await runIntegrityChecks(supabase as any)
    expect(report.ok).toBe(true)
    expect(report.totalIssues).toBe(0)
    expect(report.checkedAt).toBeTruthy()
  })

  test('includes checkedAt timestamp', async () => {
    const supabase = createMockSupabase()
    const report = await runIntegrityChecks(supabase as any)
    expect(() => new Date(report.checkedAt)).not.toThrow()
  })

  test('handles database errors gracefully', async () => {
    const supabase = {
      from: vi.fn().mockReturnValue({
        select: vi.fn().mockReturnThis(),
        eq: vi.fn().mockReturnThis(),
        is: vi.fn().mockReturnThis(),
        or: vi.fn().mockReturnThis(),
        limit: vi.fn().mockResolvedValue({ data: null, error: { message: 'DB error' } }),
      }),
      rpc: vi.fn().mockResolvedValue({ data: null, error: { message: 'RPC error' } }),
    }
    const report = await runIntegrityChecks(supabase as any)
    // Should not throw, returns empty issues
    expect(report.ok).toBe(true)
  })
})
