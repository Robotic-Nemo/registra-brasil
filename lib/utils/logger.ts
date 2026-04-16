type LogLevel = 'debug' | 'info' | 'warn' | 'error'

interface LogEntry {
  level: LogLevel
  message: string
  context?: string
  data?: Record<string, unknown>
  timestamp: string
}

const LOG_LEVELS: Record<LogLevel, number> = {
  debug: 0,
  info: 1,
  warn: 2,
  error: 3,
}

const MIN_LEVEL: LogLevel =
  (process.env.LOG_LEVEL as LogLevel) ?? (process.env.NODE_ENV === 'production' ? 'info' : 'debug')

function shouldLog(level: LogLevel): boolean {
  return LOG_LEVELS[level] >= LOG_LEVELS[MIN_LEVEL as LogLevel]
}

function log(level: LogLevel, message: string, context?: string, data?: Record<string, unknown>) {
  if (!shouldLog(level)) return

  const entry: LogEntry = {
    level,
    message,
    context,
    data,
    timestamp: new Date().toISOString(),
  }

  const prefix = context ? `[${context}]` : ''
  const fn = level === 'error' ? console.error : level === 'warn' ? console.warn : console.log

  if (process.env.NODE_ENV === 'production') {
    // Structured JSON logging in production
    fn(JSON.stringify(entry))
  } else {
    fn(`${entry.timestamp} ${level.toUpperCase()} ${prefix} ${message}`, data ?? '')
  }
}

/** Create a scoped logger for a specific context (e.g., module name) */
export function createLogger(context: string) {
  return {
    debug: (msg: string, data?: Record<string, unknown>) => log('debug', msg, context, data),
    info: (msg: string, data?: Record<string, unknown>) => log('info', msg, context, data),
    warn: (msg: string, data?: Record<string, unknown>) => log('warn', msg, context, data),
    error: (msg: string, data?: Record<string, unknown>) => log('error', msg, context, data),
  }
}

export type Logger = ReturnType<typeof createLogger>

export const logger = createLogger('app')
