/**
 * Shared helper for month × key matrices. Used by
 * `/api/estatisticas/{por-partido,por-estado,por-categoria,por-fonte}
 * .json` so every matrix endpoint agrees on:
 *   - month key layout (UTC, gap-filled)
 *   - top-N ordering (total descending)
 *   - row shape
 *
 * Generic: pass the rows + `keyFn(r)` that picks the grouping key
 * (party | state | slug | domain). `dateFn(r)` defaults to
 * `r.statement_date`.
 */

export interface MatrixRow<K extends string = string> {
  key: K
  total: number
  series: Array<{ month: string; count: number }>
}

export function monthKeysUtc(meses: number, now: Date = new Date()): string[] {
  const startY = now.getUTCFullYear()
  const startM = now.getUTCMonth() - (meses - 1)
  const out: string[] = []
  for (let i = 0; i < meses; i++) {
    const d = new Date(Date.UTC(startY, startM + i, 1))
    out.push(`${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}`)
  }
  return out
}

export function buildGroupMatrix<T, K extends string>(
  rows: T[],
  meses: number,
  opts: {
    keyFn: (row: T) => K | null | undefined
    dateFn: (row: T) => string | null | undefined
    limit: number
    now?: Date
  },
): { months: string[]; uniqueKeys: number; matrix: MatrixRow<K>[] } {
  const months = monthKeysUtc(meses, opts.now)
  const monthSet = new Set(months)
  const byKey = new Map<K, Map<string, number>>()
  const keyTotal = new Map<K, number>()

  for (const r of rows) {
    const k = opts.keyFn(r)
    if (!k) continue
    const m = opts.dateFn(r)?.slice(0, 7)
    if (!m || !monthSet.has(m)) continue
    let mm = byKey.get(k)
    if (!mm) { mm = new Map<string, number>(); byKey.set(k, mm) }
    mm.set(m, (mm.get(m) ?? 0) + 1)
    keyTotal.set(k, (keyTotal.get(k) ?? 0) + 1)
  }

  const top = [...keyTotal.entries()]
    .sort((a, b) => b[1] - a[1])
    .slice(0, opts.limit)
    .map(([k]) => k)

  const matrix: MatrixRow<K>[] = top.map((k) => {
    const mm = byKey.get(k) ?? new Map<string, number>()
    return {
      key: k,
      total: keyTotal.get(k) ?? 0,
      series: months.map((month) => ({ month, count: mm.get(month) ?? 0 })),
    }
  })

  return { months, uniqueKeys: byKey.size, matrix }
}
