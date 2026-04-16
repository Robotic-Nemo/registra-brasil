import { describe, test, expect } from 'vitest'
import { wordDiff, countChanges } from '../diff'

describe('wordDiff', () => {
  test('returns equal segment for identical strings', () => {
    const segments = wordDiff('hello world', 'hello world')
    expect(segments.every(s => s.type === 'equal')).toBe(true)
  })

  test('detects added words', () => {
    const segments = wordDiff('hello', 'hello world')
    const added = segments.filter(s => s.type === 'added')
    expect(added.length).toBeGreaterThan(0)
  })

  test('detects removed words', () => {
    const segments = wordDiff('hello world', 'hello')
    const removed = segments.filter(s => s.type === 'removed')
    expect(removed.length).toBeGreaterThan(0)
  })

  test('handles completely different strings', () => {
    const segments = wordDiff('foo bar', 'baz qux')
    expect(segments.some(s => s.type === 'added')).toBe(true)
    expect(segments.some(s => s.type === 'removed')).toBe(true)
  })

  test('handles empty old text', () => {
    const segments = wordDiff('', 'new text')
    const added = segments.filter(s => s.type === 'added')
    expect(added.length).toBeGreaterThan(0)
  })

  test('handles empty new text', () => {
    const segments = wordDiff('old text', '')
    const removed = segments.filter(s => s.type === 'removed')
    expect(removed.length).toBeGreaterThan(0)
  })

  test('handles both empty', () => {
    const segments = wordDiff('', '')
    // Single empty equal segment
    expect(segments.length).toBeLessThanOrEqual(1)
  })
})

describe('countChanges', () => {
  test('counts added and removed words', () => {
    const segments = wordDiff('hello world', 'hello brave new world')
    const counts = countChanges(segments)
    expect(counts.added).toBeGreaterThan(0)
  })

  test('returns zero changes for identical text', () => {
    const segments = wordDiff('same text', 'same text')
    const counts = countChanges(segments)
    expect(counts.added).toBe(0)
    expect(counts.removed).toBe(0)
  })
})
