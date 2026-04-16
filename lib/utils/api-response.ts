import { NextResponse } from 'next/server'

type JsonValue = string | number | boolean | null | JsonValue[] | { [key: string]: JsonValue }

interface ApiOptions {
  status?: number
  /** Cache duration in seconds (default: no cache) */
  cache?: number
  /** Stale-while-revalidate duration in seconds */
  swr?: number
}

/** Standard JSON success response with optional caching */
export function apiSuccess(data: JsonValue, opts: ApiOptions = {}) {
  const { status = 200, cache, swr } = opts
  const headers: Record<string, string> = {}

  if (cache) {
    headers['Cache-Control'] = `public, s-maxage=${cache}${swr ? `, stale-while-revalidate=${swr}` : ''}`
  }

  return NextResponse.json(data, { status, headers })
}

/** Standard JSON error response */
export function apiError(message: string, status = 500) {
  return NextResponse.json({ error: message }, { status })
}

/** 404 not found response */
export function apiNotFound(message = 'Not found') {
  return apiError(message, 404)
}

/** 429 rate limit response */
export function apiRateLimited(retryAfterSec = 60) {
  return NextResponse.json(
    { error: 'Too many requests' },
    {
      status: 429,
      headers: { 'Retry-After': String(retryAfterSec) },
    }
  )
}
