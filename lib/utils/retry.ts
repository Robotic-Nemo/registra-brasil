/**
 * Retry configuration options.
 */
interface RetryOptions {
  /** Maximum number of attempts (default: 3) */
  attempts?: number
  /** Base delay in milliseconds (default: 500) */
  baseDelayMs?: number
  /** Maximum delay in milliseconds (default: 10000) */
  maxDelayMs?: number
  /** Jitter factor 0-1 to randomize delays (default: 0.1) */
  jitter?: number
  /** Optional callback invoked on each failed attempt */
  onRetry?: (error: unknown, attempt: number) => void
  /** Optional predicate to decide if an error is retryable */
  shouldRetry?: (error: unknown) => boolean
}

/**
 * Retry an async function with exponential backoff and optional jitter.
 *
 * This is a more configurable version of the basic `retry` in error.ts.
 *
 * @example
 * ```ts
 * const data = await retryWithBackoff(() => fetch('/api/data'), {
 *   attempts: 5,
 *   baseDelayMs: 1000,
 *   onRetry: (err, attempt) => console.warn(`Attempt ${attempt} failed:`, err),
 * })
 * ```
 */
export async function retryWithBackoff<T>(
  fn: () => Promise<T>,
  options: RetryOptions = {}
): Promise<T> {
  const {
    attempts = 3,
    baseDelayMs = 500,
    maxDelayMs = 10_000,
    jitter = 0.1,
    onRetry,
    shouldRetry,
  } = options

  for (let attempt = 1; attempt <= attempts; attempt++) {
    try {
      return await fn()
    } catch (error) {
      if (attempt === attempts) throw error
      if (shouldRetry && !shouldRetry(error)) throw error

      onRetry?.(error, attempt)

      const exponentialDelay = baseDelayMs * 2 ** (attempt - 1)
      const jitterAmount = exponentialDelay * jitter * Math.random()
      const delay = Math.min(exponentialDelay + jitterAmount, maxDelayMs)

      await new Promise((resolve) => setTimeout(resolve, delay))
    }
  }

  // Unreachable, but TypeScript needs this
  throw new Error('Retry exhausted')
}
