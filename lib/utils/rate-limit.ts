/**
 * Simple in-memory rate limiter using a sliding window counter.
 * Not suitable for multi-instance deployments — use Redis-based limiter if needed.
 *
 * EDGE RUNTIME NOTE: On Vercel Edge / Cloudflare Workers each isolate gets its
 * own ephemeral memory that is discarded when the isolate is evicted. As a result
 * the in-memory store does not persist across requests and rate limiting is
 * best-effort only on edge runtimes. Use a Redis / Upstash backend for strict
 * enforcement in edge environments.
 */

interface RateLimitEntry {
  count: number
  resetAt: number
}

const store = new Map<string, RateLimitEntry>()

/** Maximum number of entries kept in the store at any time. */
const MAX_STORE_SIZE = 10_000

// Clean up expired entries periodically (every 60s) and enforce max size.
let lastCleanup = Date.now()
function cleanup() {
  const now = Date.now()

  // Always enforce max store size — prune aggressively if needed.
  if (store.size >= MAX_STORE_SIZE) {
    // Delete all expired entries first.
    for (const [key, entry] of store) {
      if (entry.resetAt < now) store.delete(key)
    }
    // If still too large, evict the oldest half (Map preserves insertion order).
    if (store.size >= MAX_STORE_SIZE) {
      const evictCount = Math.floor(store.size / 2)
      let evicted = 0
      for (const key of store.keys()) {
        if (evicted >= evictCount) break
        store.delete(key)
        evicted++
      }
    }
    lastCleanup = now
    return
  }

  // Periodic cleanup of expired entries (every 60s).
  if (now - lastCleanup < 60_000) return
  lastCleanup = now
  for (const [key, entry] of store) {
    if (entry.resetAt < now) store.delete(key)
  }
}

interface RateLimitConfig {
  /** Maximum requests per window */
  limit: number
  /** Window size in milliseconds */
  windowMs: number
}

interface RateLimitResult {
  allowed: boolean
  remaining: number
  resetAt: number
}

export function checkRateLimit(
  key: string,
  config: RateLimitConfig
): RateLimitResult {
  cleanup()

  const now = Date.now()
  const entry = store.get(key)

  if (!entry || entry.resetAt < now) {
    store.set(key, { count: 1, resetAt: now + config.windowMs })
    return { allowed: true, remaining: config.limit - 1, resetAt: now + config.windowMs }
  }

  entry.count++

  if (entry.count > config.limit) {
    return { allowed: false, remaining: 0, resetAt: entry.resetAt }
  }

  return { allowed: true, remaining: config.limit - entry.count, resetAt: entry.resetAt }
}

/** Helper to extract a rate-limit key from a Request (IP-based) */
export function getRateLimitKey(request: Request, prefix: string): string {
  const forwarded = request.headers.get('x-forwarded-for')
  const ip = forwarded?.split(',')[0]?.trim() ?? 'unknown'
  return `${prefix}:${ip}`
}
