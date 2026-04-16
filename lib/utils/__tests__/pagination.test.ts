import { describe, test, expect } from 'vitest'
import { getPaginationMeta, getPageNumbers, getOffset, parsePageParam } from '../pagination'

describe('getPaginationMeta', () => {
  test('calculates correct metadata', () => {
    const meta = getPaginationMeta(2, 10, 95)
    expect(meta.page).toBe(2)
    expect(meta.perPage).toBe(10)
    expect(meta.total).toBe(95)
    expect(meta.totalPages).toBe(10)
    expect(meta.hasNext).toBe(true)
    expect(meta.hasPrev).toBe(true)
  })

  test('first page has no prev', () => {
    const meta = getPaginationMeta(1, 10, 50)
    expect(meta.hasPrev).toBe(false)
    expect(meta.hasNext).toBe(true)
  })

  test('last page has no next', () => {
    const meta = getPaginationMeta(5, 10, 50)
    expect(meta.hasNext).toBe(false)
    expect(meta.hasPrev).toBe(true)
  })

  test('single page has neither prev nor next', () => {
    const meta = getPaginationMeta(1, 10, 5)
    expect(meta.hasNext).toBe(false)
    expect(meta.hasPrev).toBe(false)
    expect(meta.totalPages).toBe(1)
  })

  test('handles zero total', () => {
    const meta = getPaginationMeta(1, 10, 0)
    expect(meta.totalPages).toBe(0)
    expect(meta.hasNext).toBe(false)
  })
})

describe('getPageNumbers', () => {
  test('returns all pages when total <= maxVisible', () => {
    expect(getPageNumbers(1, 5)).toEqual([1, 2, 3, 4, 5])
  })

  test('returns ellipsis for large page counts', () => {
    const pages = getPageNumbers(5, 20)
    expect(pages[0]).toBe(1)
    expect(pages[pages.length - 1]).toBe(20)
    expect(pages).toContain('...')
  })

  test('shows first page and last page always', () => {
    const pages = getPageNumbers(10, 50)
    expect(pages[0]).toBe(1)
    expect(pages[pages.length - 1]).toBe(50)
  })

  test('returns single page for totalPages=1', () => {
    expect(getPageNumbers(1, 1)).toEqual([1])
  })

  test('handles currentPage at start', () => {
    const pages = getPageNumbers(1, 20)
    expect(pages[0]).toBe(1)
    expect(pages).toContain(2)
  })

  test('handles currentPage at end', () => {
    const pages = getPageNumbers(20, 20)
    expect(pages[pages.length - 1]).toBe(20)
    expect(pages).toContain(19)
  })
})

describe('getOffset', () => {
  test('calculates offset for page 1', () => {
    expect(getOffset(1, 10)).toBe(0)
  })

  test('calculates offset for page 3', () => {
    expect(getOffset(3, 10)).toBe(20)
  })

  test('treats page 0 as page 1', () => {
    expect(getOffset(0, 10)).toBe(0)
  })

  test('treats negative page as page 1', () => {
    expect(getOffset(-5, 10)).toBe(0)
  })
})

describe('parsePageParam', () => {
  test('parses valid page number', () => {
    expect(parsePageParam('5')).toBe(5)
  })

  test('returns 1 for null', () => {
    expect(parsePageParam(null)).toBe(1)
  })

  test('returns 1 for undefined', () => {
    expect(parsePageParam(undefined)).toBe(1)
  })

  test('returns 1 for non-numeric string', () => {
    expect(parsePageParam('abc')).toBe(1)
  })

  test('returns 1 for page less than 1', () => {
    expect(parsePageParam('0')).toBe(1)
    expect(parsePageParam('-5')).toBe(1)
  })

  test('clamps to max', () => {
    expect(parsePageParam('5000', 1000)).toBe(1000)
  })

  test('allows page at max', () => {
    expect(parsePageParam('1000', 1000)).toBe(1000)
  })
})
