import { describe, test, expect } from 'vitest'
import { SECURITY_HEADERS, CACHE_HEADERS, applySecurityHeaders, createCSP, corsHeaders } from '../headers'

describe('SECURITY_HEADERS', () => {
  test('includes X-Frame-Options DENY', () => {
    expect(SECURITY_HEADERS['X-Frame-Options']).toBe('DENY')
  })
  test('includes X-Content-Type-Options nosniff', () => {
    expect(SECURITY_HEADERS['X-Content-Type-Options']).toBe('nosniff')
  })
  test('includes HSTS', () => {
    expect(SECURITY_HEADERS['Strict-Transport-Security']).toContain('max-age')
  })
})

describe('CACHE_HEADERS', () => {
  test('immutable uses long max-age', () => {
    expect(CACHE_HEADERS.immutable).toContain('immutable')
  })
  test('noCache includes no-store', () => {
    expect(CACHE_HEADERS.noCache).toContain('no-store')
  })
})

describe('applySecurityHeaders', () => {
  test('applies all security headers', () => {
    const res = new Response(null)
    applySecurityHeaders(res)
    expect(res.headers.get('X-Frame-Options')).toBe('DENY')
    expect(res.headers.get('X-Content-Type-Options')).toBe('nosniff')
  })
})

describe('createCSP', () => {
  test('includes self default-src', () => {
    expect(createCSP()).toContain("default-src 'self'")
  })
  test('uses unsafe-inline when no nonce', () => {
    expect(createCSP()).toContain("'unsafe-inline'")
  })
  test('uses nonce when provided', () => {
    const csp = createCSP('abc123')
    expect(csp).toContain("'nonce-abc123'")
    expect(csp).toContain("'strict-dynamic'")
  })
  test('includes frame-ancestors none', () => {
    expect(createCSP()).toContain("frame-ancestors 'none'")
  })
})

describe('corsHeaders', () => {
  test('wildcard origin by default', () => {
    expect(corsHeaders()['Access-Control-Allow-Origin']).toBe('*')
  })
  test('uses provided origin', () => {
    expect(corsHeaders('https://example.com')['Access-Control-Allow-Origin']).toBe('https://example.com')
  })
  test('includes standard methods', () => {
    expect(corsHeaders()['Access-Control-Allow-Methods']).toContain('GET')
    expect(corsHeaders()['Access-Control-Allow-Methods']).toContain('POST')
  })
})
