import { describe, test, expect, vi, beforeEach, afterEach } from 'vitest'
import { formatDatePtBR, formatDateShort, formatDateRelative } from '../date'

describe('formatDatePtBR', () => {
  test('formats a valid ISO date in pt-BR', () => {
    const result = formatDatePtBR('2024-03-15')
    expect(result).toBe('15 de março de 2024')
  })

  test('returns empty string for null', () => {
    expect(formatDatePtBR(null)).toBe('')
  })

  test('returns empty string for undefined', () => {
    expect(formatDatePtBR(undefined)).toBe('')
  })

  test('returns empty string for empty string', () => {
    expect(formatDatePtBR('')).toBe('')
  })

  test('returns original string for invalid date', () => {
    expect(formatDatePtBR('not-a-date')).toBe('not-a-date')
  })

  test('handles approx flag', () => {
    const result = formatDatePtBR('2024-01-01', true)
    expect(result).toMatch(/^aprox\. /)
    expect(result).toContain('janeiro')
  })

  test('formats different months correctly', () => {
    expect(formatDatePtBR('2024-12-25')).toBe('25 de dezembro de 2024')
    expect(formatDatePtBR('2024-07-04')).toBe('4 de julho de 2024')
  })
})

describe('formatDateShort', () => {
  test('formats as dd/MM/yyyy', () => {
    expect(formatDateShort('2024-03-15')).toBe('15/03/2024')
  })

  test('returns original string for invalid date', () => {
    expect(formatDateShort('garbage')).toBe('garbage')
  })
})

describe('formatDateRelative', () => {
  let dateSpy: ReturnType<typeof vi.spyOn>

  beforeEach(() => {
    // Fix "now" to 2024-06-15T12:00:00Z
    vi.useFakeTimers()
    vi.setSystemTime(new Date('2024-06-15T12:00:00Z'))
  })

  afterEach(() => {
    vi.useRealTimers()
  })

  test('returns "hoje" for today', () => {
    expect(formatDateRelative('2024-06-15')).toBe('hoje')
  })

  test('returns "ontem" for yesterday', () => {
    expect(formatDateRelative('2024-06-14')).toBe('ontem')
  })

  test('returns "há X dias" for recent days', () => {
    expect(formatDateRelative('2024-06-12')).toBe('há 3 dias')
  })

  test('returns "há 1 semana" for 8-13 days ago', () => {
    expect(formatDateRelative('2024-06-06')).toBe('há 1 semana')
  })

  test('returns "há X semanas" for weeks ago', () => {
    expect(formatDateRelative('2024-05-29')).toMatch(/há \d+ semanas/)
  })

  test('returns "há 1 mês" for about a month ago', () => {
    expect(formatDateRelative('2024-05-15')).toBe('há 1 mês')
  })

  test('returns "há X meses" for months ago', () => {
    expect(formatDateRelative('2024-03-15')).toMatch(/há \d+ meses/)
  })

  test('returns "há 1 ano" for about a year ago', () => {
    expect(formatDateRelative('2023-06-10')).toBe('há 1 ano')
  })

  test('returns "há X anos" for years ago', () => {
    expect(formatDateRelative('2020-01-01')).toMatch(/há \d+ anos/)
  })

  test('returns short format for future dates', () => {
    expect(formatDateRelative('2025-01-01')).toBe('01/01/2025')
  })

  test('returns original string for invalid date', () => {
    expect(formatDateRelative('invalid')).toBe('invalid')
  })
})
