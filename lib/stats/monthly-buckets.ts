/**
 * Shared monthly-bucket helper (UTC, first-of-month anchor) used by
 * every scope's `/por-mes.json`. Mirrors the weekly + daily helpers.
 */

export interface StatusMonthBucket {
  month: string // YYYY-MM
  total: number
  verified: number
  disputed: number
  unverified: number
}

export function monthlyStartStr(meses: number, now: Date = new Date()): string {
  const start = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (meses - 1), 1))
  return start.toISOString().slice(0, 10)
}

export function buildMonthlyStatusSeries(
  meses: number,
  rows: Array<{ statement_date: string; verification_status: string }>,
  now: Date = new Date(),
): { series: StatusMonthBucket[]; total: number } {
  const start = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (meses - 1), 1))

  const tally = new Map<string, StatusMonthBucket>()
  for (const r of rows) {
    const k = r.statement_date?.slice(0, 7)
    if (!k) continue
    let b = tally.get(k)
    if (!b) { b = { month: k, total: 0, verified: 0, disputed: 0, unverified: 0 }; tally.set(k, b) }
    b.total++
    if (r.verification_status === 'verified') b.verified++
    else if (r.verification_status === 'disputed') b.disputed++
    else if (r.verification_status === 'unverified') b.unverified++
  }

  const series: StatusMonthBucket[] = []
  for (let i = 0; i < meses; i++) {
    const d = new Date(Date.UTC(start.getUTCFullYear(), start.getUTCMonth() + i, 1))
    const key = `${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}`
    series.push(tally.get(key) ?? { month: key, total: 0, verified: 0, disputed: 0, unverified: 0 })
  }
  const total = series.reduce((s, x) => s + x.total, 0)
  return { series, total }
}
