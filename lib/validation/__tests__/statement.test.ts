import { describe, test, expect } from 'vitest'
import { createStatementSchema, updateStatementSchema } from '../statement'

function validStatement(overrides: Record<string, unknown> = {}) {
  return {
    politician_slug: 'lula',
    summary: 'Uma declaração de teste sobre algo importante',
    statement_date: '2024-01-01',
    primary_source_url: 'https://example.com/source',
    primary_source_type: 'news_article',
    categories: ['saude'],
    ...overrides,
  }
}

describe('createStatementSchema', () => {
  test('accepts valid statement', () => {
    expect(createStatementSchema.parse(validStatement()).ok).toBe(true)
  })
  test('rejects short summary', () => {
    expect(createStatementSchema.parse(validStatement({ summary: 'short' })).ok).toBe(false)
  })
  test('rejects summary > 500', () => {
    expect(createStatementSchema.parse(validStatement({ summary: 'x'.repeat(501) })).ok).toBe(false)
  })
  test('rejects invalid URL', () => {
    expect(createStatementSchema.parse(validStatement({ primary_source_url: 'bad' })).ok).toBe(false)
  })
  test('rejects empty categories', () => {
    expect(createStatementSchema.parse(validStatement({ categories: [] })).ok).toBe(false)
  })
  test('rejects invalid source type', () => {
    expect(createStatementSchema.parse(validStatement({ primary_source_type: 'bogus' })).ok).toBe(false)
  })
  test('rejects invalid date format', () => {
    expect(createStatementSchema.parse(validStatement({ statement_date: '01/01/2024' })).ok).toBe(false)
  })
  test('rejects negative timestamp', () => {
    expect(createStatementSchema.parse(validStatement({ youtube_timestamp_sec: -1 })).ok).toBe(false)
  })
  test('rejects timestamp over 86400', () => {
    expect(createStatementSchema.parse(validStatement({ youtube_timestamp_sec: 90000 })).ok).toBe(false)
  })
  test('accepts full_quote up to 5000', () => {
    expect(createStatementSchema.parse(validStatement({ full_quote: 'x'.repeat(5000) })).ok).toBe(true)
  })
  test('rejects full_quote over 5000', () => {
    expect(createStatementSchema.parse(validStatement({ full_quote: 'x'.repeat(5001) })).ok).toBe(false)
  })
})

describe('updateStatementSchema', () => {
  test('requires summary + categories + source', () => {
    expect(updateStatementSchema.parse({}).ok).toBe(false)
  })
  test('accepts minimal update with required fields', () => {
    const r = updateStatementSchema.parse({
      summary: 'Nova resumo de atualização válida',
      statement_date: '2024-01-01',
      primary_source_url: 'https://example.com/s',
      primary_source_type: 'news_article',
      categories: ['saude'],
    })
    expect(r.ok).toBe(true)
  })
})
