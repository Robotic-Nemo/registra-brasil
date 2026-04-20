/**
 * Shared helper: month × severity-level matrix (1..5) for a scope.
 * Used by `/api/estatisticas/severidade-por-mes.json` and the scope
 * variants (partidos / estados / categorias / fontes / politico).
 *
 * All callers share the same month-anchor + gap-fill + null-guard
 * behaviour so dashboards can diff scopes safely.
 */

export interface SeverityMonthBucket {
  month: string // YYYY-MM
  total: number
  levels: Record<1 | 2 | 3 | 4 | 5, number>
}

export function buildSeverityMonthlyMatrix(
  meses: number,
  rows: Array<{ statement_date: string; severity_score: number | null }>,
  now: Date = new Date(),
): { series: SeverityMonthBucket[]; total: number } {
  const tally = new Map<string, { 1: number; 2: number; 3: number; 4: number; 5: number; total: number }>()
  for (const r of rows) {
    const k = r.statement_date?.slice(0, 7)
    if (!k) continue
    let b = tally.get(k)
    if (!b) { b = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, total: 0 }; tally.set(k, b) }
    b.total++
    const sv = r.severity_score
    if (sv === 1 || sv === 2 || sv === 3 || sv === 4 || sv === 5) b[sv]++
  }

  const startY = now.getUTCFullYear()
  const startM = now.getUTCMonth() - (meses - 1)
  const series: SeverityMonthBucket[] = []
  for (let i = 0; i < meses; i++) {
    const d = new Date(Date.UTC(startY, startM + i, 1))
    const key = `${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}`
    const b = tally.get(key) ?? { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, total: 0 }
    series.push({ month: key, total: b.total, levels: { 1: b[1], 2: b[2], 3: b[3], 4: b[4], 5: b[5] } })
  }

  const total = series.reduce((s, x) => s + x.total, 0)
  return { series, total }
}
