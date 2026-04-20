/**
 * Shared helpers for weekly-bucket timeseries (UTC, ISO Monday).
 *
 * `/api/politico/:slug/por-semana.json` shipped first; the partido/
 * estado/categoria siblings reuse the same bucketing logic here.
 * Keeping it in one place means every scope agrees on what "week
 * of YYYY-MM-DD" means — a subtle thing to get right across dst/
 * locale drift if inlined.
 */

export interface StatusWeekBucket {
  week_start: string // UTC Monday, YYYY-MM-DD
  total: number
  verified: number
  disputed: number
  unverified: number
}

/** UTC midnight of today. */
export function todayUtcMs(now: Date = new Date()): number {
  return Date.UTC(now.getUTCFullYear(), now.getUTCMonth(), now.getUTCDate())
}

/** Returns the UTC Monday (00:00) ms for the ISO week containing `ms`. */
export function utcMondayOfMs(ms: number): number {
  const dow = new Date(ms).getUTCDay() // 0=Sun..6=Sat
  const offset = (dow + 6) % 7 // Mon=0, Sun=6
  return ms - offset * 86400_000
}

/** Monday-anchored bucket key for a 'YYYY-MM-DD' string. */
export function weekKeyFromDate(dateStr: string): string {
  const [y, m, d] = dateStr.slice(0, 10).split('-').map(Number)
  const ms = Date.UTC(y, (m ?? 1) - 1, d ?? 1)
  const monday = utcMondayOfMs(ms)
  return new Date(monday).toISOString().slice(0, 10)
}

/**
 * Build an N-week gap-filled series of status-split buckets from a
 * list of `{statement_date, verification_status}` rows. Buckets end
 * with the current ISO week.
 */
export function buildWeeklyStatusSeries(
  weeks: number,
  rows: Array<{ statement_date: string; verification_status: string }>,
): { series: StatusWeekBucket[]; startIso: string; total: number } {
  const today = todayUtcMs()
  const thisMonday = utcMondayOfMs(today)
  const startMs = thisMonday - (weeks - 1) * 7 * 86400_000
  const startIso = new Date(startMs).toISOString().slice(0, 10)

  const tally = new Map<string, StatusWeekBucket>()
  for (const r of rows) {
    const raw = r.statement_date?.slice(0, 10)
    if (!raw) continue
    const k = weekKeyFromDate(raw)
    let b = tally.get(k)
    if (!b) {
      b = { week_start: k, total: 0, verified: 0, disputed: 0, unverified: 0 }
      tally.set(k, b)
    }
    b.total++
    if (r.verification_status === 'verified') b.verified++
    else if (r.verification_status === 'disputed') b.disputed++
    else if (r.verification_status === 'unverified') b.unverified++
  }

  const series: StatusWeekBucket[] = []
  for (let i = 0; i < weeks; i++) {
    const ms = startMs + i * 7 * 86400_000
    const key = new Date(ms).toISOString().slice(0, 10)
    series.push(tally.get(key) ?? { week_start: key, total: 0, verified: 0, disputed: 0, unverified: 0 })
  }

  const total = series.reduce((s, x) => s + x.total, 0)
  return { series, startIso, total }
}
