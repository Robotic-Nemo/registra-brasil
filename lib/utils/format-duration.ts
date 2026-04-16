/**
 * Format time durations into human-readable strings (Portuguese).
 */

interface DurationParts {
  days: number
  hours: number
  minutes: number
  seconds: number
}

/**
 * Break milliseconds into days, hours, minutes, seconds.
 */
export function parseDuration(ms: number): DurationParts {
  const totalSeconds = Math.abs(Math.floor(ms / 1000))
  return {
    days: Math.floor(totalSeconds / 86400),
    hours: Math.floor((totalSeconds % 86400) / 3600),
    minutes: Math.floor((totalSeconds % 3600) / 60),
    seconds: totalSeconds % 60,
  }
}

/**
 * Format milliseconds into a compact human-readable duration.
 *
 * @example
 * formatDuration(0)        // "0s"
 * formatDuration(5000)     // "5s"
 * formatDuration(65000)    // "1min 5s"
 * formatDuration(3661000)  // "1h 1min"
 * formatDuration(90061000) // "1d 1h"
 */
export function formatDuration(ms: number): string {
  if (ms === 0) return '0s'

  const { days, hours, minutes, seconds } = parseDuration(ms)
  const parts: string[] = []

  if (days > 0) parts.push(`${days}d`)
  if (hours > 0) parts.push(`${hours}h`)
  if (minutes > 0) parts.push(`${minutes}min`)
  if (seconds > 0 && days === 0) parts.push(`${seconds}s`)

  return parts.slice(0, 2).join(' ') || '0s'
}

/**
 * Format milliseconds into a verbose human-readable duration (Portuguese).
 *
 * @example
 * formatDurationLong(65000) // "1 minuto e 5 segundos"
 */
export function formatDurationLong(ms: number): string {
  if (ms === 0) return '0 segundos'

  const { days, hours, minutes, seconds } = parseDuration(ms)
  const parts: string[] = []

  if (days > 0) parts.push(`${days} ${days === 1 ? 'dia' : 'dias'}`)
  if (hours > 0) parts.push(`${hours} ${hours === 1 ? 'hora' : 'horas'}`)
  if (minutes > 0) parts.push(`${minutes} ${minutes === 1 ? 'minuto' : 'minutos'}`)
  if (seconds > 0 && days === 0) parts.push(`${seconds} ${seconds === 1 ? 'segundo' : 'segundos'}`)

  if (parts.length === 0) return '0 segundos'
  if (parts.length === 1) return parts[0]

  const last = parts.pop()
  return `${parts.join(', ')} e ${last}`
}
