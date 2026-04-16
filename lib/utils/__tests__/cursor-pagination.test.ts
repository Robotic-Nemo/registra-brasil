import { describe, test, expect } from 'vitest'
import {
  encodeCursor,
  decodeCursor,
  parseLimit,
  buildCursorPagination,
} from '../cursor-pagination'

describe('encodeCursor / decodeCursor roundtrip', () => {
  test('encodes and decodes basic cursor', () => {
    const cursor = encodeCursor('2024-01-01', 'abc-123')
    const decoded = decodeCursor(cursor)
    expect(decoded).toEqual({ v: '2024-01-01', id: 'abc-123' })
  })

  test('encoded cursor is URL-safe', () => {
    const cursor = encodeCursor('some value with /+=', 'id-1')
    expect(cursor).not.toContain('+')
    expect(cursor).not.toContain('/')
    expect(cursor).not.toContain('=')
  })

  test('encodes empty strings', () => {
    const cursor = encodeCursor('', '')
    expect(decodeCursor(cursor)).toEqual({ v: '', id: '' })
  })

  test('encodes ASCII special characters', () => {
    const cursor = encodeCursor('value!@#$%^&*()', 'id!@#')
    expect(decodeCursor(cursor)).toEqual({ v: 'value!@#$%^&*()', id: 'id!@#' })
  })
})

describe('decodeCursor', () => {
  test('returns null for invalid base64', () => {
    expect(decodeCursor('!!!not-base64!!!')).toBeNull()
  })

  test('returns null for valid base64 but invalid JSON', () => {
    const bad = Buffer.from('not json').toString('base64')
    expect(decodeCursor(bad)).toBeNull()
  })

  test('returns null when missing required fields', () => {
    const bad = Buffer.from(JSON.stringify({ foo: 'bar' })).toString('base64')
    expect(decodeCursor(bad)).toBeNull()
  })

  test('returns null when fields are wrong types', () => {
    const bad = Buffer.from(JSON.stringify({ v: 1, id: 2 })).toString('base64')
    expect(decodeCursor(bad)).toBeNull()
  })
})

describe('parseLimit', () => {
  test('uses default when null', () => {
    expect(parseLimit(null)).toBe(20)
  })
  test('uses default when empty', () => {
    expect(parseLimit('')).toBe(20)
  })
  test('parses valid number', () => {
    expect(parseLimit('50')).toBe(50)
  })
  test('uses default when NaN', () => {
    expect(parseLimit('abc')).toBe(20)
  })
  test('uses default for 0', () => {
    expect(parseLimit('0')).toBe(20)
  })
  test('uses default for negative', () => {
    expect(parseLimit('-5')).toBe(20)
  })
  test('clamps to max', () => {
    expect(parseLimit('9999')).toBe(100)
  })
  test('respects custom defaults', () => {
    expect(parseLimit(null, 10, 50)).toBe(10)
  })
  test('respects custom max', () => {
    expect(parseLimit('200', 10, 50)).toBe(50)
  })
})

describe('buildCursorPagination', () => {
  const rows = [
    { id: '1', date: '2024-01-03' },
    { id: '2', date: '2024-01-02' },
    { id: '3', date: '2024-01-01' },
  ]

  test('builds with hasMore true', () => {
    const page = buildCursorPagination(rows, 'date', 3, true)
    expect(page.hasMore).toBe(true)
    expect(page.nextCursor).not.toBeNull()
    expect(page.prevCursor).not.toBeNull()
    expect(page.limit).toBe(3)
  })

  test('nextCursor is null when hasMore is false', () => {
    const page = buildCursorPagination(rows, 'date', 3, false)
    expect(page.nextCursor).toBeNull()
  })

  test('both cursors null for empty rows', () => {
    const page = buildCursorPagination([], 'date', 10, false)
    expect(page.nextCursor).toBeNull()
    expect(page.prevCursor).toBeNull()
  })

  test('cursors encode last/first rows correctly', () => {
    const page = buildCursorPagination(rows, 'date', 3, true)
    expect(decodeCursor(page.nextCursor!)).toEqual({ v: '2024-01-01', id: '3' })
    expect(decodeCursor(page.prevCursor!)).toEqual({ v: '2024-01-03', id: '1' })
  })
})
