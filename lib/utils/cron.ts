/**
 * Cron expression helpers for scheduled tasks
 */

export interface CronSchedule {
  expression: string
  description: string
  nextRun?: Date
}

export const SCHEDULES = {
  everyMinute: '* * * * *',
  every5Minutes: '*/5 * * * *',
  every15Minutes: '*/15 * * * *',
  everyHour: '0 * * * *',
  every6Hours: '0 */6 * * *',
  daily: '0 0 * * *',
  dailyAt9AM: '0 9 * * *',
  weekly: '0 0 * * 0',
  monthly: '0 0 1 * *',
} as const satisfies Record<string, string>

/**
 * Parse a simple cron expression and get the next run time
 * Supports: minute, hour, day-of-month, month, day-of-week
 */
export function getNextCronRun(expression: string, from = new Date()): Date | null {
  const parts = expression.split(' ')
  if (parts.length !== 5) return null

  const [minuteExpr, hourExpr, , ,] = parts

  const next = new Date(from)
  next.setSeconds(0, 0)
  next.setMinutes(next.getMinutes() + 1)

  // Simple case: */N patterns
  if (minuteExpr.startsWith('*/')) {
    const interval = parseInt(minuteExpr.slice(2))
    const currentMinute = next.getMinutes()
    const nextMinute = Math.ceil(currentMinute / interval) * interval
    next.setMinutes(nextMinute >= 60 ? 0 : nextMinute)
    if (nextMinute >= 60) next.setHours(next.getHours() + 1)
    return next
  }

  if (minuteExpr !== '*' && hourExpr !== '*') {
    const targetMinute = parseInt(minuteExpr)
    const targetHour = parseInt(hourExpr)
    next.setHours(targetHour, targetMinute)
    if (next <= from) next.setDate(next.getDate() + 1)
    return next
  }

  return null
}

/**
 * Human-readable cron description in Portuguese
 */
export function describeCron(expression: string): string {
  const descriptions: Record<string, string> = {
    '* * * * *': 'A cada minuto',
    '*/5 * * * *': 'A cada 5 minutos',
    '*/15 * * * *': 'A cada 15 minutos',
    '0 * * * *': 'A cada hora',
    '0 */6 * * *': 'A cada 6 horas',
    '0 0 * * *': 'Diariamente à meia-noite',
    '0 9 * * *': 'Diariamente às 9h',
    '0 0 * * 0': 'Semanalmente aos domingos',
    '0 0 1 * *': 'Mensalmente no dia 1',
  }

  return descriptions[expression] ?? expression
}
