/**
 * Shared helper: aggregate row lists per scope key into a uniform
 * shape used by `/api/comparar/{partidos,estados,categorias}.json`.
 *
 * Each caller pulls raw `{key, statement_date, severity_score,
 * verification_status}` rows and asks this helper to:
 *   - count total / verified / disputed / unverified
 *   - tally severity levels 1..5 + compute avg
 *   - build a monthly gap-filled series (last `meses` months, UTC)
 *
 * Keeping the shape in one place means all three compare endpoints
 * agree on ties + null handling.
 */

export interface CompareMonthBucket {
  month: string
  total: number
}

export interface CompareEntity {
  key: string
  total: number
  verified: number
  disputed: number
  unverified: number
  levels: Record<1 | 2 | 3 | 4 | 5, number>
  avg_severity: number | null
  monthly: CompareMonthBucket[]
}

interface CompareRow {
  key: string
  statement_date: string
  severity_score: number | null
  verification_status: string
}

export function buildCompareEntities(
  rows: CompareRow[],
  keys: string[],
  meses: number,
  now: Date = new Date(),
): CompareEntity[] {
  const monthKeys: string[] = []
  for (let i = meses - 1; i >= 0; i--) {
    const d = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - i, 1))
    monthKeys.push(`${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}`)
  }
  const monthSet = new Set(monthKeys)

  const agg = new Map<string, {
    total: number; verified: number; disputed: number; unverified: number
    1: number; 2: number; 3: number; 4: number; 5: number
    sevSum: number; sevN: number
    monthly: Map<string, number>
  }>()
  for (const k of keys) {
    agg.set(k, {
      total: 0, verified: 0, disputed: 0, unverified: 0,
      1: 0, 2: 0, 3: 0, 4: 0, 5: 0, sevSum: 0, sevN: 0,
      monthly: new Map(),
    })
  }

  for (const r of rows) {
    const b = agg.get(r.key)
    if (!b) continue
    b.total++
    if (r.verification_status === 'verified') b.verified++
    else if (r.verification_status === 'disputed') b.disputed++
    else if (r.verification_status === 'unverified') b.unverified++
    const sv = r.severity_score
    if (sv === 1 || sv === 2 || sv === 3 || sv === 4 || sv === 5) {
      b[sv]++
      b.sevSum += sv
      b.sevN++
    }
    const ym = r.statement_date?.slice(0, 7)
    if (!ym || !monthSet.has(ym)) continue
    b.monthly.set(ym, (b.monthly.get(ym) ?? 0) + 1)
  }

  return keys.map((k) => {
    const b = agg.get(k)!
    return {
      key: k,
      total: b.total,
      verified: b.verified,
      disputed: b.disputed,
      unverified: b.unverified,
      levels: { 1: b[1], 2: b[2], 3: b[3], 4: b[4], 5: b[5] },
      avg_severity: b.sevN > 0 ? +(b.sevSum / b.sevN).toFixed(2) : null,
      monthly: monthKeys.map((m) => ({ month: m, total: b.monthly.get(m) ?? 0 })),
    }
  })
}

/** Returns YYYY-MM-01 string `meses` months ago (UTC). */
export function compareStartStr(meses: number, now: Date = new Date()): string {
  const d = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (meses - 1), 1))
  return d.toISOString().slice(0, 10)
}
