/**
 * Extract a human-readable message from an unknown error.
 */
export function getErrorMessage(error: unknown): string {
  if (error instanceof Error) return error.message
  if (typeof error === 'string') return error
  return 'Um erro inesperado ocorreu'
}

/**
 * Safe JSON parse that returns null instead of throwing.
 */
export function safeJsonParse<T>(json: string | null | undefined): T | null {
  if (!json || typeof json !== 'string') return null
  try {
    return JSON.parse(json) as T
  } catch {
    return null
  }
}

/**
 * Retry an async function up to `attempts` times with exponential backoff.
 */
export async function retry<T>(
  fn: () => Promise<T>,
  attempts = 3,
  baseDelayMs = 500
): Promise<T> {
  for (let i = 0; i < attempts; i++) {
    try {
      return await fn()
    } catch (err) {
      if (i === attempts - 1) throw err
      await new Promise((r) => setTimeout(r, baseDelayMs * 2 ** i))
    }
  }
  throw new Error('Retry exhausted') // unreachable
}
