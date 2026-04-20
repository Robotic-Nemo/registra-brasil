export interface DataPoint {
  label: string
  value: number
  color?: string
}

export interface TimeSeriesPoint {
  date: string
  value: number
}

/**
 * Group items by a key and count occurrences.
 */
export function groupAndCount<T>(
  items: T[],
  keyFn: (item: T) => string
): DataPoint[] {
  const counts = new Map<string, number>()
  for (const item of items) {
    const key = keyFn(item)
    counts.set(key, (counts.get(key) ?? 0) + 1)
  }
  return Array.from(counts.entries())
    .sort((a, b) => b[1] - a[1])
    .map(([label, value]) => ({ label, value }))
}

/**
 * Aggregate items into time buckets (day, week, month).
 */
export function aggregateTimeSeries<T>(
  items: T[],
  dateFn: (item: T) => string,
  bucket: 'day' | 'week' | 'month' = 'day'
): TimeSeriesPoint[] {
  const counts = new Map<string, number>()

  for (const item of items) {
    const dateStr = dateFn(item)
    if (!dateStr) continue
    const key = bucketDate(dateStr, bucket)
    counts.set(key, (counts.get(key) ?? 0) + 1)
  }

  return Array.from(counts.entries())
    .sort((a, b) => a[0].localeCompare(b[0]))
    .map(([date, value]) => ({ date, value }))
}

function bucketDate(dateStr: string, bucket: 'day' | 'week' | 'month'): string {
  // statement_date comes in as `YYYY-MM-DD` (UTC). Parsing that with
  // `new Date()` yields a UTC-midnight instant — any local-time
  // getFullYear / getMonth / getDay then drifts on BRT machines
  // (previous day for anything after 21:00 UTC). Stay in UTC.
  if (bucket === 'day') return dateStr.slice(0, 10)
  const d = new Date(dateStr)
  if (bucket === 'month') {
    return `${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}`
  }
  // Week: ISO-ish, starting Sunday UTC.
  const day = d.getUTCDay()
  const weekStart = new Date(Date.UTC(d.getUTCFullYear(), d.getUTCMonth(), d.getUTCDate() - day))
  return weekStart.toISOString().slice(0, 10)
}

/**
 * Calculate percentage distribution from data points.
 */
export function toPercentages(data: DataPoint[]): (DataPoint & { pct: number })[] {
  const total = data.reduce((sum, d) => sum + d.value, 0)
  if (total === 0) return data.map((d) => ({ ...d, pct: 0 }))
  return data.map((d) => ({ ...d, pct: Math.round((d.value / total) * 100) }))
}

/**
 * Generate default colors for chart segments.
 */
export function getChartColors(count: number): string[] {
  const palette = [
    '#3B82F6', '#10B981', '#F59E0B', '#EF4444', '#8B5CF6',
    '#EC4899', '#06B6D4', '#84CC16', '#F97316', '#6366F1',
    '#14B8A6', '#E11D48', '#A855F7', '#0EA5E9', '#22C55E',
  ]
  return Array.from({ length: count }, (_, i) => palette[i % palette.length])
}

/**
 * Get the min and max values from time series data.
 */
export function getTimeSeriesRange(data: TimeSeriesPoint[]): { min: number; max: number } {
  if (data.length === 0) return { min: 0, max: 0 }
  let min = Infinity
  let max = -Infinity
  for (const p of data) {
    if (p.value < min) min = p.value
    if (p.value > max) max = p.value
  }
  return { min, max }
}

/**
 * Fill gaps in time series with zero values.
 */
export function fillTimeSeriesGaps(
  data: TimeSeriesPoint[],
  startDate: string,
  endDate: string,
  bucket: 'day' | 'week' | 'month' = 'day'
): TimeSeriesPoint[] {
  const existing = new Map(data.map((d) => [d.date, d.value]))
  const result: TimeSeriesPoint[] = []
  const current = new Date(startDate)
  const end = new Date(endDate)

  while (current <= end) {
    const key = bucketDate(current.toISOString().slice(0, 10), bucket)
    if (!result.find((r) => r.date === key)) {
      result.push({ date: key, value: existing.get(key) ?? 0 })
    }

    if (bucket === 'month') {
      current.setMonth(current.getMonth() + 1)
    } else if (bucket === 'week') {
      current.setDate(current.getDate() + 7)
    } else {
      current.setDate(current.getDate() + 1)
    }
  }

  return result
}
