import { describe, test, expect } from 'vitest'
import {
  apiSuccess,
  apiError,
  apiBadRequest,
  apiUnauthorized,
  apiForbidden,
  apiNotFound,
  apiRateLimited,
  apiInternalError,
} from '../api-response'

describe('apiSuccess', () => {
  test('defaults to status 200', async () => {
    const r = apiSuccess({ ok: true })
    expect(r.status).toBe(200)
    expect(await r.json()).toEqual({ ok: true })
  })
  test('honors custom status', () => {
    expect(apiSuccess({}, { status: 201 }).status).toBe(201)
  })
  test('adds cache header', () => {
    const r = apiSuccess({}, { cache: 60 })
    expect(r.headers.get('Cache-Control')).toContain('s-maxage=60')
  })
  test('adds stale-while-revalidate', () => {
    const r = apiSuccess({}, { cache: 60, swr: 30 })
    expect(r.headers.get('Cache-Control')).toContain('stale-while-revalidate=30')
  })
  test('merges custom headers', () => {
    const r = apiSuccess({}, { headers: { 'X-Custom': 'yes' } })
    expect(r.headers.get('X-Custom')).toBe('yes')
  })
})

describe('apiError', () => {
  test('default status 500', () => {
    expect(apiError('boom').status).toBe(500)
  })
  test('includes message when no code', async () => {
    const r = apiError('oops')
    expect(await r.json()).toEqual({ error: 'oops' })
  })
  test('includes code when provided', async () => {
    const r = apiError('oops', 400, 'BAD')
    expect(await r.json()).toEqual({ error: { code: 'BAD', message: 'oops' } })
  })
  test('sets X-Content-Type-Options', () => {
    expect(apiError('e').headers.get('X-Content-Type-Options')).toBe('nosniff')
  })
})

describe('apiBadRequest', () => {
  test('status 400', () => {
    expect(apiBadRequest().status).toBe(400)
  })
})

describe('apiUnauthorized', () => {
  test('status 401', () => {
    expect(apiUnauthorized().status).toBe(401)
  })
})

describe('apiForbidden', () => {
  test('status 403', () => {
    expect(apiForbidden().status).toBe(403)
  })
})

describe('apiNotFound', () => {
  test('status 404', () => {
    expect(apiNotFound().status).toBe(404)
  })
})

describe('apiRateLimited', () => {
  test('status 429', () => {
    expect(apiRateLimited().status).toBe(429)
  })
  test('includes Retry-After', () => {
    expect(apiRateLimited(120).headers.get('Retry-After')).toBe('120')
  })
})

describe('apiInternalError', () => {
  test('status 500', () => {
    expect(apiInternalError().status).toBe(500)
  })
})
