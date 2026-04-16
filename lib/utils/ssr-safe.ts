/**
 * SSR-safe utilities for code that runs in both server and client
 */

/** Check if running in a browser environment */
export function isBrowser(): boolean {
  return typeof window !== 'undefined'
}

/** Check if running on the server */
export function isServer(): boolean {
  return typeof window === 'undefined'
}

/** Safe window access — returns undefined on server */
export function safeWindow(): Window | undefined {
  return isBrowser() ? window : undefined
}

/** Safe document access */
export function safeDocument(): Document | undefined {
  return isBrowser() ? document : undefined
}

/** Safe localStorage access */
export function safeLocalStorage(): Storage | undefined {
  try {
    return isBrowser() ? window.localStorage : undefined
  } catch {
    return undefined
  }
}

/** Safe sessionStorage access */
export function safeSessionStorage(): Storage | undefined {
  try {
    return isBrowser() ? window.sessionStorage : undefined
  } catch {
    return undefined
  }
}

/** Get a value from localStorage, or return default on server/error */
export function getStorageItem<T>(key: string, defaultValue: T): T {
  const storage = safeLocalStorage()
  if (!storage) return defaultValue

  try {
    const item = storage.getItem(key)
    return item ? (JSON.parse(item) as T) : defaultValue
  } catch {
    return defaultValue
  }
}

/** Set a value in localStorage, silently failing on server/error */
export function setStorageItem(key: string, value: unknown): void {
  const storage = safeLocalStorage()
  if (!storage) return

  try {
    storage.setItem(key, JSON.stringify(value))
  } catch {
    // Quota exceeded or other storage error
  }
}

/** Get current URL path (SSR-safe) */
export function getCurrentPath(): string {
  return isBrowser() ? window.location.pathname : ''
}
