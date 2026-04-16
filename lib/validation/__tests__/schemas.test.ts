import { describe, test, expect } from 'vitest'
import {
  uuidSchema,
  slugSchema,
  emailSchema,
  urlSchema,
  dateSchema,
  nonEmptyString,
  paginationSchema,
  sortOrderSchema,
  sourceTypeSchema,
  verificationStatusSchema,
  SOURCE_TYPES,
  VERIFICATION_STATUSES,
} from '../schemas'

describe('uuidSchema', () => {
  test('accepts valid UUID', () => {
    const r = uuidSchema.parse('550e8400-e29b-41d4-a716-446655440000')
    expect(r.ok).toBe(true)
  })
  test('rejects non-UUID', () => {
    expect(uuidSchema.parse('not-a-uuid').ok).toBe(false)
  })
})

describe('slugSchema', () => {
  test('accepts valid slug', () => {
    expect(slugSchema.parse('hello-world').ok).toBe(true)
  })
  test('rejects uppercase', () => {
    expect(slugSchema.parse('Hello').ok).toBe(false)
  })
  test('rejects too short', () => {
    expect(slugSchema.parse('a').ok).toBe(false)
  })
})

describe('emailSchema', () => {
  test('accepts valid email', () => {
    expect(emailSchema.parse('test@example.com').ok).toBe(true)
  })
  test('rejects malformed email', () => {
    expect(emailSchema.parse('not-email').ok).toBe(false)
  })
})

describe('urlSchema', () => {
  test('accepts valid URL', () => {
    expect(urlSchema.parse('https://example.com').ok).toBe(true)
  })
  test('rejects invalid URL', () => {
    expect(urlSchema.parse('not a url').ok).toBe(false)
  })
})

describe('dateSchema', () => {
  test('accepts YYYY-MM-DD', () => {
    expect(dateSchema.parse('2024-01-01').ok).toBe(true)
  })
  test('rejects other formats', () => {
    expect(dateSchema.parse('01/01/2024').ok).toBe(false)
  })
})

describe('nonEmptyString', () => {
  test('accepts non-empty', () => {
    expect(nonEmptyString.parse('x').ok).toBe(true)
  })
  test('rejects empty', () => {
    expect(nonEmptyString.parse('').ok).toBe(false)
  })
})

describe('paginationSchema', () => {
  test('accepts valid pagination', () => {
    expect(paginationSchema.parse({ page: 1, limit: 10 }).ok).toBe(true)
  })
  test('rejects limit > 100', () => {
    expect(paginationSchema.parse({ limit: 101 }).ok).toBe(false)
  })
  test('allows empty object (optional fields)', () => {
    expect(paginationSchema.parse({}).ok).toBe(true)
  })
})

describe('sortOrderSchema', () => {
  test('accepts asc', () => {
    expect(sortOrderSchema.parse({ order: 'asc' }).ok).toBe(true)
  })
  test('accepts desc', () => {
    expect(sortOrderSchema.parse({ order: 'desc' }).ok).toBe(true)
  })
  test('rejects invalid order', () => {
    expect(sortOrderSchema.parse({ order: 'up' }).ok).toBe(false)
  })
})

describe('sourceTypeSchema', () => {
  test.each(SOURCE_TYPES)('accepts %s', (type) => {
    expect(sourceTypeSchema.parse(type).ok).toBe(true)
  })
  test('rejects unknown', () => {
    expect(sourceTypeSchema.parse('unknown_type').ok).toBe(false)
  })
})

describe('verificationStatusSchema', () => {
  test.each(VERIFICATION_STATUSES)('accepts %s', (status) => {
    expect(verificationStatusSchema.parse(status).ok).toBe(true)
  })
  test('rejects unknown', () => {
    expect(verificationStatusSchema.parse('approved').ok).toBe(false)
  })
})
