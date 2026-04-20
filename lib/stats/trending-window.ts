/**
 * Shared momentum helper: compares a recent window vs the prior
 * equal-length window. Used by `/api/trending/{politicos,partidos,
 * estados,categorias}.json`. Single query over 2×janela-day span
 * + in-memory split by date string — halves PG cost vs two queries.
 *
 * Caller provides rows pulled from Supabase plus a `keyFn` that
 * projects each row to its grouping key (and a null-guard return).
 * Rows with null keys or null statement_date are skipped.
 */

export interface TrendingRow {
  statement_date: string | null
  severity_score: number | null
}

export interface TrendingBucket {
  key: string
  recent: number
  prior: number
  delta: number
  delta_pct: number | null
  avg_severity_recent: number | null
}

export interface TrendingWindow {
  startStr: string
  midStr: string
  janela: number
}

export function resolveTrendingWindow(
  janela: number,
  now: Date = new Date(),
): TrendingWindow {
  const ms = 86_400_000
  const midStr = new Date(now.getTime() - janela * ms).toISOString().slice(0, 10)
  const startStr = new Date(now.getTime() - 2 * janela * ms).toISOString().slice(0, 10)
  return { startStr, midStr, janela }
}

export function buildTrending<T extends TrendingRow>(
  rows: T[],
  keyFn: (r: T) => string | null | undefined,
  midStr: string,
  limit: number,
  minRecent: number,
): TrendingBucket[] {
  type B = { recent: number; prior: number; sevSum: number; sevN: number }
  const agg = new Map<string, B>()
  for (const r of rows) {
    const k = keyFn(r)
    if (!k) continue
    const d = r.statement_date
    if (!d) continue
    let b = agg.get(k)
    if (!b) { b = { recent: 0, prior: 0, sevSum: 0, sevN: 0 }; agg.set(k, b) }
    if (d >= midStr) {
      b.recent++
      const sv = r.severity_score
      if (sv === 1 || sv === 2 || sv === 3 || sv === 4 || sv === 5) {
        b.sevSum += sv; b.sevN++
      }
    } else {
      b.prior++
    }
  }
  return [...agg.entries()]
    .filter(([, b]) => b.recent >= minRecent)
    .map(([k, b]) => ({
      key: k,
      recent: b.recent,
      prior: b.prior,
      delta: b.recent - b.prior,
      delta_pct: b.prior > 0 ? +(((b.recent - b.prior) / b.prior) * 100).toFixed(1) : null,
      avg_severity_recent: b.sevN > 0 ? +(b.sevSum / b.sevN).toFixed(2) : null,
    }))
    .sort((a, b) => (b.delta - a.delta) || (b.recent - a.recent))
    .slice(0, limit)
}
