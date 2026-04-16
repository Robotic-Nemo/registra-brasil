/**
 * Encoding/decoding utilities
 */

/** Base64 encode (works in both Node.js and Edge) */
export function base64Encode(str: string): string {
  if (typeof Buffer !== 'undefined') {
    return Buffer.from(str).toString('base64')
  }
  return btoa(unescape(encodeURIComponent(str)))
}

/** Base64 decode */
export function base64Decode(str: string): string {
  if (typeof Buffer !== 'undefined') {
    return Buffer.from(str, 'base64').toString('utf-8')
  }
  return decodeURIComponent(escape(atob(str)))
}

/** URL-safe base64 encode */
export function base64UrlEncode(str: string): string {
  return base64Encode(str).replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '')
}

/** URL-safe base64 decode */
export function base64UrlDecode(str: string): string {
  let padded = str.replace(/-/g, '+').replace(/_/g, '/')
  while (padded.length % 4) padded += '='
  return base64Decode(padded)
}

/** Hex encode a Uint8Array */
export function hexEncode(bytes: Uint8Array): string {
  return Array.from(bytes)
    .map(b => b.toString(16).padStart(2, '0'))
    .join('')
}

/** Hex decode to Uint8Array. Throws on invalid input. */
export function hexDecode(hex: string): Uint8Array {
  if (typeof hex !== 'string' || hex.length % 2 !== 0 || !/^[0-9a-fA-F]*$/.test(hex)) {
    throw new Error('Invalid hex string')
  }
  const bytes = new Uint8Array(hex.length / 2)
  for (let i = 0; i < hex.length; i += 2) {
    bytes[i / 2] = parseInt(hex.slice(i, i + 2), 16)
  }
  return bytes
}
