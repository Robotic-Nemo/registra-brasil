import { describe, test, expect } from 'vitest'
import { relativeLuminance, contrastRatio, meetsAA, meetsAAA, hexToRgb } from '../a11y'

describe('hexToRgb', () => {
  test('converts white', () => {
    expect(hexToRgb('#ffffff')).toEqual([255, 255, 255])
  })
  test('converts black', () => {
    expect(hexToRgb('#000000')).toEqual([0, 0, 0])
  })
  test('handles lowercase without #', () => {
    expect(hexToRgb('ff0000')).toEqual([255, 0, 0])
  })
  test('converts green', () => {
    expect(hexToRgb('#00ff00')).toEqual([0, 255, 0])
  })
})

describe('relativeLuminance', () => {
  test('black is 0', () => {
    expect(relativeLuminance(0, 0, 0)).toBe(0)
  })
  test('white is 1', () => {
    expect(relativeLuminance(255, 255, 255)).toBeCloseTo(1)
  })
  test('gray is between', () => {
    const lum = relativeLuminance(128, 128, 128)
    expect(lum).toBeGreaterThan(0)
    expect(lum).toBeLessThan(1)
  })
})

describe('contrastRatio', () => {
  test('black on white is 21', () => {
    expect(contrastRatio([0, 0, 0], [255, 255, 255])).toBeCloseTo(21, 0)
  })
  test('same color is 1', () => {
    expect(contrastRatio([100, 100, 100], [100, 100, 100])).toBeCloseTo(1)
  })
})

describe('meetsAA', () => {
  test('black on white passes AA', () => {
    expect(meetsAA([0, 0, 0], [255, 255, 255])).toBe(true)
  })
  test('similar colors fail AA', () => {
    expect(meetsAA([100, 100, 100], [120, 120, 120])).toBe(false)
  })
})

describe('meetsAAA', () => {
  test('black on white passes AAA', () => {
    expect(meetsAAA([0, 0, 0], [255, 255, 255])).toBe(true)
  })
})
