import { describe, test, expect, vi, beforeEach, afterEach } from 'vitest'
import {
  isValidEmail,
  isValidUrl,
  isValidDate,
  isDateNotFuture,
  isValidSlug,
  validateRequired,
  validateMinLength,
  validateMaxLength,
} from '../validators'

describe('isValidEmail', () => {
  test('returns true for valid email', () => {
    expect(isValidEmail('user@example.com')).toBe(true)
  })

  test('returns true for email with subdomain', () => {
    expect(isValidEmail('user@mail.example.com')).toBe(true)
  })

  test('returns false for missing @', () => {
    expect(isValidEmail('userexample.com')).toBe(false)
  })

  test('returns false for missing domain', () => {
    expect(isValidEmail('user@')).toBe(false)
  })

  test('returns false for missing TLD', () => {
    expect(isValidEmail('user@example')).toBe(false)
  })

  test('trims whitespace before validation', () => {
    expect(isValidEmail('  user@example.com  ')).toBe(true)
  })

  test('returns false for empty string', () => {
    expect(isValidEmail('')).toBe(false)
  })
})

describe('isValidUrl', () => {
  test('returns true for https URL', () => {
    expect(isValidUrl('https://example.com')).toBe(true)
  })

  test('returns true for http URL', () => {
    expect(isValidUrl('http://example.com')).toBe(true)
  })

  test('returns false for ftp URL', () => {
    expect(isValidUrl('ftp://example.com')).toBe(false)
  })

  test('returns false for invalid string', () => {
    expect(isValidUrl('not a url')).toBe(false)
  })

  test('returns false for empty string', () => {
    expect(isValidUrl('')).toBe(false)
  })

  test('trims whitespace', () => {
    expect(isValidUrl('  https://example.com  ')).toBe(true)
  })
})

describe('isValidDate', () => {
  test('returns true for valid YYYY-MM-DD date', () => {
    expect(isValidDate('2024-03-15')).toBe(true)
  })

  test('returns false for invalid format', () => {
    expect(isValidDate('15/03/2024')).toBe(false)
    expect(isValidDate('2024-3-15')).toBe(false)
  })

  test('returns false for impossible date like 2024-02-30', () => {
    expect(isValidDate('2024-02-30')).toBe(false)
  })

  test('returns false for month 13', () => {
    expect(isValidDate('2024-13-01')).toBe(false)
  })

  test('returns true for leap year date', () => {
    expect(isValidDate('2024-02-29')).toBe(true)
  })

  test('returns false for non-leap year Feb 29', () => {
    expect(isValidDate('2023-02-29')).toBe(false)
  })
})

describe('isDateNotFuture', () => {
  beforeEach(() => {
    vi.useFakeTimers()
    vi.setSystemTime(new Date('2024-06-15T12:00:00Z'))
  })

  afterEach(() => {
    vi.useRealTimers()
  })

  test('returns true for past date', () => {
    expect(isDateNotFuture('2024-01-01')).toBe(true)
  })

  test('returns true for today', () => {
    expect(isDateNotFuture('2024-06-15')).toBe(true)
  })

  test('returns false for future date', () => {
    expect(isDateNotFuture('2025-01-01')).toBe(false)
  })

  test('returns false for invalid date', () => {
    expect(isDateNotFuture('not-a-date')).toBe(false)
  })
})

describe('isValidSlug', () => {
  test('returns true for valid slug', () => {
    expect(isValidSlug('hello-world')).toBe(true)
  })

  test('returns true for slug without hyphens', () => {
    expect(isValidSlug('hello')).toBe(true)
  })

  test('returns false for slug with uppercase', () => {
    expect(isValidSlug('Hello')).toBe(false)
  })

  test('returns false for slug shorter than 2 chars', () => {
    expect(isValidSlug('a')).toBe(false)
  })

  test('returns false for slug with leading hyphen', () => {
    expect(isValidSlug('-hello')).toBe(false)
  })

  test('returns false for slug with trailing hyphen', () => {
    expect(isValidSlug('hello-')).toBe(false)
  })

  test('returns false for slug with consecutive hyphens', () => {
    expect(isValidSlug('hello--world')).toBe(false)
  })
})

describe('validateRequired', () => {
  test('returns null for non-empty string', () => {
    expect(validateRequired('hello', 'Nome')).toBeNull()
  })

  test('returns error message for empty string', () => {
    expect(validateRequired('', 'Nome')).toBe('Nome é obrigatório.')
  })

  test('returns error message for null', () => {
    expect(validateRequired(null, 'Nome')).toBe('Nome é obrigatório.')
  })

  test('returns error message for undefined', () => {
    expect(validateRequired(undefined, 'Nome')).toBe('Nome é obrigatório.')
  })

  test('returns error message for whitespace-only string', () => {
    expect(validateRequired('   ', 'Nome')).toBe('Nome é obrigatório.')
  })
})

describe('validateMinLength', () => {
  test('returns null when length meets minimum', () => {
    expect(validateMinLength('hello', 3, 'Nome')).toBeNull()
  })

  test('returns error message when too short', () => {
    expect(validateMinLength('hi', 3, 'Nome')).toBe('Nome deve ter pelo menos 3 caracteres.')
  })

  test('trims before checking', () => {
    expect(validateMinLength('  hi  ', 3, 'Nome')).toBe('Nome deve ter pelo menos 3 caracteres.')
  })
})

describe('validateMaxLength', () => {
  test('returns null when length within maximum', () => {
    expect(validateMaxLength('hello', 10, 'Nome')).toBeNull()
  })

  test('returns error message when too long', () => {
    expect(validateMaxLength('hello world', 5, 'Nome')).toBe('Nome deve ter no máximo 5 caracteres.')
  })
})
