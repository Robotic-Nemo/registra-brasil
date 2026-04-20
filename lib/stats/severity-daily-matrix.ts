/**
 * Shared helper: day × severity-level matrix (1..5) for a scope.
 *
 * Daily sibling of `lib/stats/severity-monthly-matrix.ts`. Suitable
 * for short-window heatmaps (30/60/90 day dashboards) where monthly
 * granularity is too coarse.
 */

export interface SeverityDayBucket {
  date: string // YYYY-MM-DD (UTC)
  total: number
  levels: Record<1 | 2 | 3 | 4 | 5, number>
}

export function todayUtcMs(now: Date = new Date()): number {
  return Date.UTC(now.getUTCFullYear(), now.getUTCMonth(), now.getUTCDate())
}

export function dailyStartStr(days: number, now: Date = new Date()): string {
  const today = todayUtcMs(now)
  const startMs = today - (days - 1) * 86400_000
  return new Date(startMs).toISOString().slice(0, 10)
}

export function buildSeverityDailyMatrix(
  days: number,
  rows: Array<{ statement_date: string; severity_score: number | null }>,
  now: Date = new Date(),
): { series: SeverityDayBucket[]; total: number } {
  const today = todayUtcMs(now)
  const startMs = today - (days - 1) * 86400_000

  const tally = new Map<string, { 1: number; 2: number; 3: number; 4: number; 5: number; total: number }>()
  for (const r of rows) {
    const k = r.statement_date?.slice(0, 10)
    if (!k) continue
    let b = tally.get(k)
    if (!b) { b = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, total: 0 }; tally.set(k, b) }
    b.total++
    const sv = r.severity_score
    if (sv === 1 || sv === 2 || sv === 3 || sv === 4 || sv === 5) b[sv]++
  }

  const series: SeverityDayBucket[] = []
  for (let i = 0; i < days; i++) {
    const ms = startMs + i * 86400_000
    const d = new Date(ms)
    const key = `${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}-${String(d.getUTCDate()).padStart(2, '0')}`
    const b = tally.get(key) ?? { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, total: 0 }
    series.push({ date: key, total: b.total, levels: { 1: b[1], 2: b[2], 3: b[3], 4: b[4], 5: b[5] } })
  }

  const total = series.reduce((s, x) => s + x.total, 0)
  return { series, total }
}
