/**
 * Monthly verify-ratio helper — shared by every scope that exposes
 * `/verify-ratio.json` (politico, partidos, estados, categorias).
 *
 * Anchors the start bucket at UTC first-of-month `meses-1` months ago
 * so the series always has exactly `meses` month buckets ending at
 * the current month. Rows arriving outside the window are discarded.
 */

export interface VerifyMonth {
  month: string // YYYY-MM
  verified: number
  disputed: number
  unverified: number
  total: number
  ratio_verified: number | null
}

export interface VerifySummary {
  total: number
  verified: number
  disputed: number
  unverified: number
  ratio_verified: number | null
  ratio_disputed: number | null
}

export interface VerifyRatioInput {
  statement_date: string
  verification_status: string
}

/**
 * Compute the start date string (YYYY-MM-DD) to use as the
 * `.gte('statement_date', ...)` bound for a `meses`-month window.
 */
export function verifyRatioStartStr(meses: number, now: Date = new Date()): string {
  const startY = now.getUTCFullYear()
  const startM = now.getUTCMonth() - (meses - 1)
  return new Date(Date.UTC(startY, startM, 1)).toISOString().slice(0, 10)
}

export function buildVerifyRatio(
  meses: number,
  rows: VerifyRatioInput[],
  now: Date = new Date(),
): { trend: VerifyMonth[]; summary: VerifySummary } {
  const startY = now.getUTCFullYear()
  const startM = now.getUTCMonth() - (meses - 1)

  const trend: VerifyMonth[] = []
  for (let i = 0; i < meses; i++) {
    const d = new Date(Date.UTC(startY, startM + i, 1))
    trend.push({
      month: d.toISOString().slice(0, 7),
      verified: 0, disputed: 0, unverified: 0, total: 0, ratio_verified: null,
    })
  }
  const idx = new Map(trend.map((m, i) => [m.month, i]))

  let verified = 0, disputed = 0, unverified = 0
  for (const r of rows) {
    const key = r.statement_date?.slice(0, 7)
    if (!key) continue
    const i = idx.get(key)
    if (i === undefined) continue
    const b = trend[i]!
    b.total++
    if (r.verification_status === 'verified') { b.verified++; verified++ }
    else if (r.verification_status === 'disputed') { b.disputed++; disputed++ }
    else { b.unverified++; unverified++ }
  }
  for (const m of trend) {
    m.ratio_verified = m.total > 0 ? +(m.verified / m.total).toFixed(3) : null
  }
  const total = verified + disputed + unverified

  const summary: VerifySummary = {
    total, verified, disputed, unverified,
    ratio_verified: total > 0 ? +(verified / total).toFixed(3) : null,
    ratio_disputed: total > 0 ? +(disputed / total).toFixed(3) : null,
  }

  return { trend, summary }
}
