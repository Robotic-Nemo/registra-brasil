import { describe, test, expect } from 'vitest'
import { isValidUrl, getDomain, isYouTubeUrl } from '../url'

describe('isValidUrl', () => {
  test('returns true for https URL', () => {
    expect(isValidUrl('https://example.com')).toBe(true)
  })
  test('returns true for http URL', () => {
    expect(isValidUrl('http://example.com')).toBe(true)
  })
  test('returns true for ftp URL (any valid URL)', () => {
    expect(isValidUrl('ftp://files.example.com')).toBe(true)
  })
  test('returns false for invalid string', () => {
    expect(isValidUrl('not a url')).toBe(false)
  })
  test('returns false for empty string', () => {
    expect(isValidUrl('')).toBe(false)
  })
})

describe('getDomain', () => {
  test('extracts hostname from URL', () => {
    expect(getDomain('https://www.example.com/path')).toBe('www.example.com')
  })
  test('returns null for invalid URL', () => {
    expect(getDomain('not-a-url')).toBeNull()
  })
  test('handles URL with port', () => {
    expect(getDomain('https://example.com:8080')).toBe('example.com')
  })
})

describe('isYouTubeUrl', () => {
  test('returns true for youtube.com', () => {
    expect(isYouTubeUrl('https://youtube.com/watch?v=abc')).toBe(true)
  })
  test('returns true for www.youtube.com', () => {
    expect(isYouTubeUrl('https://www.youtube.com/watch?v=abc')).toBe(true)
  })
  test('returns true for youtu.be', () => {
    expect(isYouTubeUrl('https://youtu.be/abc')).toBe(true)
  })
  test('returns false for other domains', () => {
    expect(isYouTubeUrl('https://vimeo.com/123')).toBe(false)
  })
  test('returns false for invalid URL', () => {
    expect(isYouTubeUrl('not-a-url')).toBe(false)
  })
})
