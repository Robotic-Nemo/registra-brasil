import { NextRequest, NextResponse } from 'next/server'
import { checkRateLimit, getRateLimitKey } from './rate-limit'
import { withApiVersionHeaders, getApiVersion } from './api-version'

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
  /** Cache-Control header */
  cacheControl?: string
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
      cacheControl,
    } = options

    // Method check
    if (allowedMethods && !allowedMethods.includes(request.method)) {
      return NextResponse.json(
        { error: `Método ${request.method} não permitido.` },
        { status: 405, headers: { Allow: allowedMethods.join(', ') } }
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

      // Cast to NextResponse for header manipulation
      const res = response instanceof NextResponse ? response : NextResponse.json(await response.json(), { status: response.status })

      // Add standard headers
      res.headers.set('X-RateLimit-Limit', String(rateLimit))
      res.headers.set('X-RateLimit-Remaining', String(remaining))

      if (cors) {
        res.headers.set('Access-Control-Allow-Origin', '*')
        res.headers.set('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        res.headers.set('Access-Control-Allow-Headers', 'Content-Type, X-API-Version')
      }

      if (cacheControl) {
        res.headers.set('Cache-Control', cacheControl)
      }

      const version = getApiVersion(request)
      withApiVersionHeaders(res, version)

      return res
    } catch (err) {
      console.error('[API Error]', err)
      return NextResponse.json(
        { error: 'Erro interno do servidor.' },
        { status: 500 }
      )
    }
  }
}
