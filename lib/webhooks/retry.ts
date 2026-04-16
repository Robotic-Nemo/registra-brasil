/**
 * Webhook retry logic with exponential backoff and jitter.
 */

export interface RetryConfig {
  /** Maximum number of retry attempts (default: 5) */
  maxAttempts: number
  /** Base delay in milliseconds (default: 1000) */
  baseDelayMs: number
  /** Maximum delay in milliseconds (default: 3600000 = 1 hour) */
  maxDelayMs: number
  /** Jitter factor 0-1 (default: 0.1) */
  jitterFactor: number
}

export const DEFAULT_RETRY_CONFIG: RetryConfig = {
  maxAttempts: 5,
  baseDelayMs: 1_000,
  maxDelayMs: 3_600_000,
  jitterFactor: 0.1,
}

/**
 * Calculate the delay before the next retry attempt using exponential backoff.
 *
 * @param attempt - Current attempt number (0-indexed, so first retry is attempt 1)
 * @param config - Retry configuration
 * @returns Delay in milliseconds, or null if max attempts reached
 */
export function calculateRetryDelay(attempt: number, config: RetryConfig = DEFAULT_RETRY_CONFIG): number | null {
  if (attempt >= config.maxAttempts) return null

  // Exponential backoff: base * 2^attempt
  const exponentialDelay = config.baseDelayMs * Math.pow(2, attempt)
  const clampedDelay = Math.min(exponentialDelay, config.maxDelayMs)

  // Add jitter
  const jitter = clampedDelay * config.jitterFactor * Math.random()
  return Math.round(clampedDelay + jitter)
}

/**
 * Calculate the next retry timestamp.
 */
export function getNextRetryAt(attempt: number, config: RetryConfig = DEFAULT_RETRY_CONFIG): string | null {
  const delay = calculateRetryDelay(attempt, config)
  if (delay === null) return null
  return new Date(Date.now() + delay).toISOString()
}

/**
 * Determine if a response status code should trigger a retry.
 * Retries on 5xx (server errors), 429 (rate limited), and network errors (null status).
 */
export function shouldRetry(status: number | null): boolean {
  if (status === null) return true // Network error
  if (status === 429) return true  // Rate limited
  if (status >= 500) return true   // Server error
  return false
}

/**
 * Get the retry schedule for display purposes.
 * Returns an array of delay descriptions for each retry attempt.
 */
export function getRetrySchedule(config: RetryConfig = DEFAULT_RETRY_CONFIG): string[] {
  const schedule: string[] = []
  for (let i = 0; i < config.maxAttempts; i++) {
    const delay = calculateRetryDelay(i, { ...config, jitterFactor: 0 })
    if (delay === null) break
    if (delay < 60_000) {
      schedule.push(`Attempt ${i + 2}: ~${Math.round(delay / 1000)}s`)
    } else if (delay < 3_600_000) {
      schedule.push(`Attempt ${i + 2}: ~${Math.round(delay / 60_000)}min`)
    } else {
      schedule.push(`Attempt ${i + 2}: ~${Math.round(delay / 3_600_000)}h`)
    }
  }
  return schedule
}
