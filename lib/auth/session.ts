/**
 * lib/auth/session.ts
 * HMAC-based admin session helpers.
 * Cookie stores a derived token, never the raw ADMIN_SECRET.
 */

const SESSION_COOKIE = 'admin_session'
const HMAC_MESSAGE = 'registra-brasil-admin-v1'

/** Derive a stable session token from the secret using HMAC-SHA256 */
export async function deriveSessionToken(secret: string): Promise<string> {
  const enc = new TextEncoder()
  const key = await crypto.subtle.importKey(
    'raw',
    enc.encode(secret),
    { name: 'HMAC', hash: 'SHA-256' },
    false,
    ['sign'],
  )
  const sig = await crypto.subtle.sign('HMAC', key, enc.encode(HMAC_MESSAGE))
  // Use Uint8Array → hex manually — Buffer is not available in the Edge runtime
  return Array.from(new Uint8Array(sig))
    .map((b) => b.toString(16).padStart(2, '0'))
    .join('')
}

/** Timing-safe comparison to prevent timing attacks */
export function timingSafeEqual(a: string, b: string): boolean {
  const maxLen = Math.max(a.length, b.length)
  const paddedA = a.padEnd(maxLen, '\0')
  const paddedB = b.padEnd(maxLen, '\0')
  let result = a.length ^ b.length // Will be non-zero if lengths differ
  for (let i = 0; i < maxLen; i++) {
    result |= paddedA.charCodeAt(i) ^ paddedB.charCodeAt(i)
  }
  return result === 0
}

export { SESSION_COOKIE }
