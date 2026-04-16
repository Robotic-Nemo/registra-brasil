import { describe, test, expect } from 'vitest'
import { parseCsv, toCsv } from '../csv-parser'

describe('parseCsv', () => {
  test('parses simple CSV', () => {
    const csv = 'name,age\nAlice,30\nBob,25'
    const result = parseCsv(csv)
    expect(result.headers).toEqual(['name', 'age'])
    expect(result.rows).toHaveLength(2)
    expect(result.rows[0]).toEqual({ name: 'Alice', age: '30' })
    expect(result.rows[1]).toEqual({ name: 'Bob', age: '25' })
    expect(result.errors).toHaveLength(0)
  })

  test('handles quoted fields', () => {
    const csv = 'name,bio\nAlice,"Hello, World"\nBob,"He said ""hi"""'
    const result = parseCsv(csv)
    expect(result.rows[0].bio).toBe('Hello, World')
    expect(result.rows[1].bio).toBe('He said "hi"')
  })

  test('reports column count mismatch', () => {
    const csv = 'a,b\n1,2\n3'
    const result = parseCsv(csv)
    expect(result.rows).toHaveLength(1)
    expect(result.errors).toHaveLength(1)
  })

  test('handles empty CSV', () => {
    const result = parseCsv('')
    expect(result.headers).toEqual([])
    expect(result.rows).toEqual([])
    expect(result.errors).toHaveLength(1)
  })

  test('supports custom separator', () => {
    const csv = 'name;age\nAlice;30'
    const result = parseCsv(csv, ';')
    expect(result.rows[0]).toEqual({ name: 'Alice', age: '30' })
  })

  test('ignores empty lines', () => {
    const csv = 'name\nAlice\n\nBob\n'
    const result = parseCsv(csv)
    expect(result.rows).toHaveLength(2)
  })
})

describe('toCsv', () => {
  test('converts array of objects to CSV', () => {
    const data = [
      { name: 'Alice', age: '30' },
      { name: 'Bob', age: '25' },
    ]
    const csv = toCsv(data)
    expect(csv).toBe('name,age\nAlice,30\nBob,25')
  })

  test('handles empty data', () => {
    expect(toCsv([])).toBe('')
  })

  test('quotes fields containing separator', () => {
    const data = [{ name: 'Alice, Bob', age: '30' }]
    const csv = toCsv(data)
    expect(csv).toContain('"Alice, Bob"')
  })

  test('escapes quotes in values', () => {
    const data = [{ name: 'She said "hi"' }]
    const csv = toCsv(data)
    expect(csv).toContain('"She said ""hi"""')
  })

  test('supports custom headers', () => {
    const data = [{ name: 'Alice', age: '30', extra: 'x' }]
    const csv = toCsv(data, ['name', 'age'])
    expect(csv).toBe('name,age\nAlice,30')
  })

  test('supports custom separator', () => {
    const data = [{ a: '1', b: '2' }]
    const csv = toCsv(data, undefined, ';')
    expect(csv).toBe('a;b\n1;2')
  })
})

describe('CSV roundtrip', () => {
  test('parse(toCsv(data)) preserves data', () => {
    const original = [
      { name: 'Alice', city: 'São Paulo' },
      { name: 'Bob', city: 'Rio de Janeiro' },
    ]
    const csv = toCsv(original)
    const parsed = parseCsv(csv)
    expect(parsed.rows).toEqual(original)
  })
})
