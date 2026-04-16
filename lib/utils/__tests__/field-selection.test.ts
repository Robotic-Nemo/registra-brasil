import { describe, test, expect } from 'vitest'
import { parseFields, buildSelectString, projectFields } from '../field-selection'

const config = {
  allowed: ['id', 'summary', 'date', 'politician_id'],
  defaults: ['id', 'summary'],
}

describe('parseFields', () => {
  test('returns defaults for null', () => {
    expect(parseFields(null, config)).toEqual(['id', 'summary'])
  })
  test('returns defaults for empty', () => {
    expect(parseFields('', config)).toEqual(['id', 'summary'])
  })
  test('filters to allowed', () => {
    expect(parseFields('summary,forbidden', config)).toEqual(['summary'])
  })
  test('returns defaults when no valid fields', () => {
    expect(parseFields('foo,bar', config)).toEqual(['id', 'summary'])
  })
  test('trims whitespace', () => {
    expect(parseFields(' summary , date ', config)).toEqual(['summary', 'date'])
  })
})

describe('buildSelectString', () => {
  test('always includes id', () => {
    const select = buildSelectString(['summary'])
    expect(select).toContain('id')
    expect(select).toContain('summary')
  })
  test('dedupes id', () => {
    const select = buildSelectString(['id', 'summary'])
    expect(select.split(',').filter((s) => s.trim() === 'id').length).toBe(1)
  })
  test('includes politician relation', () => {
    const select = buildSelectString(['id'], ['politician'])
    expect(select).toContain('politicians')
  })
  test('includes categories relation', () => {
    const select = buildSelectString(['id'], ['categories'])
    expect(select).toContain('statement_categories')
  })
})

describe('projectFields', () => {
  const obj = { id: '1', summary: 's', date: '2024-01-01', hidden: 'x' }
  test('projects only selected fields', () => {
    expect(projectFields(obj, ['summary'])).toEqual({ id: '1', summary: 's' })
  })
  test('always keeps id', () => {
    expect(projectFields(obj, [])).toHaveProperty('id')
  })
  test('keeps relation objects', () => {
    const withRel = { id: '1', politicians: { name: 'Lula' } }
    expect(projectFields(withRel, [], ['politician'])).toHaveProperty('politicians')
  })
})
