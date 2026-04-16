import { describe, test, expect } from 'vitest'
import { parseCSV, autoMapColumns, validateImport, normalizeDateValue, getDbFieldLabel, getKnownDbFields } from '../csv-import'

describe('parseCSV', () => {
  test('parses simple CSV', () => {
    const r = parseCSV('a,b\n1,2\n3,4')
    expect(r.headers).toEqual(['a', 'b'])
    expect(r.rows).toEqual([['1', '2'], ['3', '4']])
  })
  test('handles quoted fields with commas', () => {
    const r = parseCSV('a,b\n"1,2","hello"')
    expect(r.rows).toEqual([['1,2', 'hello']])
  })
  test('handles escaped double quotes', () => {
    const r = parseCSV('a\n"He said ""hi"""')
    expect(r.rows[0][0]).toBe('He said "hi"')
  })
  test('supports semicolon separator', () => {
    const r = parseCSV('a;b\n1;2')
    expect(r.rows).toEqual([['1', '2']])
  })
  test('empty input returns empty headers/rows', () => {
    expect(parseCSV('')).toEqual({ headers: [], rows: [] })
  })
  test('filters empty lines', () => {
    const r = parseCSV('a,b\n\n1,2\n\n3,4')
    expect(r.rows).toHaveLength(2)
  })
})

describe('autoMapColumns', () => {
  test('maps common Portuguese headers', () => {
    const mappings = autoMapColumns(['Resumo', 'Data', 'URL'])
    const fields = mappings.map((m) => m.dbField)
    expect(fields).toContain('summary')
    expect(fields).toContain('statement_date')
    expect(fields).toContain('primary_source_url')
  })
  test('handles accents', () => {
    const mappings = autoMapColumns(['Citação', 'Observações'])
    expect(mappings.some((m) => m.dbField === 'full_quote')).toBe(true)
    expect(mappings.some((m) => m.dbField === 'editor_notes')).toBe(true)
  })
  test('returns empty for unknown headers', () => {
    expect(autoMapColumns(['x', 'y', 'z'])).toEqual([])
  })
})

describe('validateImport', () => {
  test('reports missing summary mapping', () => {
    const errors = validateImport([['a']], ['col'], [])
    expect(errors.some((e) => e.column === 'summary')).toBe(true)
  })

  test('reports empty summary rows', () => {
    const errors = validateImport(
      [['']], ['Resumo'],
      [{ csvColumn: 'Resumo', dbField: 'summary' }],
    )
    expect(errors.some((e) => e.message === 'Resumo vazio')).toBe(true)
  })

  test('reports invalid date format', () => {
    const errors = validateImport(
      [['foo', 'invalid-date']],
      ['Resumo', 'Data'],
      [
        { csvColumn: 'Resumo', dbField: 'summary' },
        { csvColumn: 'Data', dbField: 'statement_date' },
      ],
    )
    expect(errors.some((e) => e.column === 'statement_date')).toBe(true)
  })

  test('accepts BR date format', () => {
    const errors = validateImport(
      [['summary', '01/01/2024']],
      ['Resumo', 'Data'],
      [
        { csvColumn: 'Resumo', dbField: 'summary' },
        { csvColumn: 'Data', dbField: 'statement_date' },
      ],
    )
    expect(errors.filter((e) => e.column === 'statement_date')).toHaveLength(0)
  })
})

describe('normalizeDateValue', () => {
  test('converts DD/MM/YYYY', () => {
    expect(normalizeDateValue('15/03/2024')).toBe('2024-03-15')
  })
  test('leaves ISO date unchanged', () => {
    expect(normalizeDateValue('2024-03-15')).toBe('2024-03-15')
  })
  test('leaves unknown format unchanged', () => {
    expect(normalizeDateValue('abc')).toBe('abc')
  })
})

describe('getDbFieldLabel', () => {
  test('returns label for known field', () => {
    expect(getDbFieldLabel('summary')).toBe('Resumo')
  })
  test('returns field for unknown', () => {
    expect(getDbFieldLabel('unknown')).toBe('unknown')
  })
})

describe('getKnownDbFields', () => {
  test('returns non-empty list', () => {
    expect(getKnownDbFields().length).toBeGreaterThan(0)
  })
  test('includes summary', () => {
    expect(getKnownDbFields()).toContain('summary')
  })
})
