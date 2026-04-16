import { describe, test, expect } from 'vitest'
import {
  isNonNull, isString, isNumber, isArray, isObject,
  isNonEmptyString, isBoolean, filterNonNull,
} from '../type-guards'

describe('isNonNull', () => {
  test('returns true for non-null values', () => {
    expect(isNonNull(0)).toBe(true)
    expect(isNonNull('')).toBe(true)
    expect(isNonNull(false)).toBe(true)
    expect(isNonNull([])).toBe(true)
  })
  test('returns false for null', () => {
    expect(isNonNull(null)).toBe(false)
  })
  test('returns false for undefined', () => {
    expect(isNonNull(undefined)).toBe(false)
  })
})

describe('isString', () => {
  test('returns true for strings', () => {
    expect(isString('hello')).toBe(true)
    expect(isString('')).toBe(true)
  })
  test('returns false for non-strings', () => {
    expect(isString(42)).toBe(false)
    expect(isString(null)).toBe(false)
  })
})

describe('isNumber', () => {
  test('returns true for numbers', () => {
    expect(isNumber(42)).toBe(true)
    expect(isNumber(0)).toBe(true)
    expect(isNumber(-1.5)).toBe(true)
  })
  test('returns false for NaN', () => {
    expect(isNumber(NaN)).toBe(false)
  })
  test('returns false for non-numbers', () => {
    expect(isNumber('42')).toBe(false)
    expect(isNumber(null)).toBe(false)
  })
})

describe('isArray', () => {
  test('returns true for arrays', () => {
    expect(isArray([])).toBe(true)
    expect(isArray([1, 2, 3])).toBe(true)
  })
  test('returns false for non-arrays', () => {
    expect(isArray({})).toBe(false)
    expect(isArray('string')).toBe(false)
  })
})

describe('isObject', () => {
  test('returns true for plain objects', () => {
    expect(isObject({})).toBe(true)
    expect(isObject({ a: 1 })).toBe(true)
  })
  test('returns false for null', () => {
    expect(isObject(null)).toBe(false)
  })
  test('returns false for arrays', () => {
    expect(isObject([])).toBe(false)
  })
  test('returns false for primitives', () => {
    expect(isObject('string')).toBe(false)
    expect(isObject(42)).toBe(false)
  })
})

describe('isNonEmptyString', () => {
  test('returns true for non-empty string', () => {
    expect(isNonEmptyString('hello')).toBe(true)
  })
  test('returns false for empty string', () => {
    expect(isNonEmptyString('')).toBe(false)
  })
  test('returns false for non-string', () => {
    expect(isNonEmptyString(42)).toBe(false)
  })
})

describe('isBoolean', () => {
  test('returns true for booleans', () => {
    expect(isBoolean(true)).toBe(true)
    expect(isBoolean(false)).toBe(true)
  })
  test('returns false for non-booleans', () => {
    expect(isBoolean(0)).toBe(false)
    expect(isBoolean('true')).toBe(false)
  })
})

describe('filterNonNull', () => {
  test('removes null and undefined from array', () => {
    expect(filterNonNull([1, null, 2, undefined, 3])).toEqual([1, 2, 3])
  })
  test('returns empty array for all nulls', () => {
    expect(filterNonNull([null, undefined])).toEqual([])
  })
  test('returns same array when no nulls', () => {
    expect(filterNonNull([1, 2, 3])).toEqual([1, 2, 3])
  })
})
