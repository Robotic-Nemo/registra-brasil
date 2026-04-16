import { describe, test, expect } from 'vitest'
import { capitalize, slugify, pluralizePt, stripHtml, truncateWords } from '../string'

describe('capitalize', () => {
  test('capitalizes first letter of a lowercase string', () => {
    expect(capitalize('hello')).toBe('Hello')
  })

  test('returns empty string for empty input', () => {
    expect(capitalize('')).toBe('')
  })

  test('handles already capitalized string', () => {
    expect(capitalize('Hello')).toBe('Hello')
  })

  test('handles single character', () => {
    expect(capitalize('a')).toBe('A')
  })

  test('does not change rest of string', () => {
    expect(capitalize('hELLO')).toBe('HELLO')
  })
})

describe('slugify', () => {
  test('converts simple string to slug', () => {
    expect(slugify('Hello World')).toBe('hello-world')
  })

  test('removes accents from Portuguese characters', () => {
    expect(slugify('São Paulo')).toBe('sao-paulo')
    expect(slugify('ação')).toBe('acao')
  })

  test('replaces spaces and special chars with hyphens', () => {
    expect(slugify('hello world!')).toBe('hello-world')
  })

  test('strips leading and trailing hyphens', () => {
    expect(slugify('  hello  ')).toBe('hello')
  })

  test('handles empty string', () => {
    expect(slugify('')).toBe('')
  })
})

describe('pluralizePt', () => {
  test('returns singular for count of 1', () => {
    expect(pluralizePt(1, 'declaração', 'declarações')).toBe('declaração')
  })

  test('returns plural for count of 0', () => {
    expect(pluralizePt(0, 'declaração', 'declarações')).toBe('declarações')
  })

  test('returns plural for count greater than 1', () => {
    expect(pluralizePt(5, 'declaração', 'declarações')).toBe('declarações')
  })
})

describe('stripHtml', () => {
  test('removes HTML tags', () => {
    expect(stripHtml('<p>hello</p>')).toBe('hello')
  })

  test('handles string without HTML', () => {
    expect(stripHtml('plain text')).toBe('plain text')
  })

  test('handles nested tags', () => {
    expect(stripHtml('<div><span>nested</span></div>')).toBe('nested')
  })

  test('handles self-closing tags', () => {
    expect(stripHtml('line1<br/>line2')).toBe('line1line2')
  })
})

describe('truncateWords', () => {
  test('truncates string exceeding maxWords', () => {
    expect(truncateWords('one two three four five', 3)).toBe('one two three…')
  })

  test('returns full string when within limit', () => {
    expect(truncateWords('one two', 5)).toBe('one two')
  })

  test('handles empty string', () => {
    expect(truncateWords('', 5)).toBe('')
  })

  test('adds ellipsis when truncated', () => {
    const result = truncateWords('a b c d e', 2)
    expect(result).toContain('…')
  })
})
