/** Returns ISO date string N days ago */
export function daysAgo(days: number): string {
  return new Date(Date.now() - days * 86_400_000).toISOString().slice(0, 10)
}

/** Returns ISO date string for the first day of the current month */
export function startOfMonth(): string {
  const d = new Date()
  return new Date(d.getFullYear(), d.getMonth(), 1).toISOString().slice(0, 10)
}

/** Returns ISO date string for the first day of the current year */
export function startOfYear(): string {
  return `${new Date().getFullYear()}-01-01`
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
export function isWithinDays(dateStr: string, days: number): boolean {
  const date = new Date(dateStr)
  const cutoff = new Date(Date.now() - days * 86_400_000)
  return date >= cutoff
}
