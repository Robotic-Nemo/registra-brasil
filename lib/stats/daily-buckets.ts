/**
 * Shared helpers for daily-bucket timeseries (UTC).
 *
 * Sibling of `lib/stats/weekly-buckets.ts`. Keeps day boundaries
 * aligned across scopes so "last 90 days" means the same window
 * everywhere.
 */

export interface StatusDayBucket {
  date: string // YYYY-MM-DD (UTC)
  total: number
  verified: number
  disputed: number
  unverified: number
}

export function todayUtcMs(now: Date = new Date()): number {
  return Date.UTC(now.getUTCFullYear(), now.getUTCMonth(), now.getUTCDate())
}

export function buildDailyStatusSeries(
  days: number,
  rows: Array<{ statement_date: string; verification_status: string }>,
): { series: StatusDayBucket[]; startIso: string; total: number } {
  const today = todayUtcMs()
  const startMs = today - (days - 1) * 86400_000
  const startIso = new Date(startMs).toISOString().slice(0, 10)

  const tally = new Map<string, StatusDayBucket>()
  for (const r of rows) {
    const k = r.statement_date.slice(0, 10)
    let b = tally.get(k)
    if (!b) { b = { date: k, total: 0, verified: 0, disputed: 0, unverified: 0 }; tally.set(k, b) }
    b.total++
    if (r.verification_status === 'verified') b.verified++
    else if (r.verification_status === 'disputed') b.disputed++
    else if (r.verification_status === 'unverified') b.unverified++
  }

  const series: StatusDayBucket[] = []
  for (let i = 0; i < days; i++) {
    const ms = startMs + i * 86400_000
    const d = new Date(ms)
    const key = `${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}-${String(d.getUTCDate()).padStart(2, '0')}`
    series.push(tally.get(key) ?? { date: key, total: 0, verified: 0, disputed: 0, unverified: 0 })
  }

  const total = series.reduce((s, x) => s + x.total, 0)
  return { series, startIso, total }
}
