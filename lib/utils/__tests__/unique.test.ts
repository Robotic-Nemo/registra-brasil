import { describe, test, expect } from 'vitest'
import { unique, uniqueBy, countBy, intersection, difference } from '../unique'

describe('unique', () => {
  test('removes duplicates preserving order', () => {
    expect(unique([1, 2, 2, 3, 1])).toEqual([1, 2, 3])
  })
  test('handles empty array', () => {
    expect(unique([])).toEqual([])
  })
  test('handles single-element array', () => {
    expect(unique([1])).toEqual([1])
  })
  test('works with strings', () => {
    expect(unique(['a', 'b', 'a'])).toEqual(['a', 'b'])
  })
  test('treats NaN as equal to itself (Set semantics)', () => {
    expect(unique([NaN, NaN])).toHaveLength(1)
  })
})

describe('uniqueBy', () => {
  test('keeps first by key', () => {
    const result = uniqueBy(
      [{ id: 1, n: 'a' }, { id: 1, n: 'b' }, { id: 2, n: 'c' }],
      (x) => x.id,
    )
    expect(result).toEqual([{ id: 1, n: 'a' }, { id: 2, n: 'c' }])
  })
  test('works with string keys', () => {
    const result = uniqueBy(['hello', 'world', 'hi'], (s) => s[0])
    expect(result).toEqual(['hello', 'world'])
  })
  test('empty array returns empty', () => {
    expect(uniqueBy([], (x) => x)).toEqual([])
  })
})

describe('countBy', () => {
  test('counts occurrences', () => {
    const m = countBy(['a', 'b', 'a', 'c', 'a'])
    expect(m.get('a')).toBe(3)
    expect(m.get('b')).toBe(1)
    expect(m.get('c')).toBe(1)
  })
  test('empty array returns empty map', () => {
    expect(countBy([]).size).toBe(0)
  })
  test('works with numbers', () => {
    expect(countBy([1, 1, 2]).get(1)).toBe(2)
  })
})

describe('intersection', () => {
  test('returns common items', () => {
    expect(intersection([1, 2, 3], [2, 3, 4])).toEqual([2, 3])
  })
  test('returns empty when no overlap', () => {
    expect(intersection([1, 2], [3, 4])).toEqual([])
  })
  test('handles empty first array', () => {
    expect(intersection([], [1, 2])).toEqual([])
  })
  test('dedupes result', () => {
    expect(intersection([1, 1, 2], [1, 2])).toEqual([1, 2])
  })
})

describe('difference', () => {
  test('returns items only in first array', () => {
    expect(difference([1, 2, 3], [2, 3, 4])).toEqual([1])
  })
  test('returns all when second empty', () => {
    expect(difference([1, 2], [])).toEqual([1, 2])
  })
  test('empty when all shared', () => {
    expect(difference([1, 2], [1, 2, 3])).toEqual([])
  })
  test('dedupes result', () => {
    expect(difference([1, 1, 2], [2])).toEqual([1])
  })
})
