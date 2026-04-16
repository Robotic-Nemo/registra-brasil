import { describe, test, expect } from 'vitest'
import {
  parseMultiValue,
  parseMultiValueUpper,
  parseMultiValueLower,
  isValidDate,
  parseInclude,
  parseSeverity,
} from '../api-filters'

describe('parseMultiValue', () => {
  test('returns null for null', () => {
    expect(parseMultiValue(null)).toBeNull()
  })
  test('returns null for empty string', () => {
    expect(parseMultiValue('')).toBeNull()
  })
  test('returns null for whitespace only', () => {
    expect(parseMultiValue('   ')).toBeNull()
  })
  test('splits comma separated', () => {
    expect(parseMultiValue('a,b,c')).toEqual(['a', 'b', 'c'])
  })
  test('trims whitespace', () => {
    expect(parseMultiValue(' a , b ,c ')).toEqual(['a', 'b', 'c'])
  })
  test('filters empty values', () => {
    expect(parseMultiValue('a,,b,,')).toEqual(['a', 'b'])
  })
})

describe('parseMultiValueUpper', () => {
  test('uppercases values', () => {
    expect(parseMultiValueUpper('pt,psol')).toEqual(['PT', 'PSOL'])
  })
  test('null pass-through', () => {
    expect(parseMultiValueUpper(null)).toBeNull()
  })
})

describe('parseMultiValueLower', () => {
  test('lowercases values', () => {
    expect(parseMultiValueLower('SAUDE,EDUCACAO')).toEqual(['saude', 'educacao'])
  })
})

describe('isValidDate', () => {
  test('accepts YYYY-MM-DD', () => {
    expect(isValidDate('2024-01-01')).toBe(true)
  })
  test('rejects wrong format', () => {
    expect(isValidDate('01/01/2024')).toBe(false)
  })
  test('rejects invalid date', () => {
    expect(isValidDate('2024-99-99')).toBe(false)
  })
  test('rejects empty', () => {
    expect(isValidDate('')).toBe(false)
  })
})

describe('parseInclude', () => {
  test('returns empty for null', () => {
    expect(parseInclude(null, ['a', 'b'])).toEqual([])
  })
  test('filters to allowed', () => {
    expect(parseInclude('a,c', ['a', 'b'])).toEqual(['a'])
  })
  test('preserves allowed order', () => {
    expect(parseInclude('b,a', ['a', 'b'])).toEqual(['b', 'a'])
  })
})

describe('parseSeverity', () => {
  test('parses valid severities', () => {
    expect(parseSeverity('1,2,3')).toEqual([1, 2, 3])
  })
  test('filters out invalid numbers', () => {
    expect(parseSeverity('1,5,-1,abc,3')).toEqual([1, 3])
  })
  test('returns null when empty', () => {
    expect(parseSeverity('')).toBeNull()
  })
  test('returns null when only invalid', () => {
    expect(parseSeverity('0,5,abc')).toBeNull()
  })
  test('clamps upper bound to 4', () => {
    expect(parseSeverity('4,5')).toEqual([4])
  })
})
