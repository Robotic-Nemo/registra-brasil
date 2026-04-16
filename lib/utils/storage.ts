/**
 * Safe localStorage / sessionStorage wrappers.
 * Handles SSR, private browsing quota errors, and JSON parse failures.
 */

function getStorage(type: 'local' | 'session'): Storage | null {
  if (typeof window === 'undefined') return null
  try {
    return type === 'local' ? window.localStorage : window.sessionStorage
  } catch {
    return null
  }
}

/**
 * Reads a JSON-serialized value from storage.
 * Returns `defaultValue` if the key is missing, the JSON is invalid, or storage is unavailable.
 */
export function getItem<T>(key: string, defaultValue: T, type: 'local' | 'session' = 'local'): T {
  const storage = getStorage(type)
  if (!storage) return defaultValue
  try {
    const raw = storage.getItem(key)
    if (raw === null) return defaultValue
    return JSON.parse(raw) as T
  } catch {
    return defaultValue
  }
}

/**
 * Writes a JSON-serialized value to storage.
 * Silently fails when storage is unavailable or the quota is exceeded.
 */
export function setItem<T>(key: string, value: T, type: 'local' | 'session' = 'local'): void {
  const storage = getStorage(type)
  if (!storage) return
  try {
    storage.setItem(key, JSON.stringify(value))
  } catch {
    // Quota exceeded or storage unavailable — silently ignore
  }
}

/**
 * Removes a key from storage.
 */
export function removeItem(key: string, type: 'local' | 'session' = 'local'): void {
  const storage = getStorage(type)
  if (!storage) return
  try {
    storage.removeItem(key)
  } catch {
    // Silently ignore
  }
}
