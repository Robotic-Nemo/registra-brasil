import { describe, test, expect } from 'vitest'
import { formatJsonExport } from '../json-export'

describe('formatJsonExport', () => {
  test('includes data array', () => {
    const out = formatJsonExport([{ a: 1 }, { a: 2 }], 'test')
    const parsed = JSON.parse(out)
    expect(parsed.data).toHaveLength(2)
  })

  test('includes metadata by default', () => {
    const out = formatJsonExport([{ a: 1 }], 'test')
    const parsed = JSON.parse(out)
    expect(parsed.metadata).toBeDefined()
    expect(parsed.metadata.totalRecords).toBe(1)
    expect(parsed.metadata.entityType).toBe('test')
  })

  test('can exclude metadata', () => {
    const out = formatJsonExport([{ a: 1 }], 'test', { includeMetadata: false })
    expect(JSON.parse(out).metadata).toBeUndefined()
  })

  test('filters fields when specified', () => {
    const out = formatJsonExport([{ a: 1, b: 2, c: 3 }], 'test', { fields: ['a', 'c'] })
    expect(JSON.parse(out).data[0]).toEqual({ a: 1, c: 3 })
  })

  test('minified when prettyPrint=false', () => {
    const out = formatJsonExport([{ a: 1 }], 'test', { prettyPrint: false })
    expect(out).not.toContain('\n')
  })

  test('pretty-prints by default', () => {
    expect(formatJsonExport([{ a: 1 }], 'test')).toContain('\n')
  })

  test('respects custom indent', () => {
    const out = formatJsonExport([{ a: 1 }], 'test', { indent: 4 })
    expect(out).toMatch(/\n\s{4}/)
  })

  test('handles empty data', () => {
    const parsed = JSON.parse(formatJsonExport([], 'test'))
    expect(parsed.data).toEqual([])
    expect(parsed.metadata.totalRecords).toBe(0)
  })
})
