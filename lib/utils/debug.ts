/**
 * Debug utilities — only active in development
 */

const IS_DEV = process.env.NODE_ENV === 'development'

/**
 * Log with prefix — only in development
 */
export function debugLog(prefix: string, ...args: unknown[]): void {
  if (IS_DEV) {
    console.log(`[${prefix}]`, ...args)
  }
}

/**
 * Time a function execution — only in development
 */
export async function debugTime<T>(label: string, fn: () => Promise<T>): Promise<T> {
  if (!IS_DEV) return fn()

  const start = performance.now()
  try {
    const result = await fn()
    const elapsed = performance.now() - start
    console.log(`[⏱ ${label}] ${elapsed.toFixed(2)}ms`)
    return result
  } catch (error) {
    const elapsed = performance.now() - start
    console.error(`[⏱ ${label}] Failed after ${elapsed.toFixed(2)}ms`, error)
    throw error
  }
}

/**
 * Assert a condition — throws in development, no-op in production
 */
export function debugAssert(condition: boolean, message: string): void {
  if (IS_DEV && !condition) {
    console.error(`[Assert] ${message}`)
    throw new Error(`Assertion failed: ${message}`)
  }
}

/**
 * Log a render event (development only).
 * NOTE: This is NOT a React hook. Use inside a component for per-render logging.
 * For a persistent render count, use useRef inside your component.
 */
export function debugRender(componentName: string): void {
  if (!IS_DEV) return
  console.log(`[Render] ${componentName}`)
}

/**
 * Pretty print JSON in development
 */
export function debugJson(label: string, data: unknown): void {
  if (IS_DEV) {
    console.log(`[${label}]`, JSON.stringify(data, null, 2))
  }
}
