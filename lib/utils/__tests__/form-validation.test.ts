import { describe, test, expect } from 'vitest'
import { rules, validateForm, getFieldError } from '../form-validation'

describe('rules', () => {
  test('required: fails on empty string', () => {
    const rule = rules.required()
    expect(rule.validate('')).toBe(false)
    expect(rule.validate('   ')).toBe(false)
  })

  test('required: passes on non-empty string', () => {
    expect(rules.required().validate('hello')).toBe(true)
  })

  test('required: uses custom message', () => {
    expect(rules.required('Nome obrigatório').message).toBe('Nome obrigatório')
  })

  test('minLength: validates minimum length', () => {
    const rule = rules.minLength(3)
    expect(rule.validate('ab')).toBe(false)
    expect(rule.validate('abc')).toBe(true)
  })

  test('maxLength: validates maximum length', () => {
    const rule = rules.maxLength(5)
    expect(rule.validate('abcdef')).toBe(false)
    expect(rule.validate('abcde')).toBe(true)
  })

  test('email: validates email format', () => {
    expect(rules.email().validate('user@example.com')).toBe(true)
    expect(rules.email().validate('invalid')).toBe(false)
  })

  test('url: validates URL format', () => {
    expect(rules.url().validate('https://example.com')).toBe(true)
    expect(rules.url().validate('not-a-url')).toBe(false)
  })

  test('slug: validates slug format', () => {
    expect(rules.slug().validate('hello-world')).toBe(true)
    expect(rules.slug().validate('Hello World')).toBe(false)
  })

  test('date: validates date', () => {
    expect(rules.date().validate('2024-01-01')).toBe(true)
    expect(rules.date().validate('invalid')).toBe(false)
  })

  test('pattern: validates custom regex', () => {
    const rule = rules.pattern(/^\d+$/, 'Apenas números')
    expect(rule.validate('123')).toBe(true)
    expect(rule.validate('abc')).toBe(false)
    expect(rule.message).toBe('Apenas números')
  })

  test('matches: checks equality', () => {
    const rule = rules.matches('secret')
    expect(rule.validate('secret')).toBe(true)
    expect(rule.validate('other')).toBe(false)
  })
})

describe('validateForm', () => {
  test('returns valid for passing data', () => {
    const result = validateForm(
      { name: 'Alice', email: 'alice@test.com' },
      [
        { field: 'name', rules: [rules.required()] },
        { field: 'email', rules: [rules.email()] },
      ]
    )
    expect(result.valid).toBe(true)
    expect(Object.keys(result.errors)).toHaveLength(0)
  })

  test('returns errors for failing data', () => {
    const result = validateForm(
      { name: '', email: 'bad' },
      [
        { field: 'name', rules: [rules.required()] },
        { field: 'email', rules: [rules.email()] },
      ]
    )
    expect(result.valid).toBe(false)
    expect(result.errors.name).toHaveLength(1)
    expect(result.errors.email).toHaveLength(1)
  })

  test('collects multiple errors per field', () => {
    const result = validateForm(
      { name: '' },
      [{ field: 'name', rules: [rules.required(), rules.minLength(3)] }]
    )
    expect(result.errors.name).toHaveLength(2)
  })

  test('handles missing fields in data', () => {
    const result = validateForm(
      {},
      [{ field: 'name', rules: [rules.required()] }]
    )
    expect(result.valid).toBe(false)
  })
})

describe('getFieldError', () => {
  test('returns first error for a field', () => {
    const errors = { name: ['Error 1', 'Error 2'] }
    expect(getFieldError(errors, 'name')).toBe('Error 1')
  })

  test('returns undefined for field without errors', () => {
    expect(getFieldError({}, 'name')).toBeUndefined()
  })
})
