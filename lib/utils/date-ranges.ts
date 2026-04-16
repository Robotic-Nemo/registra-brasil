/**
 * Format a Date as YYYY-MM-DD in America/Sao_Paulo timezone.
 * All calendar-date operations in this app use Brazilian local time.
 */
function toSaoPauloDateString(d: Date): string {
  // en-CA locale returns YYYY-MM-DD format
  return d.toLocaleDateString('en-CA', { timeZone: 'America/Sao_Paulo' })
}

/** Returns ISO date string N days ago (America/Sao_Paulo). */
export function daysAgo(days: number): string {
  if (!Number.isFinite(days) || days < 0) days = 0
  return toSaoPauloDateString(new Date(Date.now() - days * 86_400_000))
}

/** Returns ISO date string for the first day of the current month (America/Sao_Paulo). */
export function startOfMonth(): string {
  const today = toSaoPauloDateString(new Date())
  return `${today.slice(0, 7)}-01`
}

/** Returns ISO date string for the first day of the current year (America/Sao_Paulo). */
export function startOfYear(): string {
  return `${toSaoPauloDateString(new Date()).slice(0, 4)}-01-01`
}

/** Pre-defined date range presets */
export const DATE_PRESETS = [
  { label: '7 dias', days: 7 },
  { label: '30 dias', days: 30 },
  { label: '3 meses', days: 90 },
  { label: '6 meses', days: 180 },
  { label: '1 ano', days: 365 },
] as const

/** Check if a date string is within the last N days */
export function isWithinDays(dateStr: string | null | undefined, days: number): boolean {
  if (!dateStr || !Number.isFinite(days) || days < 0) return false
  const date = new Date(dateStr)
  if (Number.isNaN(date.getTime())) return false
  const cutoff = new Date(Date.now() - days * 86_400_000)
  return date >= cutoff
}
