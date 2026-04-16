import { describe, test, expect } from 'vitest'
import { Keys, isActivationKey, isArrowKey, rovingIndex } from '../keyboard'

describe('Keys', () => {
  test('exports expected keys', () => {
    expect(Keys.Enter).toBe('Enter')
    expect(Keys.Space).toBe(' ')
    expect(Keys.Escape).toBe('Escape')
  })
})

describe('isActivationKey', () => {
  test('true for Enter', () => {
    expect(isActivationKey({ key: 'Enter' })).toBe(true)
  })
  test('true for Space', () => {
    expect(isActivationKey({ key: ' ' })).toBe(true)
  })
  test('false for other', () => {
    expect(isActivationKey({ key: 'Tab' })).toBe(false)
  })
})

describe('isArrowKey', () => {
  test('true for ArrowUp', () => {
    expect(isArrowKey({ key: 'ArrowUp' })).toBe(true)
  })
  test('true for ArrowDown', () => {
    expect(isArrowKey({ key: 'ArrowDown' })).toBe(true)
  })
  test('true for ArrowLeft', () => {
    expect(isArrowKey({ key: 'ArrowLeft' })).toBe(true)
  })
  test('true for ArrowRight', () => {
    expect(isArrowKey({ key: 'ArrowRight' })).toBe(true)
  })
  test('false for Enter', () => {
    expect(isArrowKey({ key: 'Enter' })).toBe(false)
  })
})

describe('rovingIndex vertical', () => {
  test('ArrowDown advances', () => {
    expect(rovingIndex('ArrowDown', 0, 3)).toBe(1)
  })
  test('ArrowDown wraps', () => {
    expect(rovingIndex('ArrowDown', 2, 3)).toBe(0)
  })
  test('ArrowUp decrements', () => {
    expect(rovingIndex('ArrowUp', 1, 3)).toBe(0)
  })
  test('ArrowUp wraps from 0', () => {
    expect(rovingIndex('ArrowUp', 0, 3)).toBe(2)
  })
  test('Home returns 0', () => {
    expect(rovingIndex('Home', 2, 3)).toBe(0)
  })
  test('End returns last', () => {
    expect(rovingIndex('End', 0, 3)).toBe(2)
  })
  test('unhandled key returns -1', () => {
    expect(rovingIndex('Tab', 0, 3)).toBe(-1)
  })
})

describe('rovingIndex horizontal', () => {
  test('ArrowRight advances', () => {
    expect(rovingIndex('ArrowRight', 0, 3, 'horizontal')).toBe(1)
  })
  test('ArrowLeft decrements', () => {
    expect(rovingIndex('ArrowLeft', 1, 3, 'horizontal')).toBe(0)
  })
  test('vertical keys ignored in horizontal', () => {
    expect(rovingIndex('ArrowDown', 0, 3, 'horizontal')).toBe(-1)
  })
})
