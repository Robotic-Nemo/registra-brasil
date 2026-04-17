/**
 * Severity scoring helpers.
 *
 * Scale: 1 (low) → 5 (critical).
 *
 * Categories carry a baseline severity (1..4) in the DB schema. Individual
 * statements can override with their own severity_score (1..5). The
 * effective severity is: override if set, otherwise the primary category's
 * severity, otherwise 2 as a neutral default.
 */

import type { Category, Statement, StatementWithRelations } from '@/types/database'

export type Severity = 1 | 2 | 3 | 4 | 5

export interface SeverityStyle {
  label: string
  short: string
  bg: string
  border: string
  text: string
  badge: string
  ringClass: string
  /** 0..100 fill percentage for progress-bar style visuals. */
  fillPct: number
}

export const SEVERITY_STYLES: Record<Severity, SeverityStyle> = {
  1: {
    label: 'Baixa gravidade',
    short: 'Baixa',
    bg: 'bg-slate-50',
    border: 'border-slate-200',
    text: 'text-slate-700',
    badge: 'bg-slate-100 text-slate-700 border-slate-200',
    ringClass: 'ring-slate-300',
    fillPct: 20,
  },
  2: {
    label: 'Gravidade moderada',
    short: 'Moderada',
    bg: 'bg-sky-50',
    border: 'border-sky-200',
    text: 'text-sky-800',
    badge: 'bg-sky-100 text-sky-800 border-sky-200',
    ringClass: 'ring-sky-300',
    fillPct: 40,
  },
  3: {
    label: 'Gravidade elevada',
    short: 'Elevada',
    bg: 'bg-amber-50',
    border: 'border-amber-200',
    text: 'text-amber-900',
    badge: 'bg-amber-100 text-amber-900 border-amber-300',
    ringClass: 'ring-amber-300',
    fillPct: 60,
  },
  4: {
    label: 'Gravidade alta',
    short: 'Alta',
    bg: 'bg-orange-50',
    border: 'border-orange-200',
    text: 'text-orange-900',
    badge: 'bg-orange-100 text-orange-900 border-orange-300',
    ringClass: 'ring-orange-400',
    fillPct: 80,
  },
  5: {
    label: 'Crítica',
    short: 'Crítica',
    bg: 'bg-red-50',
    border: 'border-red-200',
    text: 'text-red-900',
    badge: 'bg-red-100 text-red-900 border-red-300',
    ringClass: 'ring-red-400',
    fillPct: 100,
  },
}

const DEFAULT_SEVERITY: Severity = 2

/** Clamp any number/unknown value into the Severity range, else null. */
export function coerceSeverity(value: unknown): Severity | null {
  const n = typeof value === 'number' ? value : Number(value)
  if (!Number.isFinite(n)) return null
  const floored = Math.floor(n)
  if (floored < 1 || floored > 5) return null
  return floored as Severity
}

type CategorySeverityInput = Pick<Category, 'severity'>

/**
 * Effective severity shown to readers.
 *
 * Precedence:
 *  1. statement.severity_score (editorial override)
 *  2. Primary category's severity (or max among categories if no primary flag)
 *  3. DEFAULT_SEVERITY (2)
 */
export function getEffectiveSeverity(
  statement: Pick<Statement, 'severity_score'>,
  categories:
    | Array<{ is_primary?: boolean; categories: CategorySeverityInput | null | undefined }>
    | null
    | undefined,
): Severity {
  const override = coerceSeverity(statement.severity_score)
  if (override !== null) return override

  if (categories && categories.length > 0) {
    const primary = categories.find((sc) => sc.is_primary)?.categories?.severity
    if (primary) return coerceSeverity(primary) ?? DEFAULT_SEVERITY
    // Fall back to the highest-severity category if none is flagged primary.
    let max = 0
    for (const sc of categories) {
      const s = sc.categories?.severity ?? 0
      if (s > max) max = s
    }
    const fallback = coerceSeverity(max)
    if (fallback !== null) return fallback
  }

  return DEFAULT_SEVERITY
}

/** Same as getEffectiveSeverity but keyed off a StatementWithRelations row. */
export function getStatementSeverity(statement: StatementWithRelations): Severity {
  return getEffectiveSeverity(statement, statement.statement_categories)
}

/** Parse a comma-separated severity filter like "4,5" into a Severity[]. */
export function parseSeverityFilter(raw: string | null | undefined): Severity[] | null {
  if (!raw) return null
  const out = new Set<Severity>()
  for (const piece of raw.split(',')) {
    const s = coerceSeverity(piece.trim())
    if (s !== null) out.add(s)
  }
  return out.size > 0 ? Array.from(out).sort() : null
}
