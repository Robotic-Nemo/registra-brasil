import { describe, test, expect } from 'vitest'
import {
  string, number, boolean, object, array, formatErrors,
} from '../validate'

describe('string()', () => {
  test('accepts valid strings', () => {
    const result = string().parse('hello')
    expect(result.ok).toBe(true)
    if (result.ok) expect(result.data).toBe('hello')
  })

  test('rejects non-strings', () => {
    expect(string().parse(42).ok).toBe(false)
    expect(string().parse(null).ok).toBe(false)
    expect(string().parse(undefined).ok).toBe(false)
  })

  test('min() validates minimum length', () => {
    expect(string().min(3).parse('ab').ok).toBe(false)
    expect(string().min(3).parse('abc').ok).toBe(true)
  })

  test('max() validates maximum length', () => {
    expect(string().max(3).parse('abcd').ok).toBe(false)
    expect(string().max(3).parse('abc').ok).toBe(true)
  })

  test('email() validates email format', () => {
    expect(string().email().parse('user@example.com').ok).toBe(true)
    expect(string().email().parse('invalid').ok).toBe(false)
  })

  test('url() validates URL format', () => {
    expect(string().url().parse('https://example.com').ok).toBe(true)
    expect(string().url().parse('ftp://files.com').ok).toBe(false)
    expect(string().url().parse('not-a-url').ok).toBe(false)
  })

  test('uuid() validates UUID format', () => {
    expect(string().uuid().parse('550e8400-e29b-41d4-a716-446655440000').ok).toBe(true)
    expect(string().uuid().parse('not-a-uuid').ok).toBe(false)
  })

  test('slug() validates slug format', () => {
    expect(string().slug().parse('hello-world').ok).toBe(true)
    expect(string().slug().parse('Hello World').ok).toBe(false)
    expect(string().slug().parse('-leading').ok).toBe(false)
  })

  test('date() validates ISO date format', () => {
    expect(string().date().parse('2024-03-15').ok).toBe(true)
    expect(string().date().parse('2024-02-30').ok).toBe(false)
    expect(string().date().parse('not-date').ok).toBe(false)
  })

  test('oneOf() validates enum values', () => {
    const v = string().oneOf(['a', 'b', 'c'])
    expect(v.parse('a').ok).toBe(true)
    expect(v.parse('d').ok).toBe(false)
  })

  test('pattern() validates regex', () => {
    expect(string().pattern(/^\d+$/).parse('123').ok).toBe(true)
    expect(string().pattern(/^\d+$/).parse('abc').ok).toBe(false)
  })

  test('chains multiple validations', () => {
    const v = string().min(2).max(10).pattern(/^[a-z]+$/)
    expect(v.parse('hello').ok).toBe(true)
    expect(v.parse('a').ok).toBe(false) // too short
    expect(v.parse('Hello').ok).toBe(false) // pattern fail
  })

  test('optional() accepts undefined/null', () => {
    const v = string().optional()
    expect(v.parse(undefined).ok).toBe(true)
    expect(v.parse(null).ok).toBe(true)
    expect(v.parse('hello').ok).toBe(true)
    if (v.parse(undefined).ok) expect(v.parse(undefined).ok && (v.parse(undefined) as any).data).toBeUndefined()
  })
})

describe('number()', () => {
  test('accepts valid numbers', () => {
    const result = number().parse(42)
    expect(result.ok).toBe(true)
    if (result.ok) expect(result.data).toBe(42)
  })

  test('coerces string to number', () => {
    const result = number().parse('42')
    expect(result.ok).toBe(true)
    if (result.ok) expect(result.data).toBe(42)
  })

  test('rejects NaN', () => {
    expect(number().parse('abc').ok).toBe(false)
    expect(number().parse(NaN).ok).toBe(false)
  })

  test('min() validates minimum', () => {
    expect(number().min(0).parse(-1).ok).toBe(false)
    expect(number().min(0).parse(0).ok).toBe(true)
  })

  test('max() validates maximum', () => {
    expect(number().max(100).parse(101).ok).toBe(false)
    expect(number().max(100).parse(100).ok).toBe(true)
  })

  test('int() validates integer', () => {
    expect(number().int().parse(42).ok).toBe(true)
    expect(number().int().parse(42.5).ok).toBe(false)
  })

  test('optional() accepts undefined', () => {
    expect(number().optional().parse(undefined).ok).toBe(true)
  })
})

describe('boolean()', () => {
  test('accepts boolean values', () => {
    expect(boolean().parse(true).ok).toBe(true)
    expect(boolean().parse(false).ok).toBe(true)
  })

  test('coerces string "true"/"false"', () => {
    const r1 = boolean().parse('true')
    expect(r1.ok).toBe(true)
    if (r1.ok) expect(r1.data).toBe(true)
    const r2 = boolean().parse('false')
    expect(r2.ok).toBe(true)
    if (r2.ok) expect(r2.data).toBe(false)
  })

  test('rejects other values', () => {
    expect(boolean().parse('yes').ok).toBe(false)
    expect(boolean().parse(1).ok).toBe(false)
  })
})

describe('object()', () => {
  test('validates object shape', () => {
    const schema = object({
      name: string().min(1),
      age: number().min(0),
    })
    const result = schema.parse({ name: 'Alice', age: 30 })
    expect(result.ok).toBe(true)
    if (result.ok) {
      expect(result.data.name).toBe('Alice')
      expect(result.data.age).toBe(30)
    }
  })

  test('returns errors for invalid fields', () => {
    const schema = object({
      name: string(),
      age: number(),
    })
    const result = schema.parse({ name: 42, age: 'abc' })
    expect(result.ok).toBe(false)
    if (!result.ok) {
      expect(result.errors).toHaveLength(2)
      expect(result.errors[0].path).toBe('name')
      expect(result.errors[1].path).toBe('age')
    }
  })

  test('rejects non-object values', () => {
    const schema = object({ name: string() })
    expect(schema.parse('string').ok).toBe(false)
    expect(schema.parse(null).ok).toBe(false)
    expect(schema.parse([]).ok).toBe(false)
  })

  test('handles optional fields', () => {
    const schema = object({
      name: string(),
      bio: string().optional(),
    })
    const result = schema.parse({ name: 'Alice' })
    expect(result.ok).toBe(true)
  })
})

describe('array()', () => {
  test('validates array of items', () => {
    const schema = array(string())
    const result = schema.parse(['a', 'b', 'c'])
    expect(result.ok).toBe(true)
    if (result.ok) expect(result.data).toEqual(['a', 'b', 'c'])
  })

  test('returns errors for invalid items', () => {
    const schema = array(number())
    const result = schema.parse([1, 'abc', 3])
    expect(result.ok).toBe(false)
    if (!result.ok) {
      expect(result.errors[0].path).toBe('[1]')
    }
  })

  test('rejects non-array values', () => {
    expect(array(string()).parse('not-array').ok).toBe(false)
  })

  test('min() validates minimum length', () => {
    expect(array(string()).min(2).parse(['a']).ok).toBe(false)
    expect(array(string()).min(2).parse(['a', 'b']).ok).toBe(true)
  })

  test('max() validates maximum length', () => {
    expect(array(string()).max(2).parse(['a', 'b', 'c']).ok).toBe(false)
    expect(array(string()).max(2).parse(['a', 'b']).ok).toBe(true)
  })
})

describe('formatErrors', () => {
  test('formats errors as a flat object', () => {
    const errors = [
      { path: 'name', message: 'Required' },
      { path: 'email', message: 'Invalid' },
    ]
    expect(formatErrors(errors)).toEqual({
      name: 'Required',
      email: 'Invalid',
    })
  })

  test('keeps first error per path', () => {
    const errors = [
      { path: 'name', message: 'Error 1' },
      { path: 'name', message: 'Error 2' },
    ]
    expect(formatErrors(errors)).toEqual({ name: 'Error 1' })
  })
})
