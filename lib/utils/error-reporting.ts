/**
 * Enhanced error reporting with context.
 */

interface ErrorContext {
  component?: string
  action?: string
  userId?: string
  metadata?: Record<string, unknown>
}

interface ErrorReport {
  message: string
  stack?: string
  context: ErrorContext
  url: string
  timestamp: string
  userAgent: string
}

const errorBuffer: ErrorReport[] = []
const MAX_BUFFER_SIZE = 50

/** Report an error with additional context */
export function reportError(error: Error | string, context: ErrorContext = {}): void {
  const report: ErrorReport = {
    message: typeof error === 'string' ? error : error.message,
    stack: typeof error === 'string' ? undefined : error.stack,
    context,
    url: typeof window !== 'undefined' ? window.location.href : '',
    timestamp: new Date().toISOString(),
    userAgent: typeof navigator !== 'undefined' ? navigator.userAgent : '',
  }

  errorBuffer.push(report)
  if (errorBuffer.length > MAX_BUFFER_SIZE) {
    errorBuffer.shift()
  }

  if (process.env.NODE_ENV === 'development') {
    console.error('[error-report]', report.message, report.context)
  }
}

/** Get all buffered error reports */
export function getErrorReports(): ErrorReport[] {
  return [...errorBuffer]
}

/** Clear the error buffer */
export function clearErrorReports(): void {
  errorBuffer.length = 0
}

/** Setup global error handler */
export function setupGlobalErrorHandler(): void {
  if (typeof window === 'undefined') return

  window.addEventListener('error', (event) => {
    reportError(event.error || event.message, { action: 'global-error' })
  })

  window.addEventListener('unhandledrejection', (event) => {
    const message = event.reason instanceof Error ? event.reason.message : String(event.reason)
    reportError(message, { action: 'unhandled-rejection' })
  })
}
