import { describe, test, expect } from 'vitest'
import {
  CPF_REGEX, CNPJ_REGEX, PHONE_REGEX, CEP_REGEX,
  DATE_BR_REGEX, DATE_ISO_REGEX, SLUG_REGEX, EMAIL_REGEX,
  YOUTUBE_ID_REGEX, YOUTUBE_URL_REGEX,
  extractYouTubeId, escapeRegex, createSearchRegex,
} from '../regex'

describe('CPF_REGEX', () => {
  test('matches formatted CPF', () => {
    expect(CPF_REGEX.test('123.456.789-00')).toBe(true)
  })
  test('rejects unformatted CPF', () => {
    expect(CPF_REGEX.test('12345678900')).toBe(false)
  })
})

describe('CNPJ_REGEX', () => {
  test('matches formatted CNPJ', () => {
    expect(CNPJ_REGEX.test('12.345.678/0001-99')).toBe(true)
  })
  test('rejects unformatted CNPJ', () => {
    expect(CNPJ_REGEX.test('12345678000199')).toBe(false)
  })
})

describe('PHONE_REGEX', () => {
  test('matches mobile with space', () => {
    expect(PHONE_REGEX.test('(11) 99999-8888')).toBe(true)
  })
  test('matches landline', () => {
    expect(PHONE_REGEX.test('(11) 3333-4444')).toBe(true)
  })
  test('matches without space after area code', () => {
    expect(PHONE_REGEX.test('(11)99999-8888')).toBe(true)
  })
  test('rejects invalid format', () => {
    expect(PHONE_REGEX.test('11999998888')).toBe(false)
  })
})

describe('CEP_REGEX', () => {
  test('matches valid CEP', () => {
    expect(CEP_REGEX.test('01001-000')).toBe(true)
  })
  test('rejects without hyphen', () => {
    expect(CEP_REGEX.test('01001000')).toBe(false)
  })
})

describe('DATE_BR_REGEX', () => {
  test('matches DD/MM/YYYY', () => {
    expect(DATE_BR_REGEX.test('15/03/2024')).toBe(true)
  })
  test('rejects YYYY-MM-DD', () => {
    expect(DATE_BR_REGEX.test('2024-03-15')).toBe(false)
  })
})

describe('DATE_ISO_REGEX', () => {
  test('matches YYYY-MM-DD', () => {
    expect(DATE_ISO_REGEX.test('2024-03-15')).toBe(true)
  })
  test('rejects DD/MM/YYYY', () => {
    expect(DATE_ISO_REGEX.test('15/03/2024')).toBe(false)
  })
})

describe('SLUG_REGEX', () => {
  test('matches valid slug', () => {
    expect(SLUG_REGEX.test('hello-world')).toBe(true)
  })
  test('rejects uppercase', () => {
    expect(SLUG_REGEX.test('Hello')).toBe(false)
  })
  test('rejects leading hyphen', () => {
    expect(SLUG_REGEX.test('-hello')).toBe(false)
  })
})

describe('EMAIL_REGEX', () => {
  test('matches valid email', () => {
    expect(EMAIL_REGEX.test('user@example.com')).toBe(true)
  })
  test('rejects missing @', () => {
    expect(EMAIL_REGEX.test('userexample.com')).toBe(false)
  })
})

describe('YOUTUBE_ID_REGEX', () => {
  test('matches 11-char video ID', () => {
    expect(YOUTUBE_ID_REGEX.test('dQw4w9WgXcQ')).toBe(true)
  })
  test('rejects too short', () => {
    expect(YOUTUBE_ID_REGEX.test('abc')).toBe(false)
  })
})

describe('extractYouTubeId', () => {
  test('extracts from watch URL', () => {
    expect(extractYouTubeId('https://youtube.com/watch?v=dQw4w9WgXcQ')).toBe('dQw4w9WgXcQ')
  })
  test('extracts from short URL', () => {
    expect(extractYouTubeId('https://youtu.be/dQw4w9WgXcQ')).toBe('dQw4w9WgXcQ')
  })
  test('extracts from embed URL', () => {
    expect(extractYouTubeId('https://youtube.com/embed/dQw4w9WgXcQ')).toBe('dQw4w9WgXcQ')
  })
  test('returns null for non-YouTube URL', () => {
    expect(extractYouTubeId('https://example.com')).toBeNull()
  })
})

describe('escapeRegex', () => {
  test('escapes special characters', () => {
    expect(escapeRegex('a.b*c')).toBe('a\\.b\\*c')
  })
  test('escapes brackets', () => {
    expect(escapeRegex('[test]')).toBe('\\[test\\]')
  })
  test('passes through normal text', () => {
    expect(escapeRegex('hello')).toBe('hello')
  })
})

describe('createSearchRegex', () => {
  test('creates case-insensitive global regex', () => {
    const re = createSearchRegex('hello')
    expect(re.flags).toContain('g')
    expect(re.flags).toContain('i')
    expect(re.test('Hello World')).toBe(true)
  })
  test('escapes special characters in query', () => {
    const re = createSearchRegex('test.case')
    expect(re.test('test.case')).toBe(true)
    expect(re.test('testXcase')).toBe(false)
  })
})
