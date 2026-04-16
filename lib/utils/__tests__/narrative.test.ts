import { describe, test, expect } from 'vitest'
import { groupIntoNarratives, formatDateRange } from '../narrative'

function stmt(overrides: Record<string, unknown> = {}) {
  return {
    id: 'id',
    summary: 'summary',
    statement_date: '2024-01-01',
    politician_id: 'p1',
    politician_name: 'Lula',
    politician_party: 'PT',
    politician_slug: 'lula',
    categories: [{ slug: 'economia', label: 'Economia', color: '#f00' }],
    ...overrides,
  }
}

describe('groupIntoNarratives', () => {
  test('returns empty for empty input', () => {
    expect(groupIntoNarratives([])).toEqual([])
  })

  test('requires at least 2 statements for a thread', () => {
    expect(groupIntoNarratives([stmt()])).toEqual([])
  })

  test('groups statements by politician+category', () => {
    const result = groupIntoNarratives([
      stmt({ id: '1', statement_date: '2024-01-01' }),
      stmt({ id: '2', statement_date: '2024-01-15' }),
    ])
    expect(result).toHaveLength(1)
    expect(result[0].thread.statementCount).toBe(2)
  })

  test('splits groups by time gap', () => {
    const result = groupIntoNarratives([
      stmt({ id: '1', statement_date: '2024-01-01' }),
      stmt({ id: '2', statement_date: '2024-01-15' }),
      stmt({ id: '3', statement_date: '2024-10-01' }),
      stmt({ id: '4', statement_date: '2024-10-15' }),
    ])
    expect(result.length).toBeGreaterThanOrEqual(2)
  })

  test('ignores different politicians', () => {
    const result = groupIntoNarratives([
      stmt({ id: '1', politician_id: 'p1' }),
      stmt({ id: '2', politician_id: 'p2' }),
    ])
    expect(result).toEqual([])
  })
})

describe('formatDateRange', () => {
  test('same month/year returns single month', () => {
    expect(formatDateRange('2024-01-01', '2024-01-31')).toBe('Jan 2024')
  })
  test('same year different months returns range', () => {
    expect(formatDateRange('2024-01-01', '2024-06-30')).toMatch(/^Jan - Jun 2024$/)
  })
  test('different years includes both', () => {
    expect(formatDateRange('2023-12-01', '2024-03-01')).toContain('2023')
    expect(formatDateRange('2023-12-01', '2024-03-01')).toContain('2024')
  })
})
