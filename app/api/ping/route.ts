import { NextResponse } from 'next/server'

export const runtime = 'edge'

/**
 * GET /api/ping — Ultra-simple health check returning "pong"
 */
export function GET() {
  return NextResponse.json({
    status: 'ok',
    message: 'pong',
    timestamp: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'no-store',
    },
  })
}
