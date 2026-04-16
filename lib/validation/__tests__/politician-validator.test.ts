import { describe, test, expect } from 'vitest'
import { validatePolitician, type PoliticianInput } from '../politician-validator'

function validInput(overrides: Partial<PoliticianInput> = {}): PoliticianInput {
  return {
    slug: 'maria-silva',
    full_name: 'Maria da Silva Santos',
    common_name: 'Maria Silva',
    party: 'PT',
    state: 'SP',
    role: 'Deputada Federal',
    photo_url: null,
    wikipedia_url: null,
    ...overrides,
  }
}

describe('validatePolitician', () => {
  test('accepts valid input', () => {
    const result = validatePolitician(validInput())
    expect(result.ok).toBe(true)
    if (result.ok) {
      expect(result.data.slug).toBe('maria-silva')
      expect(result.data.party).toBe('PT')
    }
  })

  test('rejects invalid slug', () => {
    expect(validatePolitician(validInput({ slug: 'UPPER' })).ok).toBe(false)
    expect(validatePolitician(validInput({ slug: '' })).ok).toBe(false)
  })

  test('rejects short full_name', () => {
    expect(validatePolitician(validInput({ full_name: 'A' })).ok).toBe(false)
  })

  test('rejects missing common_name', () => {
    expect(validatePolitician(validInput({ common_name: '' })).ok).toBe(false)
  })

  test('rejects missing party', () => {
    expect(validatePolitician(validInput({ party: '' })).ok).toBe(false)
  })

  test('rejects invalid state', () => {
    expect(validatePolitician(validInput({ state: 'XX' })).ok).toBe(false)
  })

  test('accepts valid state', () => {
    expect(validatePolitician(validInput({ state: 'RJ' })).ok).toBe(true)
  })

  test('uppercases party', () => {
    const result = validatePolitician(validInput({ party: 'pt' }))
    expect(result.ok).toBe(true)
    if (result.ok) expect(result.data.party).toBe('PT')
  })

  test('rejects invalid photo_url', () => {
    expect(validatePolitician(validInput({ photo_url: 'not-url' })).ok).toBe(false)
  })

  test('accepts valid photo_url', () => {
    expect(validatePolitician(validInput({ photo_url: 'https://example.com/photo.jpg' })).ok).toBe(true)
  })

  test('sanitizes HTML from name fields', () => {
    const result = validatePolitician(validInput({ full_name: '<b>Maria</b> Silva' }))
    expect(result.ok).toBe(true)
    if (result.ok) expect(result.data.full_name).not.toContain('<b>')
  })
})
