import { describe, test, expect } from 'vitest'
import {
  base64Encode,
  base64Decode,
  base64UrlEncode,
  base64UrlDecode,
  hexEncode,
  hexDecode,
} from '../encoding'

describe('base64Encode / base64Decode', () => {
  test('roundtrips ASCII text', () => {
    const text = 'Hello, World!'
    expect(base64Decode(base64Encode(text))).toBe(text)
  })

  test('roundtrips UTF-8 text', () => {
    const text = 'São Paulo é legal!'
    expect(base64Decode(base64Encode(text))).toBe(text)
  })

  test('encodes empty string', () => {
    expect(base64Encode('')).toBe('')
    expect(base64Decode('')).toBe('')
  })

  test('produces valid base64', () => {
    const encoded = base64Encode('test')
    expect(encoded).toMatch(/^[A-Za-z0-9+/]*={0,2}$/)
  })
})

describe('base64UrlEncode / base64UrlDecode', () => {
  test('roundtrips text', () => {
    const text = 'url-safe encoding test'
    expect(base64UrlDecode(base64UrlEncode(text))).toBe(text)
  })

  test('does not contain +, /, or = characters', () => {
    const encoded = base64UrlEncode('test data with special chars!!!')
    expect(encoded).not.toMatch(/[+/=]/)
  })

  test('handles UTF-8', () => {
    const text = 'ação'
    expect(base64UrlDecode(base64UrlEncode(text))).toBe(text)
  })
})

describe('hexEncode / hexDecode', () => {
  test('roundtrips bytes', () => {
    const bytes = new Uint8Array([0, 1, 127, 255])
    const hex = hexEncode(bytes)
    const decoded = hexDecode(hex)
    expect(decoded).toEqual(bytes)
  })

  test('encodes as lowercase hex', () => {
    const bytes = new Uint8Array([255, 0, 171])
    expect(hexEncode(bytes)).toBe('ff00ab')
  })

  test('handles empty array', () => {
    expect(hexEncode(new Uint8Array([]))).toBe('')
    expect(hexDecode('')).toEqual(new Uint8Array([]))
  })

  test('pads single-digit hex values with zero', () => {
    const bytes = new Uint8Array([1, 2, 3])
    expect(hexEncode(bytes)).toBe('010203')
  })
})
