import { describe, test, expect } from 'vitest'
import { randomInt, randomPick, shuffle, randomColor, uuid, randomString, shortId } from '../random'

describe('randomInt', () => {
  test('returns value within range (inclusive)', () => {
    for (let i = 0; i < 100; i++) {
      const val = randomInt(1, 10)
      expect(val).toBeGreaterThanOrEqual(1)
      expect(val).toBeLessThanOrEqual(10)
    }
  })

  test('works with same min and max', () => {
    expect(randomInt(5, 5)).toBe(5)
  })

  test('returns integer', () => {
    const val = randomInt(1, 100)
    expect(Number.isInteger(val)).toBe(true)
  })
})

describe('randomPick', () => {
  test('returns an item from the array', () => {
    const arr = ['a', 'b', 'c']
    for (let i = 0; i < 50; i++) {
      expect(arr).toContain(randomPick(arr))
    }
  })

  test('returns undefined for empty array', () => {
    expect(randomPick([])).toBeUndefined()
  })
})

describe('shuffle', () => {
  test('returns array of same length', () => {
    const arr = [1, 2, 3, 4, 5]
    expect(shuffle(arr)).toHaveLength(5)
  })

  test('contains same elements', () => {
    const arr = [1, 2, 3, 4, 5]
    const shuffled = shuffle(arr)
    expect(shuffled.sort()).toEqual([1, 2, 3, 4, 5])
  })

  test('does not mutate original array', () => {
    const arr = [1, 2, 3]
    shuffle(arr)
    expect(arr).toEqual([1, 2, 3])
  })

  test('handles empty array', () => {
    expect(shuffle([])).toEqual([])
  })

  test('handles single element', () => {
    expect(shuffle([42])).toEqual([42])
  })
})

describe('randomColor', () => {
  test('returns a valid hex color', () => {
    for (let i = 0; i < 20; i++) {
      expect(randomColor()).toMatch(/^#[0-9a-f]{6}$/)
    }
  })
})

describe('uuid', () => {
  test('returns a string matching UUID v4 format', () => {
    const id = uuid()
    expect(id).toMatch(/^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/)
  })

  test('generates unique values', () => {
    const ids = new Set(Array.from({ length: 100 }, () => uuid()))
    expect(ids.size).toBe(100)
  })
})

describe('randomString', () => {
  test('returns string of given length', () => {
    expect(randomString(10)).toHaveLength(10)
  })

  test('uses default charset', () => {
    const s = randomString(100)
    expect(s).toMatch(/^[a-z0-9]+$/)
  })

  test('uses custom charset', () => {
    const s = randomString(20, 'AB')
    expect(s).toMatch(/^[AB]+$/)
  })

  test('handles zero length', () => {
    expect(randomString(0)).toBe('')
  })
})

describe('shortId', () => {
  test('returns string of default length 12', () => {
    expect(shortId()).toHaveLength(12)
  })

  test('returns alphanumeric string', () => {
    expect(shortId()).toMatch(/^[A-Za-z0-9]+$/)
  })

  test('respects custom length', () => {
    expect(shortId(8)).toHaveLength(8)
  })
})
