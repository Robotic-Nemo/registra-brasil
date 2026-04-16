import { describe, test, expect } from 'vitest'
import {
  sanitizeInput, sanitizeUrl, sanitizeFormData, sanitizeSlug,
} from '../sanitize'

describe('sanitizeInput', () => {
  test('strips HTML tags', () => {
    expect(sanitizeInput('<b>bold</b>')).toBe('bold')
  })

  test('decodes HTML entities', () => {
    expect(sanitizeInput('a &amp; b')).toBe('a & b')
  })

  test('strips tags revealed by entity decoding', () => {
    expect(sanitizeInput('&lt;script&gt;alert(1)&lt;/script&gt;')).toBe('alert(1)')
  })

  test('removes null bytes', () => {
    expect(sanitizeInput('hello\x00world')).toBe('hello world')
  })

  test('removes zero-width characters', () => {
    expect(sanitizeInput('hello\u200Bworld')).toBe('helloworld')
  })

  test('normalizes whitespace', () => {
    expect(sanitizeInput('hello   world  ')).toBe('hello world')
  })

  test('handles empty string', () => {
    expect(sanitizeInput('')).toBe('')
  })

  test('handles plain text', () => {
    expect(sanitizeInput('just text')).toBe('just text')
  })
})

describe('sanitizeUrl', () => {
  test('returns normalized URL for valid https', () => {
    expect(sanitizeUrl('https://example.com/path ')).toBe('https://example.com/path')
  })

  test('returns normalized URL for http', () => {
    expect(sanitizeUrl('http://example.com')).toBe('http://example.com/')
  })

  test('returns null for ftp', () => {
    expect(sanitizeUrl('ftp://files.com')).toBeNull()
  })

  test('returns null for invalid URL', () => {
    expect(sanitizeUrl('not a url')).toBeNull()
  })

  test('returns null for javascript: protocol', () => {
    expect(sanitizeUrl('javascript:alert(1)')).toBeNull()
  })
})

describe('sanitizeFormData', () => {
  test('sanitizes all string values', () => {
    const result = sanitizeFormData({
      name: '<b>Alice</b>',
      bio: 'hello   world',
    })
    expect(result.name).toBe('Alice')
    expect(result.bio).toBe('hello world')
  })
})

describe('sanitizeSlug', () => {
  test('lowercases and removes invalid chars', () => {
    expect(sanitizeSlug('Hello World!')).toBe('helloworld')
  })

  test('normalizes hyphens', () => {
    expect(sanitizeSlug('a--b---c')).toBe('a-b-c')
  })

  test('removes leading/trailing hyphens', () => {
    expect(sanitizeSlug('-hello-')).toBe('hello')
  })

  test('handles valid slug unchanged', () => {
    expect(sanitizeSlug('hello-world')).toBe('hello-world')
  })
})
