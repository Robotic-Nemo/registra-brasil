import { describe, test, expect } from 'vitest'
import { isValidCpf, formatCpf, maskCpf } from '../cpf'

describe('isValidCpf', () => {
  test('returns true for valid CPF', () => {
    // Known valid CPFs (algorithm-verified)
    expect(isValidCpf('52998224725')).toBe(true)
    expect(isValidCpf('529.982.247-25')).toBe(true)
  })

  test('returns false for all same digits', () => {
    expect(isValidCpf('11111111111')).toBe(false)
    expect(isValidCpf('00000000000')).toBe(false)
    expect(isValidCpf('99999999999')).toBe(false)
  })

  test('returns false for wrong length', () => {
    expect(isValidCpf('1234567890')).toBe(false) // 10 digits
    expect(isValidCpf('123456789012')).toBe(false) // 12 digits
  })

  test('returns false for invalid check digits', () => {
    expect(isValidCpf('52998224720')).toBe(false)
    expect(isValidCpf('12345678901')).toBe(false)
  })

  test('strips non-digit characters', () => {
    expect(isValidCpf('529.982.247-25')).toBe(true)
  })

  test('returns false for empty string', () => {
    expect(isValidCpf('')).toBe(false)
  })
})

describe('formatCpf', () => {
  test('formats 11 digits as CPF', () => {
    expect(formatCpf('52998224725')).toBe('529.982.247-25')
  })

  test('returns original if not 11 digits', () => {
    expect(formatCpf('12345')).toBe('12345')
  })

  test('strips non-digits before formatting', () => {
    expect(formatCpf('529.982.247-25')).toBe('529.982.247-25')
  })
})

describe('maskCpf', () => {
  test('masks middle digits', () => {
    expect(maskCpf('52998224725')).toBe('529.***.***-25')
  })

  test('returns original if not 11 digits', () => {
    expect(maskCpf('12345')).toBe('12345')
  })

  test('handles already formatted CPF', () => {
    expect(maskCpf('529.982.247-25')).toBe('529.***.***-25')
  })
})
