import { NextRequest, NextResponse } from 'next/server'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '@/lib/auth/session'
import { generateNonce } from '@/lib/utils/nonce'

export async function middleware(req: NextRequest) {
  const { pathname } = req.nextUrl

  if (pathname.startsWith('/admin')) {
    // Always allow the login page through
    if (pathname === '/admin/login') return NextResponse.next()

    const adminSecret = process.env.ADMIN_SECRET

    // Fail CLOSED: no secret = block all admin access (not open)
    if (!adminSecret) {
      const loginUrl = req.nextUrl.clone()
      loginUrl.pathname = '/admin/login'
      return NextResponse.redirect(loginUrl)
    }

    const cookie = req.cookies.get(SESSION_COOKIE)?.value
    if (!cookie) {
      const loginUrl = req.nextUrl.clone()
      loginUrl.pathname = '/admin/login'
      return NextResponse.redirect(loginUrl)
    }

    // Verify cookie against HMAC-derived token (timing-safe)
    const expectedToken = await deriveSessionToken(adminSecret)
    if (!timingSafeEqual(cookie, expectedToken)) {
      const loginUrl = req.nextUrl.clone()
      loginUrl.pathname = '/admin/login'
      return NextResponse.redirect(loginUrl)
    }
  }

  const nonce = generateNonce()
  const response = NextResponse.next({
    headers: { 'X-CSP-Nonce': nonce },
  })

  // Request tracing
  response.headers.set('X-Request-Id', crypto.randomUUID())

  // Per-request headers (not duplicating next.config.ts security headers)
  response.headers.set('Vary', 'Accept-Encoding')
  response.headers.set('Content-Language', 'pt-BR')

  return response
}

export const config = {
  matcher: [
    '/admin/:path*',
    /*
     * Match page routes that serve HTML, skipping:
     * - API routes (/api/*)
     * - Next.js internals (_next/static, _next/image)
     * - Static assets and feeds (favicon, XML feeds, sitemap, robots, manifest)
     * - Image files (.png, .jpg, .svg)
     * - OG image routes
     *
     * Security headers on API responses add serverless cost per call with
     * minimal security benefit — CSP/X-Frame-Options matter for HTML pages.
     */
    '/((?!api|_next/static|_next/image|favicon\\.ico|feed\\.xml|atom\\.xml|sitemap\\.xml|robots\\.txt|manifest\\.webmanifest|opengraph-image|.*\\.png$|.*\\.jpg$|.*\\.svg$).*)',
  ],
}
