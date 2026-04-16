/**
 * SSRF (Server-Side Request Forgery) defense helpers.
 *
 * These functions block requests targeting private/loopback addresses and
 * non-HTTP protocols. They are a first line of defense — production systems
 * should ALSO re-resolve DNS at request time and re-validate, because an
 * attacker can control a public DNS entry that resolves to a private IP.
 */

const PRIVATE_IPV4_RANGES = [
  // RFC 1918 private
  /^10\./,
  /^172\.(1[6-9]|2\d|3[01])\./,
  /^192\.168\./,
  // Loopback
  /^127\./,
  // Link-local
  /^169\.254\./,
  // Unspecified / this-network
  /^0\./,
  // Carrier-grade NAT
  /^100\.(6[4-9]|[7-9]\d|1[01]\d|12[0-7])\./,
  // Reserved / benchmarking
  /^192\.0\.0\./,
  /^192\.0\.2\./,
  /^198\.1[89]\./,
  /^203\.0\.113\./,
  // Multicast / reserved
  /^(22[4-9]|23\d|24\d|25[0-5])\./,
] as const

const PRIVATE_IPV6_PREFIXES = [
  '::1', // loopback
  '::', // unspecified
  'fc', // unique local
  'fd', // unique local
  'fe80:', // link-local
  'ff', // multicast
] as const

const ALLOWED_PROTOCOLS = new Set(['http:', 'https:'])

export interface SafeUrlOptions {
  /** Extra hostnames to always reject. */
  blockedHosts?: string[]
  /** Maximum URL length in characters. Default 2048. */
  maxLength?: number
  /** Allow http:// in addition to https:// (default: true for registration, false for callbacks). */
  allowHttp?: boolean
}

export interface SafeUrlResult {
  ok: boolean
  reason?: string
  url?: URL
}

const DEFAULT_MAX_LENGTH = 2048

/** Returns true if the given hostname is an IP literal in a private/reserved range. */
export function isPrivateHost(hostname: string): boolean {
  const lower = hostname.toLowerCase()

  if (lower === 'localhost' || lower.endsWith('.localhost')) return true
  if (lower === 'metadata.google.internal') return true
  if (lower === 'metadata' || lower === 'instance-data' || lower.endsWith('.internal')) return true

  // IPv4 literal
  if (/^\d{1,3}(\.\d{1,3}){3}$/.test(lower)) {
    for (const re of PRIVATE_IPV4_RANGES) {
      if (re.test(lower)) return true
    }
    return false
  }

  // IPv6 literal (may be bracketed)
  const v6 = lower.replace(/^\[|\]$/g, '')
  if (v6.includes(':')) {
    for (const p of PRIVATE_IPV6_PREFIXES) {
      if (v6 === p || v6.startsWith(p)) return true
    }
  }

  return false
}

/**
 * Parse and validate a URL for server-side fetch.
 * Rejects non-http protocols and private/loopback hosts.
 */
export function safeParseUrl(input: string, opts: SafeUrlOptions = {}): SafeUrlResult {
  const { blockedHosts = [], maxLength = DEFAULT_MAX_LENGTH, allowHttp = true } = opts

  if (!input || typeof input !== 'string') {
    return { ok: false, reason: 'empty' }
  }
  if (input.length > maxLength) {
    return { ok: false, reason: 'too_long' }
  }

  let url: URL
  try {
    url = new URL(input)
  } catch {
    return { ok: false, reason: 'invalid_url' }
  }

  if (!ALLOWED_PROTOCOLS.has(url.protocol)) {
    return { ok: false, reason: 'bad_protocol' }
  }
  if (!allowHttp && url.protocol === 'http:') {
    return { ok: false, reason: 'http_not_allowed' }
  }

  // Reject credentials embedded in URL — common phishing/ssrf trick.
  if (url.username || url.password) {
    return { ok: false, reason: 'credentials_in_url' }
  }

  if (isPrivateHost(url.hostname)) {
    return { ok: false, reason: 'private_host' }
  }

  const lowered = url.hostname.toLowerCase()
  for (const blocked of blockedHosts) {
    if (lowered === blocked.toLowerCase()) {
      return { ok: false, reason: 'blocked_host' }
    }
  }

  return { ok: true, url }
}

/**
 * Fetch a URL with SSRF protection and a sensible timeout.
 * Throws a descriptive Error on validation failure.
 */
export async function safeFetch(
  input: string,
  init?: RequestInit & { timeoutMs?: number; options?: SafeUrlOptions }
): Promise<Response> {
  const { timeoutMs = 10_000, options, ...requestInit } = init ?? {}
  const parsed = safeParseUrl(input, options)
  if (!parsed.ok || !parsed.url) {
    throw new Error(`safeFetch: rejected URL (${parsed.reason ?? 'unknown'})`)
  }

  const controller = new AbortController()
  const timeout = setTimeout(() => controller.abort(), timeoutMs)
  try {
    return await fetch(parsed.url, {
      ...requestInit,
      signal: controller.signal,
      redirect: 'manual', // prevent cross-protocol / cross-origin redirects from bypassing our checks
    })
  } finally {
    clearTimeout(timeout)
  }
}
