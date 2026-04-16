import { describe, test, expect } from 'vitest'
import { formatPhone, isValidPhone, whatsappLink } from '../phone'

describe('formatPhone', () => {
  test('formats 11-digit mobile number', () => {
    expect(formatPhone('11999887766')).toBe('(11) 99988-7766')
  })

  test('formats 10-digit landline number', () => {
    expect(formatPhone('1133445566')).toBe('(11) 3344-5566')
  })

  test('formats 13-digit number with country code', () => {
    expect(formatPhone('5511999887766')).toBe('+55 (11) 99988-7766')
  })

  test('returns original for other lengths', () => {
    expect(formatPhone('12345')).toBe('12345')
  })

  test('strips non-digit characters', () => {
    expect(formatPhone('(11) 99988-7766')).toBe('(11) 99988-7766')
  })
})

describe('isValidPhone', () => {
  test('returns true for 11-digit mobile', () => {
    expect(isValidPhone('11999887766')).toBe(true)
  })

  test('returns true for 10-digit landline', () => {
    expect(isValidPhone('1133445566')).toBe(true)
  })

  test('returns false for wrong length', () => {
    expect(isValidPhone('12345')).toBe(false)
    expect(isValidPhone('123456789012')).toBe(false)
  })

  test('strips non-digit characters before validating', () => {
    expect(isValidPhone('(11) 99988-7766')).toBe(true)
  })
})

describe('whatsappLink', () => {
  test('generates link with country code', () => {
    expect(whatsappLink('11999887766')).toBe('https://wa.me/5511999887766')
  })

  test('does not double-add country code', () => {
    expect(whatsappLink('5511999887766')).toBe('https://wa.me/5511999887766')
  })

  test('appends message when provided', () => {
    const link = whatsappLink('11999887766', 'Olá!')
    expect(link).toBe('https://wa.me/5511999887766?text=Ol%C3%A1!')
  })

  test('generates link without message param when not provided', () => {
    const link = whatsappLink('11999887766')
    expect(link).not.toContain('?text=')
  })
})
