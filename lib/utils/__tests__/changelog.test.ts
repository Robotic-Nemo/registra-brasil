import { describe, test, expect } from 'vitest'
import { sortChangelog, getVersion, getVersions, filterByType, getEntriesInRange, formatVersion } from '../changelog'
import type { ChangelogEntry } from '../changelog'

const entries: ChangelogEntry[] = [
  { date: '2024-01-01', version: '1.0.0', title: 'v1', changes: ['a'], type: 'feature' },
  { date: '2024-02-01', version: '1.1.0', title: 'v1.1', changes: ['b'], type: 'fix' },
  { date: '2024-03-01', version: '1.2.0', title: 'v1.2', changes: ['c'], type: 'feature' },
]

describe('sortChangelog', () => {
  test('newest first', () => {
    const sorted = sortChangelog(entries)
    expect(sorted[0].version).toBe('1.2.0')
  })
  test('does not mutate input', () => {
    sortChangelog(entries)
    expect(entries[0].version).toBe('1.0.0')
  })
})

describe('getVersion', () => {
  test('finds version', () => {
    expect(getVersion(entries, '1.1.0')?.title).toBe('v1.1')
  })
  test('undefined for missing', () => {
    expect(getVersion(entries, '99.0.0')).toBeUndefined()
  })
})

describe('getVersions', () => {
  test('unique versions', () => {
    expect(getVersions(entries)).toHaveLength(3)
  })
  test('dedupes', () => {
    const dupe = [...entries, entries[0]]
    expect(getVersions(dupe)).toHaveLength(3)
  })
})

describe('filterByType', () => {
  test('filters features', () => {
    expect(filterByType(entries, 'feature')).toHaveLength(2)
  })
  test('filters fixes', () => {
    expect(filterByType(entries, 'fix')).toHaveLength(1)
  })
})

describe('getEntriesInRange', () => {
  test('filters by range', () => {
    expect(getEntriesInRange(entries, '2024-01-15', '2024-02-15')).toHaveLength(1)
  })
})

describe('formatVersion', () => {
  test('prepends v', () => {
    expect(formatVersion('1.0.0')).toBe('v1.0.0')
  })
})
