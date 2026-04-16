import { describe, test, expect } from 'vitest'
import { groupBy, uniqueBy, chunk } from '../array'

describe('groupBy', () => {
  test('groups items by key function', () => {
    const items = [
      { name: 'Alice', role: 'dev' },
      { name: 'Bob', role: 'dev' },
      { name: 'Carol', role: 'pm' },
    ]
    const result = groupBy(items, (i) => i.role as 'dev' | 'pm')
    expect(result.dev).toHaveLength(2)
    expect(result.pm).toHaveLength(1)
  })

  test('returns empty object for empty array', () => {
    expect(groupBy([], () => 'x' as const)).toEqual({})
  })

  test('handles single group', () => {
    const items = [{ v: 1 }, { v: 2 }]
    const result = groupBy(items, () => 'all' as const)
    expect(result.all).toHaveLength(2)
  })
})

describe('uniqueBy', () => {
  test('removes duplicates by key', () => {
    const items = [
      { id: '1', name: 'a' },
      { id: '2', name: 'b' },
      { id: '1', name: 'c' },
    ]
    const result = uniqueBy(items, (i) => i.id)
    expect(result).toHaveLength(2)
    expect(result[0].name).toBe('a')
  })

  test('returns empty array for empty input', () => {
    expect(uniqueBy([], (i) => String(i))).toEqual([])
  })

  test('keeps first occurrence', () => {
    const items = [{ k: 'x', v: 1 }, { k: 'x', v: 2 }]
    const result = uniqueBy(items, (i) => i.k)
    expect(result).toHaveLength(1)
    expect(result[0].v).toBe(1)
  })
})

describe('chunk', () => {
  test('chunks array into groups of given size', () => {
    expect(chunk([1, 2, 3, 4, 5], 2)).toEqual([[1, 2], [3, 4], [5]])
  })

  test('returns single chunk when size >= length', () => {
    expect(chunk([1, 2], 5)).toEqual([[1, 2]])
  })

  test('returns empty array for empty input', () => {
    expect(chunk([], 3)).toEqual([])
  })

  test('returns whole array in one chunk for size <= 0', () => {
    expect(chunk([1, 2, 3], 0)).toEqual([[1, 2, 3]])
    expect(chunk([1, 2, 3], -1)).toEqual([[1, 2, 3]])
  })

  test('handles size of 1', () => {
    expect(chunk([1, 2, 3], 1)).toEqual([[1], [2], [3]])
  })

  test('returns empty for empty array with size <= 0', () => {
    expect(chunk([], 0)).toEqual([])
  })
})
