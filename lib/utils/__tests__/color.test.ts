import { describe, test, expect } from 'vitest'
import { hexToRgb, luminance, contrastRatio, textColorForBg } from '../color'

describe('hexToRgb', () => {
  test('converts valid 6-digit hex to RGB tuple', () => {
    expect(hexToRgb('#FF0000')).toEqual([255, 0, 0])
  })
  test('handles hex without # prefix', () => {
    expect(hexToRgb('00FF00')).toEqual([0, 255, 0])
  })
  test('returns null for invalid hex length', () => {
    expect(hexToRgb('#FFF')).toBeNull()
    expect(hexToRgb('#FFFFFFF')).toBeNull()
  })
  test('parses black (#000000) correctly', () => {
    expect(hexToRgb('#000000')).toEqual([0, 0, 0])
  })
  test('parses white (#FFFFFF) correctly', () => {
    expect(hexToRgb('#FFFFFF')).toEqual([255, 255, 255])
  })
  test('handles lowercase hex', () => {
    expect(hexToRgb('#ff8800')).toEqual([255, 136, 0])
  })
})

describe('luminance', () => {
  test('returns 0 for black', () => {
    expect(luminance(0, 0, 0)).toBe(0)
  })
  test('returns 1 for white', () => {
    expect(luminance(255, 255, 255)).toBe(1)
  })
  test('returns intermediate value for gray', () => {
    const l = luminance(128, 128, 128)
    expect(l).toBeGreaterThan(0)
    expect(l).toBeLessThan(1)
  })
})

describe('contrastRatio', () => {
  test('returns 21 for black on white', () => {
    const ratio = contrastRatio('#000000', '#FFFFFF')
    expect(ratio).toBeCloseTo(21, 0)
  })
  test('returns 1 for same colors', () => {
    expect(contrastRatio('#FF0000', '#FF0000')).toBeCloseTo(1, 0)
  })
  test('returns 1 for invalid hex inputs', () => {
    expect(contrastRatio('#FFF', '#000')).toBe(1)
  })
  test('is symmetric', () => {
    const r1 = contrastRatio('#000000', '#FF0000')
    const r2 = contrastRatio('#FF0000', '#000000')
    expect(r1).toBeCloseTo(r2, 5)
  })
})

describe('textColorForBg', () => {
  test('returns white for dark backgrounds', () => {
    expect(textColorForBg('#000000')).toBe('#ffffff')
    expect(textColorForBg('#333333')).toBe('#ffffff')
  })
  test('returns black for light backgrounds', () => {
    expect(textColorForBg('#FFFFFF')).toBe('#000000')
    expect(textColorForBg('#EEEEEE')).toBe('#000000')
  })
  test('returns black for invalid hex input', () => {
    expect(textColorForBg('#FFF')).toBe('#000000')
  })
})
