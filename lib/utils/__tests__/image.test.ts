import { describe, test, expect } from 'vitest'
import { placeholderDataUri, initialsAvatar, isImageUrl, fitDimensions } from '../image'

describe('placeholderDataUri', () => {
  test('returns data URI', () => {
    expect(placeholderDataUri(100, 100)).toMatch(/^data:image\/svg\+xml;base64,/)
  })
  test('uses custom color', () => {
    const uri = placeholderDataUri(100, 100, '#ff0000')
    const decoded = atob(uri.replace('data:image/svg+xml;base64,', ''))
    expect(decoded).toContain('#ff0000')
  })
})

describe('initialsAvatar', () => {
  test('extracts initials', () => {
    const uri = initialsAvatar('Jair Bolsonaro')
    const decoded = atob(uri.replace('data:image/svg+xml;base64,', ''))
    expect(decoded).toContain('JB')
  })
  test('handles single name', () => {
    const uri = initialsAvatar('Lula')
    const decoded = atob(uri.replace('data:image/svg+xml;base64,', ''))
    expect(decoded).toContain('L')
  })
  test('consistent color for same name', () => {
    expect(initialsAvatar('test')).toBe(initialsAvatar('test'))
  })
})

describe('isImageUrl', () => {
  test('accepts .jpg', () => {
    expect(isImageUrl('https://ex.com/image.jpg')).toBe(true)
  })
  test('accepts .png', () => {
    expect(isImageUrl('https://ex.com/image.png')).toBe(true)
  })
  test('accepts .webp', () => {
    expect(isImageUrl('https://ex.com/image.webp')).toBe(true)
  })
  test('rejects non-image', () => {
    expect(isImageUrl('https://ex.com/doc.pdf')).toBe(false)
  })
  test('rejects no extension', () => {
    expect(isImageUrl('https://ex.com/foo')).toBe(false)
  })
  test('rejects invalid URL', () => {
    expect(isImageUrl('not-a-url')).toBe(false)
  })
})

describe('fitDimensions', () => {
  test('does not upscale', () => {
    expect(fitDimensions(100, 100, 200, 200)).toEqual({ width: 100, height: 100 })
  })
  test('scales down proportionally', () => {
    expect(fitDimensions(200, 100, 100, 100)).toEqual({ width: 100, height: 50 })
  })
  test('respects both dimensions', () => {
    expect(fitDimensions(100, 200, 100, 100)).toEqual({ width: 50, height: 100 })
  })
})
