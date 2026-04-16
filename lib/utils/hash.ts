/**
 * Simple string hashing for cache keys.
 * Uses DJB2 algorithm — fast and good distribution for short strings.
 * NOT cryptographic — suitable only for cache keys and hash maps.
 */
export function hashString(str: string): string {
  let hash = 5381
  for (let i = 0; i < str.length; i++) {
    hash = ((hash << 5) + hash + str.charCodeAt(i)) | 0
  }
  return (hash >>> 0).toString(36)
}

/** Create a cache key from multiple parts. */
export function cacheKey(...parts: (string | number | boolean | null | undefined)[]): string {
  const joined = parts.map((p) => String(p ?? '')).join(':')
  return hashString(joined)
}
