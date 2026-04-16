import { describe, test, expect } from 'vitest'
import { invariant, ensure } from '../invariant'

describe('invariant', () => {
  test('does not throw for truthy condition', () => {
    expect(() => invariant(true, 'message')).not.toThrow()
    expect(() => invariant(1, 'message')).not.toThrow()
    expect(() => invariant('non-empty', 'message')).not.toThrow()
  })

  test('throws for falsy condition', () => {
    expect(() => invariant(false, 'bad')).toThrow('Invariant violation: bad')
    expect(() => invariant(null, 'null')).toThrow('Invariant violation: null')
    expect(() => invariant(undefined, 'undef')).toThrow('Invariant violation: undef')
    expect(() => invariant(0, 'zero')).toThrow('Invariant violation: zero')
    expect(() => invariant('', 'empty')).toThrow('Invariant violation: empty')
  })
})

describe('ensure', () => {
  test('returns value if non-null', () => {
    expect(ensure('hello', 'msg')).toBe('hello')
    expect(ensure(0, 'msg')).toBe(0)
    expect(ensure(false, 'msg')).toBe(false)
  })

  test('throws for null', () => {
    expect(() => ensure(null, 'Missing')).toThrow('Invariant violation: Missing')
  })

  test('throws for undefined', () => {
    expect(() => ensure(undefined, 'Missing')).toThrow('Invariant violation: Missing')
  })
})
