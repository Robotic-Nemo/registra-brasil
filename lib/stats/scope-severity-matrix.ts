/**
 * Shared helper: scope × severity-level (1..5) matrix.
 *
 * Aggregates `{key, severity_score}` rows into a dense top-N matrix
 * ordered by total volume (desc). Used by the analise/*-x-severidade
 * endpoints — party, UF, category — so every scope agrees on the
 * tie-break + null-severity handling.
 */

export interface SeverityScopeRow {
  key: string
  total: number
  levels: Record<1 | 2 | 3 | 4 | 5, number>
  avg_severity: number | null
}

export function buildScopeSeverityMatrix<T>(
  rows: T[],
  keyFn: (r: T) => string | null | undefined,
  sevFn: (r: T) => number | null | undefined,
  limit: number,
): { rows: SeverityScopeRow[]; total: number; max: number } {
  const tally = new Map<string, { total: number; 1: number; 2: number; 3: number; 4: number; 5: number; sumSev: number; nSev: number }>()
  for (const r of rows) {
    const k = keyFn(r)
    if (!k) continue
    let b = tally.get(k)
    if (!b) { b = { total: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, sumSev: 0, nSev: 0 }; tally.set(k, b) }
    b.total++
    const sv = sevFn(r)
    if (sv === 1 || sv === 2 || sv === 3 || sv === 4 || sv === 5) {
      b[sv]++
      b.sumSev += sv
      b.nSev++
    }
  }

  const out: SeverityScopeRow[] = [...tally.entries()]
    .sort((a, b) => b[1].total - a[1].total)
    .slice(0, limit)
    .map(([key, b]) => ({
      key,
      total: b.total,
      levels: { 1: b[1], 2: b[2], 3: b[3], 4: b[4], 5: b[5] },
      avg_severity: b.nSev > 0 ? +(b.sumSev / b.nSev).toFixed(2) : null,
    }))

  const max = out.reduce((m, r) => Math.max(m, r.levels[1], r.levels[2], r.levels[3], r.levels[4], r.levels[5]), 0)
  const total = out.reduce((s, r) => s + r.total, 0)
  return { rows: out, total, max }
}
