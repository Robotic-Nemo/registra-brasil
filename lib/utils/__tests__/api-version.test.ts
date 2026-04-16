import { describe, test, expect } from 'vitest'
import { NextResponse } from 'next/server'
import {
  CURRENT_API_VERSION,
  SUPPORTED_VERSIONS,
  getApiVersion,
  withApiVersionHeaders,
  apiDeprecated,
} from '../api-version'

describe('exports', () => {
  test('CURRENT_API_VERSION is set', () => {
    expect(CURRENT_API_VERSION).toBe('v1')
  })
  test('SUPPORTED_VERSIONS includes CURRENT_API_VERSION', () => {
    expect(SUPPORTED_VERSIONS).toContain(CURRENT_API_VERSION)
  })
})

describe('getApiVersion', () => {
  function mockReq(headers: Record<string, string> = {}, query = '') {
    const url = `https://ex.com/api${query ? `?${query}` : ''}`
    return {
      headers: { get: (k: string) => headers[k] ?? null },
      nextUrl: new URL(url),
    } as any
  }

  test('returns current when no header', () => {
    expect(getApiVersion(mockReq())).toBe('v1')
  })
  test('uses header version', () => {
    expect(getApiVersion(mockReq({ 'X-API-Version': 'v1' }))).toBe('v1')
  })
  test('falls back to current for unknown version', () => {
    expect(getApiVersion(mockReq({ 'X-API-Version': 'v99' }))).toBe('v1')
  })
  test('uses query param', () => {
    expect(getApiVersion(mockReq({}, 'api_version=v1'))).toBe('v1')
  })
})

describe('withApiVersionHeaders', () => {
  test('sets X-API-Version', () => {
    const r = NextResponse.json({})
    withApiVersionHeaders(r, 'v1')
    expect(r.headers.get('X-API-Version')).toBe('v1')
    expect(r.headers.get('X-API-Supported-Versions')).toContain('v1')
  })
})

describe('apiDeprecated', () => {
  test('status 410 with Sunset header', () => {
    const r = apiDeprecated('gone', '2026-01-01')
    expect(r.status).toBe(410)
    expect(r.headers.get('Sunset')).toBe('2026-01-01')
    expect(r.headers.get('Deprecation')).toBe('true')
  })
})
