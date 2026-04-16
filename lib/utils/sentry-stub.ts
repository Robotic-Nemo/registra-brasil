/**
 * Stub for error reporting (Sentry-compatible interface).
 * Replace with real Sentry SDK when ready.
 */

type SeverityLevel = 'fatal' | 'error' | 'warning' | 'info' | 'debug'

interface ExtraContext {
  [key: string]: unknown
}

/**
 * Capture an exception for error reporting.
 * Currently logs to console; replace with Sentry.captureException in production.
 */
export function captureException(error: unknown, context?: ExtraContext): string {
  const eventId = generateEventId()
  console.error('[SentryStub] captureException', { eventId, error, context })
  return eventId
}

/**
 * Capture a message for error reporting.
 */
export function captureMessage(
  message: string,
  level: SeverityLevel = 'info',
  context?: ExtraContext
): string {
  const eventId = generateEventId()
  console.warn('[SentryStub] captureMessage', { eventId, message, level, context })
  return eventId
}

/**
 * Set user context for error reporting.
 */
export function setUser(user: { id?: string; email?: string; name?: string } | null): void {
  if (user) {
    console.info('[SentryStub] setUser', user)
  } else {
    console.info('[SentryStub] clearUser')
  }
}

/**
 * Add breadcrumb for debugging.
 */
export function addBreadcrumb(breadcrumb: {
  category?: string
  message: string
  level?: SeverityLevel
}): void {
  console.debug('[SentryStub] breadcrumb', breadcrumb)
}

function generateEventId(): string {
  return Math.random().toString(36).substring(2, 15) + Date.now().toString(36)
}
