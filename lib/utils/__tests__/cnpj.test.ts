import { describe, test, expect } from 'vitest'
import { isValidCnpj, formatCnpj } from '../cnpj'

describe('isValidCnpj', () => {
  test('returns true for valid CNPJ', () => {
    expect(isValidCnpj('11222333000181')).toBe(true)
    expect(isValidCnpj('11.222.333/0001-81')).toBe(true)
  })

  test('returns false for all same digits', () => {
    expect(isValidCnpj('11111111111111')).toBe(false)
    expect(isValidCnpj('00000000000000')).toBe(false)
  })

  test('returns false for wrong length', () => {
    expect(isValidCnpj('1234567890123')).toBe(false) // 13 digits
    expect(isValidCnpj('123456789012345')).toBe(false) // 15 digits
  })

  test('returns false for invalid check digits', () => {
    expect(isValidCnpj('11222333000182')).toBe(false)
    expect(isValidCnpj('12345678000100')).toBe(false)
  })

  test('strips non-digit characters', () => {
    expect(isValidCnpj('11.222.333/0001-81')).toBe(true)
  })

  test('returns false for empty string', () => {
    expect(isValidCnpj('')).toBe(false)
  })
})

describe('formatCnpj', () => {
  test('formats 14 digits as CNPJ', () => {
    expect(formatCnpj('11222333000181')).toBe('11.222.333/0001-81')
  })

  test('returns original if not 14 digits', () => {
    expect(formatCnpj('12345')).toBe('12345')
  })

  test('handles already formatted input', () => {
    expect(formatCnpj('11.222.333/0001-81')).toBe('11.222.333/0001-81')
  })
})
