import { NextResponse } from 'next/server'

type JsonValue = string | number | boolean | null | JsonValue[] | { [key: string]: JsonValue }

interface ApiOptions {
  status?: number
  /** Cache duration in seconds (default: no cache) */
  cache?: number
  /** Stale-while-revalidate duration in seconds */
  swr?: number
  /** Additional headers to merge */
  headers?: Record<string, string>
}

/** Standard JSON success response with optional caching */
export function apiSuccess(data: JsonValue, opts: ApiOptions = {}) {
  const { status = 200, cache, swr, headers: extra } = opts
  const headers: Record<string, string> = {}

  if (cache) {
    headers['Cache-Control'] = `public, s-maxage=${cache}${swr ? `, stale-while-revalidate=${swr}` : ''}`
    headers['Vary'] = 'Accept-Encoding'
  }

  if (extra) Object.assign(headers, extra)

  return NextResponse.json(data, { status, headers })
}

/** Standard JSON error response. `code` is optional machine-readable identifier. */
export function apiError(message: string, status = 500, code?: string) {
  const body = code ? { error: { code, message } } : { error: message }
  return NextResponse.json(body, {
    status,
    headers: {
      // Prevent MIME sniffing on error payloads.
      'X-Content-Type-Options': 'nosniff',
    },
  })
}

/** 400 Bad Request */
export function apiBadRequest(message = 'Bad request', code = 'BAD_REQUEST') {
  return apiError(message, 400, code)
}

/** 401 Unauthorized */
export function apiUnauthorized(message = 'Unauthorized') {
  return apiError(message, 401, 'UNAUTHORIZED')
}

/** 403 Forbidden */
export function apiForbidden(message = 'Forbidden') {
  return apiError(message, 403, 'FORBIDDEN')
}

/** 404 not found response */
export function apiNotFound(message = 'Not found') {
  return apiError(message, 404, 'NOT_FOUND')
}

/** 429 rate limit response */
export function apiRateLimited(retryAfterSec = 60) {
  return NextResponse.json(
    { error: { code: 'RATE_LIMITED', message: 'Too many requests' } },
    {
      status: 429,
      headers: { 'Retry-After': String(retryAfterSec), 'X-Content-Type-Options': 'nosniff' },
    }
  )
}

/** 500 Internal Server Error */
export function apiInternalError(message = 'Internal server error') {
  return apiError(message, 500, 'INTERNAL_ERROR')
}
