/**
 * Shared helpers for the severity × exp(-ageDays/365) ranking decay
 * used by /api/ranking*, /api/top-*, and friends.
 *
 * Previously each caller inlined `new Date(statement_date + 'T12:00:00Z')`.
 * That breaks the moment `statement_date` carries any time component
 * (whether from a schema change or a stray cast) — the concat yields
 * an unparseable string and the age becomes NaN, silently zero-
 * scoring the row. Slicing to the first 10 chars is the one-line
 * defensive fix; centralizing it here keeps every caller aligned.
 */

/** Parse a `statement_date` ('YYYY-MM-DD' or leading-10 variant) as
 *  UTC noon to avoid timezone midnight flip-flops. */
export function statementDateUtc(dateStr: string): number {
  const d = dateStr.slice(0, 10)
  return new Date(`${d}T12:00:00Z`).getTime()
}

/** Age in days from `now` to the statement_date (UTC noon). */
export function ageDaysFromStatementDate(now: number, dateStr: string): number {
  return (now - statementDateUtc(dateStr)) / 86400_000
}

/** severity × exp(-ageDays/365) — the canonical decay score. */
export function decayScore(severity: number, ageDays: number, halfLifeDays = 365): number {
  return severity * Math.exp(-ageDays / halfLifeDays)
}
