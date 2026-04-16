import { describe, test, expect } from 'vitest'
import { pick, omit, deepMerge, isEmpty, getNestedValue, mapValues } from '../object'

describe('pick', () => {
  test('picks specified keys', () => {
    const obj = { a: 1, b: 2, c: 3 }
    expect(pick(obj, ['a', 'c'])).toEqual({ a: 1, c: 3 })
  })

  test('ignores missing keys', () => {
    const obj = { a: 1 } as Record<string, unknown>
    expect(pick(obj, ['a', 'b' as keyof typeof obj])).toEqual({ a: 1 })
  })

  test('returns empty object for empty keys', () => {
    expect(pick({ a: 1 }, [])).toEqual({})
  })
})

describe('omit', () => {
  test('omits specified keys', () => {
    const obj = { a: 1, b: 2, c: 3 }
    expect(omit(obj, ['b'])).toEqual({ a: 1, c: 3 })
  })

  test('returns same object for empty keys', () => {
    const obj = { a: 1 }
    expect(omit(obj, [])).toEqual({ a: 1 })
  })
})

describe('deepMerge', () => {
  test('merges flat objects', () => {
    expect(deepMerge({ a: 1 }, { b: 2 })).toEqual({ a: 1, b: 2 })
  })

  test('deep merges nested objects', () => {
    const target = { a: { x: 1, y: 2 } }
    const source = { a: { y: 3, z: 4 } }
    const result = deepMerge(target, source)
    expect(result).toEqual({ a: { x: 1, y: 3, z: 4 } })
  })

  test('overwrites arrays (does not merge)', () => {
    const target = { items: [1, 2] }
    const source = { items: [3] }
    const result = deepMerge(target, source)
    expect(result.items).toEqual([3])
  })

  test('does not mutate original objects', () => {
    const target = { a: { x: 1 } }
    const source = { a: { y: 2 } }
    deepMerge(target, source)
    expect(target).toEqual({ a: { x: 1 } })
  })

  test('skips undefined source values', () => {
    const result = deepMerge({ a: 1 }, { a: undefined })
    expect(result.a).toBe(1)
  })
})

describe('isEmpty', () => {
  test('returns true for empty object', () => {
    expect(isEmpty({})).toBe(true)
  })

  test('returns false for non-empty object', () => {
    expect(isEmpty({ a: 1 })).toBe(false)
  })
})

describe('getNestedValue', () => {
  test('gets value by dot path', () => {
    const obj = { a: { b: { c: 42 } } }
    expect(getNestedValue(obj, 'a.b.c')).toBe(42)
  })

  test('returns undefined for missing path', () => {
    expect(getNestedValue({ a: 1 }, 'b.c')).toBeUndefined()
  })

  test('gets top-level value', () => {
    expect(getNestedValue({ a: 'hello' }, 'a')).toBe('hello')
  })
})

describe('mapValues', () => {
  test('maps values of an object', () => {
    const result = mapValues({ a: 1, b: 2 }, (v) => v * 2)
    expect(result).toEqual({ a: 2, b: 4 })
  })

  test('provides key to mapper function', () => {
    const result = mapValues({ x: 1 }, (_v, k) => k)
    expect(result).toEqual({ x: 'x' })
  })

  test('returns empty object for empty input', () => {
    expect(mapValues({}, (v) => v)).toEqual({})
  })
})
