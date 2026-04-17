import { NextResponse } from 'next/server'

export const runtime = 'edge'

/**
 * GET /api/ping — Ultra-simple health check returning "pong".
 * Intentionally unauthenticated, unrated-limited, cache-free for uptime monitors.
 */
export function GET() {
  return NextResponse.json({
    status: 'ok',
    message: 'pong',
    timestamp: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'no-store',
      'X-Content-Type-Options': 'nosniff',
    },
  })
}

export function HEAD() {
  return new NextResponse(null, {
    status: 200,
    headers: {
      'Cache-Control': 'no-store',
      'X-Content-Type-Options': 'nosniff',
    },
  })
}
