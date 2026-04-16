import { describe, test, expect } from 'vitest'
import { checkDataQuality, getIssueLabel } from '../data-quality'

function stmt(overrides: Partial<any> = {}): any {
  return {
    id: 'id1',
    summary: 'This is a valid summary that is long enough',
    full_quote: 'Full quote',
    context: 'Some context',
    primary_source_url: 'https://ex.com',
    slug: 'slug',
    statement_date: '2024-01-01',
    verification_status: 'verified',
    created_at: new Date().toISOString(),
    politician_name: 'Lula',
    category_count: 2,
    ...overrides,
  }
}

describe('checkDataQuality', () => {
  test('detects no issues for valid statement', () => {
    const result = checkDataQuality([stmt()])
    expect(result.issues).toHaveLength(0)
    expect(result.score.score).toBe(100)
  })

  test('detects missing source', () => {
    const result = checkDataQuality([stmt({ primary_source_url: '' })])
    expect(result.issues.some((i) => i.type === 'missing_source')).toBe(true)
  })

  test('detects empty quote', () => {
    const result = checkDataQuality([stmt({ full_quote: null })])
    expect(result.issues.some((i) => i.type === 'empty_quote')).toBe(true)
  })

  test('detects missing category', () => {
    const result = checkDataQuality([stmt({ category_count: 0 })])
    expect(result.issues.some((i) => i.type === 'missing_category')).toBe(true)
  })

  test('detects short summary', () => {
    const result = checkDataQuality([stmt({ summary: 'short' })])
    expect(result.issues.some((i) => i.type === 'short_summary')).toBe(true)
  })

  test('detects stale unverified', () => {
    const oldDate = new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString()
    const result = checkDataQuality([stmt({ verification_status: 'unverified', created_at: oldDate })])
    expect(result.issues.some((i) => i.type === 'stale_unverified')).toBe(true)
  })

  test('detects future date', () => {
    const future = new Date(Date.now() + 86400000).toISOString()
    const result = checkDataQuality([stmt({ statement_date: future })])
    expect(result.issues.some((i) => i.type === 'future_date')).toBe(true)
  })

  test('returns score 100 for empty input', () => {
    expect(checkDataQuality([]).score.score).toBe(100)
  })

  test('byType aggregates count', () => {
    const result = checkDataQuality([
      stmt({ primary_source_url: '' }),
      stmt({ primary_source_url: '' }),
    ])
    expect(result.score.byType.missing_source).toBe(2)
  })
})

describe('getIssueLabel', () => {
  test('returns label for known type', () => {
    expect(getIssueLabel('missing_source')).toMatch(/Fonte/)
  })
  test('returns type for unknown', () => {
    expect(getIssueLabel('unknown_type' as any)).toBe('unknown_type')
  })
})
