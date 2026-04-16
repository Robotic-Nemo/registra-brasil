import { describe, test, expect } from 'vitest'
import { wordCount, readingTime, highlightTerms, getInitials } from '../text'

describe('wordCount', () => {
  test('counts words in a sentence', () => {
    expect(wordCount('hello world foo')).toBe(3)
  })
  test('handles multiple spaces', () => {
    expect(wordCount('hello   world')).toBe(2)
  })
  test('returns 0 for empty string', () => {
    expect(wordCount('')).toBe(0)
  })
  test('returns 0 for whitespace-only', () => {
    expect(wordCount('   ')).toBe(0)
  })
  test('handles single word', () => {
    expect(wordCount('hello')).toBe(1)
  })
})

describe('readingTime', () => {
  test('returns 1 minute for short text', () => {
    expect(readingTime('hello world')).toBe(1)
  })
  test('returns higher value for long text', () => {
    const longText = Array(400).fill('word').join(' ')
    expect(readingTime(longText)).toBe(2)
  })
  test('returns at least 1 minute', () => {
    expect(readingTime('a')).toBe(1)
  })
})

describe('highlightTerms', () => {
  test('wraps matched terms in <mark> tags', () => {
    const result = highlightTerms('hello world', ['hello'])
    expect(result).toBe('<mark>hello</mark> world')
  })
  test('highlights multiple terms', () => {
    const result = highlightTerms('hello world', ['hello', 'world'])
    expect(result).toBe('<mark>hello</mark> <mark>world</mark>')
  })
  test('is case-insensitive', () => {
    const result = highlightTerms('Hello World', ['hello'])
    expect(result).toBe('<mark>Hello</mark> World')
  })
  test('returns original text for empty terms', () => {
    expect(highlightTerms('hello', [])).toBe('hello')
  })
  test('escapes regex special characters in terms', () => {
    const result = highlightTerms('test (value)', ['(value)'])
    expect(result).toBe('test <mark>(value)</mark>')
  })
})

describe('getInitials', () => {
  test('extracts initials from full name', () => {
    expect(getInitials('Jair Bolsonaro')).toBe('JB')
  })
  test('handles single name', () => {
    expect(getInitials('Lula')).toBe('L')
  })
  test('respects maxChars', () => {
    expect(getInitials('Luiz Inacio Lula da Silva', 3)).toBe('LIL')
  })
  test('defaults to 2 chars', () => {
    expect(getInitials('Luiz Inacio Lula')).toBe('LI')
  })
  test('handles empty string', () => {
    expect(getInitials('')).toBe('')
  })
})
