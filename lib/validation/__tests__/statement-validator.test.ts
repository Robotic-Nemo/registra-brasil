import { describe, test, expect } from 'vitest'
import { validateStatement, type StatementInput } from '../statement-validator'

function validInput(overrides: Partial<StatementInput> = {}): StatementInput {
  return {
    politician_slug: 'maria-silva',
    summary: 'Declaracao sobre a economia brasileira e o futuro',
    full_quote: 'Precisamos investir mais em educacao.',
    context: 'Discurso na Camara',
    statement_date: '2024-06-15',
    statement_date_approx: false,
    primary_source_url: 'https://example.com/source',
    primary_source_type: 'news_article',
    youtube_timestamp_sec: null,
    transcript_excerpt: null,
    venue: 'Plenario',
    event_name: 'Sessao Ordinaria',
    editor_notes: null,
    submitted_by: null,
    categories: ['economia'],
    ...overrides,
  }
}

describe('validateStatement', () => {
  test('accepts valid input', () => {
    const result = validateStatement(validInput())
    expect(result.ok).toBe(true)
  })

  test('sanitizes HTML in summary', () => {
    const result = validateStatement(validInput({ summary: '<b>Declaracao sobre economia</b> e saude publica' }))
    expect(result.ok).toBe(true)
    if (result.ok) expect(result.data.summary).not.toContain('<b>')
  })

  test('rejects missing politician_slug', () => {
    const result = validateStatement(validInput({ politician_slug: '' }))
    expect(result.ok).toBe(false)
  })

  test('rejects short summary', () => {
    const result = validateStatement(validInput({ summary: 'short' }))
    expect(result.ok).toBe(false)
    if (!result.ok) expect(result.message).toContain('10 caracteres')
  })

  test('rejects long summary', () => {
    const result = validateStatement(validInput({ summary: 'a'.repeat(501) }))
    expect(result.ok).toBe(false)
  })

  test('rejects empty categories', () => {
    const result = validateStatement(validInput({ categories: [] }))
    expect(result.ok).toBe(false)
    if (!result.ok) expect(result.message).toContain('categoria')
  })

  test('rejects invalid date', () => {
    const result = validateStatement(validInput({ statement_date: 'not-a-date' }))
    expect(result.ok).toBe(false)
  })

  test('rejects invalid URL', () => {
    const result = validateStatement(validInput({ primary_source_url: 'not-url' }))
    expect(result.ok).toBe(false)
  })

  test('rejects invalid source type', () => {
    const result = validateStatement(validInput({ primary_source_type: 'invalid_type' }))
    expect(result.ok).toBe(false)
  })

  test('rejects invalid timestamp', () => {
    const result = validateStatement(validInput({ youtube_timestamp_sec: 100000 }))
    expect(result.ok).toBe(false)
  })

  test('accepts null timestamp', () => {
    const result = validateStatement(validInput({ youtube_timestamp_sec: null }))
    expect(result.ok).toBe(true)
  })

  test('normalizes URL', () => {
    const result = validateStatement(validInput({ primary_source_url: '  https://example.com/path  ' }))
    expect(result.ok).toBe(true)
    if (result.ok) expect(result.data.primary_source_url).not.toContain(' ')
  })
})
