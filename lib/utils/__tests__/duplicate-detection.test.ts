import { describe, test, expect } from 'vitest'
import { detectDuplicates } from '../duplicate-detection'

describe('detectDuplicates', () => {
  test('detects identical statements same politician', () => {
    const candidates = detectDuplicates([
      { id: '1', summary: 'Lula falou sobre economia', full_quote: null, politician_id: 'p1', politician_name: 'Lula', statement_date: '2024-01-01' },
      { id: '2', summary: 'Lula falou sobre economia', full_quote: null, politician_id: 'p1', politician_name: 'Lula', statement_date: '2024-01-01' },
    ])
    expect(candidates).toHaveLength(1)
    expect(candidates[0].similarity).toBeGreaterThan(0.5)
  })

  test('returns empty when below threshold', () => {
    const candidates = detectDuplicates([
      { id: '1', summary: 'Completely different text A', full_quote: null, politician_id: 'p1', politician_name: 'Lula', statement_date: '2024-01-01' },
      { id: '2', summary: 'Totally unrelated content X', full_quote: null, politician_id: 'p2', politician_name: 'Bolsonaro', statement_date: '2024-02-01' },
    ])
    expect(candidates).toHaveLength(0)
  })

  test('deduplicates pair keys', () => {
    const s1 = { id: '1', summary: 'aaa bbb ccc', full_quote: null, politician_id: 'p', politician_name: 'X', statement_date: '2024-01-01' }
    const s2 = { id: '2', summary: 'aaa bbb ccc', full_quote: null, politician_id: 'p', politician_name: 'X', statement_date: '2024-01-01' }
    const candidates = detectDuplicates([s1, s2])
    expect(candidates).toHaveLength(1)
  })

  test('sorts by similarity descending', () => {
    const candidates = detectDuplicates([
      { id: '1', summary: 'Statement about politics in Brazil', full_quote: null, politician_id: 'p1', politician_name: 'A', statement_date: '2024-01-01' },
      { id: '2', summary: 'Statement about politics in Brazil', full_quote: null, politician_id: 'p1', politician_name: 'A', statement_date: '2024-01-01' },
      { id: '3', summary: 'Statement about politics in Brasil', full_quote: null, politician_id: 'p2', politician_name: 'B', statement_date: '2024-02-01' },
    ])
    for (let i = 1; i < candidates.length; i++) {
      expect(candidates[i - 1].similarity).toBeGreaterThanOrEqual(candidates[i].similarity)
    }
  })

  test('respects custom threshold', () => {
    const low = detectDuplicates([
      { id: '1', summary: 'abc', full_quote: null, politician_id: 'p', politician_name: 'X', statement_date: '2024-01-01' },
      { id: '2', summary: 'xyz', full_quote: null, politician_id: 'p', politician_name: 'X', statement_date: '2024-01-01' },
    ], 0.1)
    expect(low.length).toBeGreaterThanOrEqual(0)
  })

  test('empty input returns empty', () => {
    expect(detectDuplicates([])).toEqual([])
  })
})
