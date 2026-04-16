import { describe, test, expect } from 'vitest'
import { pipe, compose } from '../pipe'

describe('pipe', () => {
  test('returns value when no functions given', () => {
    expect(pipe(5)).toBe(5)
  })

  test('applies single function', () => {
    expect(pipe(5, (x: number) => x * 2)).toBe(10)
  })

  test('applies functions left to right', () => {
    const result = pipe(
      '  Hello World  ',
      (s: string) => s.trim(),
      (s: string) => s.toLowerCase(),
      (s: string) => s.replace(/\s+/g, '-'),
    )
    expect(result).toBe('hello-world')
  })

  test('applies multiple transformations', () => {
    const result = pipe(
      10,
      (x: number) => x + 5,
      (x: number) => x * 2,
    )
    expect(result).toBe(30)
  })
})

describe('compose', () => {
  test('applies functions right to left', () => {
    const transform = compose(
      (s: string) => s.replace(/\s+/g, '-'),
      (s: string) => s.toLowerCase(),
      (s: string) => s.trim(),
    )
    expect(transform('  Hello World  ')).toBe('hello-world')
  })

  test('returns identity for no functions', () => {
    const identity = compose<number>()
    expect(identity(42)).toBe(42)
  })

  test('works with single function', () => {
    const double = compose((x: number) => x * 2)
    expect(double(5)).toBe(10)
  })
})
