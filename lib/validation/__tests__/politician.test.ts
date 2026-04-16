import { describe, test, expect } from 'vitest'
import { createPoliticianSchema, updatePoliticianSchema } from '../politician'

function validPolitician(overrides: Record<string, unknown> = {}) {
  return {
    slug: 'lula',
    full_name: 'Luiz Inacio Lula da Silva',
    common_name: 'Lula',
    party: 'PT',
    state: 'SP',
    role: 'Presidente',
    ...overrides,
  }
}

describe('createPoliticianSchema', () => {
  test('accepts valid politician', () => {
    expect(createPoliticianSchema.parse(validPolitician()).ok).toBe(true)
  })
  test('rejects short full_name', () => {
    expect(createPoliticianSchema.parse(validPolitician({ full_name: 'A' })).ok).toBe(false)
  })
  test('rejects lowercase state', () => {
    expect(createPoliticianSchema.parse(validPolitician({ state: 'sp' })).ok).toBe(false)
  })
  test('rejects state longer than 2 chars', () => {
    expect(createPoliticianSchema.parse(validPolitician({ state: 'SAP' })).ok).toBe(false)
  })
  test('rejects empty party', () => {
    expect(createPoliticianSchema.parse(validPolitician({ party: '' })).ok).toBe(false)
  })
  test('accepts with photo_url', () => {
    expect(createPoliticianSchema.parse(validPolitician({ photo_url: 'https://example.com/p.jpg' })).ok).toBe(true)
  })
  test('rejects invalid photo_url', () => {
    expect(createPoliticianSchema.parse(validPolitician({ photo_url: 'not-url' })).ok).toBe(false)
  })
  test('rejects invalid slug (uppercase)', () => {
    expect(createPoliticianSchema.parse(validPolitician({ slug: 'Lula' })).ok).toBe(false)
  })
})

describe('updatePoliticianSchema', () => {
  test('accepts empty update (all optional)', () => {
    expect(updatePoliticianSchema.parse({}).ok).toBe(true)
  })
  test('accepts partial update', () => {
    expect(updatePoliticianSchema.parse({ role: 'Deputado' }).ok).toBe(true)
  })
  test('validates state when present', () => {
    expect(updatePoliticianSchema.parse({ state: 'xx' }).ok).toBe(false)
  })
})
