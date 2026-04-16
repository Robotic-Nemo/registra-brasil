/**
 * Memoize a function with an LRU cache
 */
export function memoize<TArgs extends unknown[], TResult>(
  fn: (...args: TArgs) => TResult,
  options: { maxSize?: number; keyFn?: (...args: TArgs) => string } = {}
): (...args: TArgs) => TResult {
  const { maxSize = 100, keyFn } = options
  const cache = new Map<string, { value: TResult; timestamp: number }>()

  return (...args: TArgs): TResult => {
    const key = keyFn ? keyFn(...args) : JSON.stringify(args)
    const cached = cache.get(key)

    if (cached) {
      // Move to end (most recently used)
      cache.delete(key)
      cache.set(key, cached)
      return cached.value
    }

    const result = fn(...args)

    // Evict oldest if at capacity
    if (cache.size >= maxSize) {
      const oldestKey = cache.keys().next().value
      if (oldestKey !== undefined) {
        cache.delete(oldestKey)
      }
    }

    cache.set(key, { value: result, timestamp: Date.now() })
    return result
  }
}

/**
 * Memoize an async function
 */
export function memoizeAsync<TArgs extends unknown[], TResult>(
  fn: (...args: TArgs) => Promise<TResult>,
  options: { maxSize?: number; ttlMs?: number; keyFn?: (...args: TArgs) => string } = {}
): (...args: TArgs) => Promise<TResult> {
  const { maxSize = 100, ttlMs = 0, keyFn } = options
  const cache = new Map<string, { value: TResult; timestamp: number }>()
  const pending = new Map<string, Promise<TResult>>()

  return async (...args: TArgs): Promise<TResult> => {
    const key = keyFn ? keyFn(...args) : JSON.stringify(args)

    // Check cache
    const cached = cache.get(key)
    if (cached) {
      if (ttlMs === 0 || Date.now() - cached.timestamp < ttlMs) {
        return cached.value
      }
      cache.delete(key)
    }

    // Deduplicate concurrent calls
    const pendingCall = pending.get(key)
    if (pendingCall) return pendingCall

    const promise = fn(...args).then(result => {
      if (cache.size >= maxSize) {
        const oldestKey = cache.keys().next().value
        if (oldestKey !== undefined) cache.delete(oldestKey)
      }
      cache.set(key, { value: result, timestamp: Date.now() })
      pending.delete(key)
      return result
    }).catch(err => {
      pending.delete(key)
      throw err
    })

    pending.set(key, promise)
    return promise
  }
}
