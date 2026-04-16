/**
 * Generates a cryptographically random nonce string.
 * Suitable for use in Content-Security-Policy headers.
 */
export function generateNonce(): string {
  return crypto.randomUUID().replace(/-/g, '')
}
