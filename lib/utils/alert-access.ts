/**
 * HMAC-signed, time-bounded access tokens for the /meus-alertas portal.
 *
 * Not a full session: tokens just prove "this email was sent this link".
 * Every management action re-verifies the token server-side. Tokens
 * encode an expiration so stale email links stop working after 7 days.
 *
 * Format: base64url(HMAC-SHA256(email + "|" + expUnix)).slice(0, 40)
 *         + "." + expUnix (base36)
 */

const DEFAULT_TTL_MS = 7 * 24 * 60 * 60 * 1000 // 7 days

function secret(): string {
  return process.env.ALERTS_ACCESS_SECRET
    ?? process.env.NEWSLETTER_SECRET
    ?? process.env.REVALIDATE_SECRET
    ?? 'registra-brasil-alerts-access-fallback'
}

async function hmac(payload: string): Promise<string> {
  const enc = new TextEncoder()
  const key = await crypto.subtle.importKey(
    'raw',
    enc.encode(secret()),
    { name: 'HMAC', hash: 'SHA-256' },
    false,
    ['sign'],
  )
  const sig = await crypto.subtle.sign('HMAC', key, enc.encode(payload))
  return Array.from(new Uint8Array(sig)).map((b) => b.toString(16).padStart(2, '0')).join('')
}

export async function issueAlertAccessToken(email: string, ttlMs = DEFAULT_TTL_MS): Promise<string> {
  const norm = email.trim().toLowerCase()
  const exp = Math.floor((Date.now() + ttlMs) / 1000)
  const sig = await hmac(`${norm}|${exp}`)
  return `${sig.slice(0, 40)}.${exp.toString(36)}`
}

export async function verifyAlertAccessToken(email: string, token: string): Promise<boolean> {
  if (!token || typeof token !== 'string') return false
  const parts = token.split('.')
  if (parts.length !== 2) return false
  const [sig, expB36] = parts
  const exp = parseInt(expB36, 36)
  if (!Number.isFinite(exp)) return false
  if (Date.now() / 1000 > exp) return false
  const expected = await hmac(`${email.trim().toLowerCase()}|${exp}`)
  const expectedSig = expected.slice(0, 40)
  if (sig.length !== expectedSig.length) return false
  let diff = 0
  for (let i = 0; i < sig.length; i++) diff |= sig.charCodeAt(i) ^ expectedSig.charCodeAt(i)
  return diff === 0
}
