/**
 * Shared helper: week × severity-level matrix (1..5) for a scope.
 *
 * Weekly sibling of `lib/stats/severity-monthly-matrix.ts`. ISO-
 * Monday anchored (UTC). Useful at the 12–26 week range where month
 * buckets are too lumpy and day buckets too noisy.
 */

import { utcMondayOfMs, todayUtcMs, weekKeyFromDate } from '@/lib/stats/weekly-buckets'

export interface SeverityWeekBucket {
  week_start: string // UTC Monday YYYY-MM-DD
  total: number
  levels: Record<1 | 2 | 3 | 4 | 5, number>
}

export function weeklyStartStr(weeks: number, now: Date = new Date()): string {
  const thisMonday = utcMondayOfMs(todayUtcMs(now))
  const startMs = thisMonday - (weeks - 1) * 7 * 86400_000
  return new Date(startMs).toISOString().slice(0, 10)
}

export function buildSeverityWeeklyMatrix(
  weeks: number,
  rows: Array<{ statement_date: string; severity_score: number | null }>,
  now: Date = new Date(),
): { series: SeverityWeekBucket[]; startIso: string; total: number } {
  const thisMonday = utcMondayOfMs(todayUtcMs(now))
  const startMs = thisMonday - (weeks - 1) * 7 * 86400_000
  const startIso = new Date(startMs).toISOString().slice(0, 10)

  const tally = new Map<string, { 1: number; 2: number; 3: number; 4: number; 5: number; total: number }>()
  for (const r of rows) {
    const raw = r.statement_date?.slice(0, 10)
    if (!raw) continue
    const k = weekKeyFromDate(raw)
    let b = tally.get(k)
    if (!b) { b = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, total: 0 }; tally.set(k, b) }
    b.total++
    const sv = r.severity_score
    if (sv === 1 || sv === 2 || sv === 3 || sv === 4 || sv === 5) b[sv]++
  }

  const series: SeverityWeekBucket[] = []
  for (let i = 0; i < weeks; i++) {
    const ms = startMs + i * 7 * 86400_000
    const key = new Date(ms).toISOString().slice(0, 10)
    const b = tally.get(key) ?? { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, total: 0 }
    series.push({ week_start: key, total: b.total, levels: { 1: b[1], 2: b[2], 3: b[3], 4: b[4], 5: b[5] } })
  }

  const total = series.reduce((s, x) => s + x.total, 0)
  return { series, startIso, total }
}
