import { describe, test, expect } from 'vitest'
import { searchParamsSchema } from '../search'

describe('searchParamsSchema', () => {
  test('accepts valid query', () => {
    expect(searchParamsSchema.parse({ q: 'hello' }).ok).toBe(true)
  })
  test('rejects short query', () => {
    expect(searchParamsSchema.parse({ q: 'a' }).ok).toBe(false)
  })
  test('accepts with type all', () => {
    expect(searchParamsSchema.parse({ q: 'hello', type: 'all' }).ok).toBe(true)
  })
  test('accepts with type statements', () => {
    expect(searchParamsSchema.parse({ q: 'hello', type: 'statements' }).ok).toBe(true)
  })
  test('accepts with type politicians', () => {
    expect(searchParamsSchema.parse({ q: 'hello', type: 'politicians' }).ok).toBe(true)
  })
  test('rejects invalid type', () => {
    expect(searchParamsSchema.parse({ q: 'hello', type: 'foo' }).ok).toBe(false)
  })
  test('rejects limit > 50', () => {
    expect(searchParamsSchema.parse({ q: 'hello', limit: 100 }).ok).toBe(false)
  })
  test('rejects empty q', () => {
    expect(searchParamsSchema.parse({}).ok).toBe(false)
  })
})
