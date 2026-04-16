import { NextRequest, NextResponse } from 'next/server'
import { checkRateLimit, getRateLimitKey } from './rate-limit'
import { withApiVersionHeaders, getApiVersion } from './api-version'
import { createLogger } from './logger'

const log = createLogger('api-middleware')

interface ApiMiddlewareOptions {
  /** Rate limit: max requests per window */
  rateLimit?: number
  /** Rate limit window in ms (default: 60_000) */
  rateLimitWindowMs?: number
  /** Rate limit key prefix */
  rateLimitPrefix?: string
  /** Required HTTP methods */
  allowedMethods?: string[]
  /** Add CORS headers */
  cors?: boolean
  /** CORS allowed origin (default: '*' when cors=true) */
  corsOrigin?: string
  /** Cache-Control header */
  cacheControl?: string
  /** Skip adding security headers (advanced, default: false) */
  skipSecurityHeaders?: boolean
}

const SECURITY_HEADERS: Record<string, string> = {
  'X-Content-Type-Options': 'nosniff',
  'Referrer-Policy': 'strict-origin-when-cross-origin',
  'X-Frame-Options': 'DENY',
}

type ApiHandler = (
  request: NextRequest,
  context?: { params?: Record<string, string> }
) => Promise<NextResponse | Response>

/**
 * Wrap an API route handler with common middleware:
 * - Rate limiting
 * - Method checking
 * - CORS headers
 * - API version headers
 * - Error handling
 */
export function withApiMiddleware(
  handler: ApiHandler,
  options: ApiMiddlewareOptions = {}
): ApiHandler {
  return async (request, context) => {
    const {
      rateLimit = 100,
      rateLimitWindowMs = 60_000,
      rateLimitPrefix = 'api',
      allowedMethods,
      cors = false,
      corsOrigin = '*',
      cacheControl,
      skipSecurityHeaders = false,
    } = options

    // Method check
    if (allowedMethods && !allowedMethods.includes(request.method)) {
      return NextResponse.json(
        { error: `Método ${request.method} não permitido.` },
        {
          status: 405,
          headers: {
            Allow: allowedMethods.join(', '),
            'X-Content-Type-Options': 'nosniff',
          },
        }
      )
    }

    // Rate limiting
    const rateLimitKey = getRateLimitKey(request, rateLimitPrefix)
    const { allowed, remaining, resetAt } = checkRateLimit(rateLimitKey, {
      limit: rateLimit,
      windowMs: rateLimitWindowMs,
    })

    if (!allowed) {
      return NextResponse.json(
        { error: 'Muitas requisições. Tente novamente em breve.' },
        {
          status: 429,
          headers: {
            'Retry-After': String(Math.ceil((resetAt - Date.now()) / 1000)),
            'X-RateLimit-Limit': String(rateLimit),
            'X-RateLimit-Remaining': '0',
            'X-RateLimit-Reset': String(Math.ceil(resetAt / 1000)),
          },
        }
      )
    }

    try {
      const response = await handler(request, context)

      // Preserve the original body stream — don't re-parse (avoids consumed-stream bugs
      // and works with non-JSON responses).
      const res =
        response instanceof NextResponse
          ? response
          : new NextResponse(response.body, {
              status: response.status,
              statusText: response.statusText,
              headers: response.headers,
            })

      // Rate limit headers
      res.headers.set('X-RateLimit-Limit', String(rateLimit))
      res.headers.set('X-RateLimit-Remaining', String(remaining))
      res.headers.set('X-RateLimit-Reset', String(Math.ceil(resetAt / 1000)))

      if (cors) {
        res.headers.set('Access-Control-Allow-Origin', corsOrigin)
        res.headers.set('Access-Control-Allow-Methods', (allowedMethods ?? ['GET', 'POST', 'OPTIONS']).join(', '))
        res.headers.set('Access-Control-Allow-Headers', 'Content-Type, X-API-Version, Authorization')
        res.headers.set('Access-Control-Max-Age', '86400')
        // Hint caches to vary on origin when CORS is restricted.
        if (corsOrigin !== '*') {
          const existingVary = res.headers.get('Vary') ?? ''
          res.headers.set('Vary', existingVary ? `${existingVary}, Origin` : 'Origin')
        }
      }

      if (cacheControl && !res.headers.has('Cache-Control')) {
        res.headers.set('Cache-Control', cacheControl)
      }

      if (!skipSecurityHeaders) {
        for (const [k, v] of Object.entries(SECURITY_HEADERS)) {
          if (!res.headers.has(k)) res.headers.set(k, v)
        }
      }

      const version = getApiVersion(request)
      withApiVersionHeaders(res, version)

      return res
    } catch (err) {
      // Log full detail server-side, return generic message to client.
      log.error('handler threw', {
        err: err instanceof Error ? err.message : String(err),
        path: request.nextUrl.pathname,
      })
      return NextResponse.json(
        { error: { code: 'INTERNAL_ERROR', message: 'Erro interno do servidor.' } },
        { status: 500, headers: { 'X-Content-Type-Options': 'nosniff' } }
      )
    }
  }
}
