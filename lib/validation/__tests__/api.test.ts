import { describe, test, expect } from 'vitest'
import { statementsQuerySchema, politiciansQuerySchema, extractQueryParams } from '../api'

describe('statementsQuerySchema', () => {
  test('accepts empty', () => {
    expect(statementsQuerySchema.parse({}).ok).toBe(true)
  })
  test('accepts valid params', () => {
    const r = statementsQuerySchema.parse({
      page: 1, limit: 10, politician: 'lula', category: 'saude', status: 'verified',
      sort: 'statement_date', order: 'desc',
    })
    expect(r.ok).toBe(true)
  })
  test('rejects limit > 50', () => {
    expect(statementsQuerySchema.parse({ limit: 100 }).ok).toBe(false)
  })
  test('rejects invalid status', () => {
    expect(statementsQuerySchema.parse({ status: 'fake' }).ok).toBe(false)
  })
  test('rejects invalid sort', () => {
    expect(statementsQuerySchema.parse({ sort: 'unknown' }).ok).toBe(false)
  })
  test('rejects invalid order', () => {
    expect(statementsQuerySchema.parse({ order: 'up' }).ok).toBe(false)
  })
})

describe('politiciansQuerySchema', () => {
  test('accepts empty', () => {
    expect(politiciansQuerySchema.parse({}).ok).toBe(true)
  })
  test('accepts valid params', () => {
    expect(politiciansQuerySchema.parse({ page: 1, limit: 50, party: 'PT', state: 'SP' }).ok).toBe(true)
  })
  test('rejects state > 2 chars', () => {
    expect(politiciansQuerySchema.parse({ state: 'São Paulo' }).ok).toBe(false)
  })
  test('rejects limit > 100', () => {
    expect(politiciansQuerySchema.parse({ limit: 101 }).ok).toBe(false)
  })
})

describe('extractQueryParams', () => {
  test('extracts listed keys', () => {
    const p = new URLSearchParams('a=1&b=2&c=3')
    expect(extractQueryParams(p, ['a', 'b'])).toEqual({ a: '1', b: '2' })
  })
  test('undefined for missing keys', () => {
    const p = new URLSearchParams('a=1')
    expect(extractQueryParams(p, ['a', 'b']).b).toBeUndefined()
  })
  test('empty list returns empty object', () => {
    expect(extractQueryParams(new URLSearchParams('a=1'), [])).toEqual({})
  })
})
