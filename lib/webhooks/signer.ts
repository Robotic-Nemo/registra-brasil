/**
 * Webhook payload signing using HMAC-SHA256.
 *
 * Generates and verifies signatures so webhook consumers can trust payloads.
 */

/**
 * Sign a webhook payload with HMAC-SHA256.
 *
 * @param payload - The raw JSON string to sign
 * @param secret - The webhook secret
 * @returns The hex-encoded signature prefixed with `sha256=`
 */
export async function signWebhookPayload(payload: string, secret: string): Promise<string> {
  const encoder = new TextEncoder()
  const key = await crypto.subtle.importKey(
    'raw',
    encoder.encode(secret),
    { name: 'HMAC', hash: 'SHA-256' },
    false,
    ['sign']
  )

  const signature = await crypto.subtle.sign('HMAC', key, encoder.encode(payload))
  const hex = Array.from(new Uint8Array(signature))
    .map(b => b.toString(16).padStart(2, '0'))
    .join('')

  return `sha256=${hex}`
}

/**
 * Verify a webhook signature against the expected signature.
 * Uses constant-time comparison to prevent timing attacks.
 */
export async function verifyWebhookSignature(
  payload: string,
  signature: string,
  secret: string
): Promise<boolean> {
  const expected = await signWebhookPayload(payload, secret)

  // Constant-time comparison
  if (expected.length !== signature.length) return false

  let result = 0
  for (let i = 0; i < expected.length; i++) {
    result |= expected.charCodeAt(i) ^ signature.charCodeAt(i)
  }
  return result === 0
}

/**
 * Generate a random webhook secret.
 */
export function generateWebhookSecret(): string {
  const bytes = new Uint8Array(32)
  crypto.getRandomValues(bytes)
  return Array.from(bytes)
    .map(b => b.toString(16).padStart(2, '0'))
    .join('')
}
