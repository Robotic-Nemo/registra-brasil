interface CacheEntry<T> {
  value: T
  expiresAt: number
}

/**
 * Simple in-memory cache with TTL (time-to-live).
 * Good for server-side caching of API responses.
 */
export class MemoryCache<T> {
  private store = new Map<string, CacheEntry<T>>()
  private readonly defaultTtlMs: number
  private readonly maxEntries: number
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  private pending = new Map<string, Promise<any>>()

  constructor(defaultTtlSec = 300, maxEntries = 1000) {
    this.defaultTtlMs = defaultTtlSec * 1000
    this.maxEntries = maxEntries
  }

  get(key: string): T | undefined {
    const entry = this.store.get(key)
    if (!entry) return undefined
    if (Date.now() > entry.expiresAt) {
      this.store.delete(key)
      return undefined
    }
    return entry.value
  }

  set(key: string, value: T, ttlSec?: number): void {
    const ttlMs = ttlSec ? ttlSec * 1000 : this.defaultTtlMs
    // Evict oldest entry when at capacity (and key is not already present)
    if (!this.store.has(key) && this.store.size >= this.maxEntries) {
      const oldestKey = this.store.keys().next().value
      if (oldestKey !== undefined) this.store.delete(oldestKey)
    }
    this.store.set(key, { value, expiresAt: Date.now() + ttlMs })
  }

  has(key: string): boolean {
    return this.get(key) !== undefined
  }

  delete(key: string): void {
    this.store.delete(key)
  }

  clear(): void {
    this.store.clear()
  }

  /** Get or compute a value, caching the result. Deduplicates concurrent calls for the same key. */
  async getOrSet<U extends T>(key: string, fn: () => Promise<U>, ttlSec?: number): Promise<U> {
    const cached = this.get(key)
    if (cached !== undefined) return cached as U

    const existing = this.pending.get(key)
    if (existing) return existing as Promise<U>

    const promise = fn().then(value => {
      this.set(key, value, ttlSec)
      this.pending.delete(key)
      return value
    }).catch(err => {
      this.pending.delete(key)
      throw err
    })

    this.pending.set(key, promise)
    return promise
  }

  /** Remove expired entries (call periodically in long-running processes) */
  prune(): number {
    const now = Date.now()
    let removed = 0
    for (const [key, entry] of this.store) {
      if (now > entry.expiresAt) {
        this.store.delete(key)
        removed++
      }
    }
    return removed
  }

  get size(): number {
    this.prune()
    return this.store.size
  }

  /** Return all non-expired keys */
  keys(): string[] {
    this.prune()
    return Array.from(this.store.keys())
  }
}

/** Global cache instance with 5-minute default TTL */
export const globalCache = new MemoryCache(300)
