/**
 * Security headers helper for API routes and middleware
 */

export const SECURITY_HEADERS = {
  'X-Content-Type-Options': 'nosniff',
  'X-Frame-Options': 'DENY',
  'X-XSS-Protection': '1; mode=block',
  'Referrer-Policy': 'strict-origin-when-cross-origin',
  'Permissions-Policy': 'camera=(), microphone=(), geolocation=()',
  'X-DNS-Prefetch-Control': 'on',
  'Strict-Transport-Security': 'max-age=63072000; includeSubDomains; preload',
} as const

export const CACHE_HEADERS = {
  immutable: 'public, max-age=31536000, immutable',
  staticPage: 'public, s-maxage=3600, stale-while-revalidate=1800',
  dynamic: 'public, s-maxage=60, stale-while-revalidate=30',
  noCache: 'no-store, no-cache, must-revalidate',
  api: 'public, s-maxage=300, stale-while-revalidate=60',
} as const

/**
 * Apply security headers to a Response
 */
export function applySecurityHeaders(response: Response): void {
  for (const [key, value] of Object.entries(SECURITY_HEADERS)) {
    response.headers.set(key, value)
  }
}

/**
 * Create a Content-Security-Policy header value
 */
export function createCSP(nonce?: string): string {
  const scriptSrc = nonce
    ? `'self' 'nonce-${nonce}' 'strict-dynamic'`
    : `'self' 'unsafe-inline'`

  return [
    `default-src 'self'`,
    `script-src ${scriptSrc}`,
    `style-src 'self' 'unsafe-inline'`,
    `img-src 'self' data: https: blob:`,
    `font-src 'self' data:`,
    `connect-src 'self' https://*.supabase.co https://*.youtube.com`,
    `frame-src https://www.youtube.com https://www.youtube-nocookie.com`,
    `media-src 'self' https:`,
    `object-src 'none'`,
    `base-uri 'self'`,
    `form-action 'self'`,
    `frame-ancestors 'none'`,
    `upgrade-insecure-requests`,
  ].join('; ')
}

/**
 * CORS headers for API routes
 */
export function corsHeaders(origin?: string): Record<string, string> {
  return {
    'Access-Control-Allow-Origin': origin ?? '*',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-API-Version',
    'Access-Control-Max-Age': '86400',
  }
}
