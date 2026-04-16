/**
 * Multi-value filter parsing utilities for API v2.
 *
 * Handles comma-separated filter values like `?party=PT,PSOL&state=SP,RJ`.
 */

/**
 * Parse a comma-separated query parameter into an array of strings.
 * Returns null if the parameter is not present.
 */
export function parseMultiValue(raw: string | null): string[] | null {
  if (!raw || raw.trim() === '') return null
  return raw
    .split(',')
    .map(v => v.trim())
    .filter(Boolean)
}

/**
 * Parse a comma-separated query parameter and uppercase each value.
 * Useful for party/state codes.
 */
export function parseMultiValueUpper(raw: string | null): string[] | null {
  const values = parseMultiValue(raw)
  return values ? values.map(v => v.toUpperCase()) : null
}

/**
 * Parse a comma-separated query parameter and lowercase each value.
 * Useful for category slugs.
 */
export function parseMultiValueLower(raw: string | null): string[] | null {
  const values = parseMultiValue(raw)
  return values ? values.map(v => v.toLowerCase()) : null
}

/**
 * Validate a date string (YYYY-MM-DD format).
 */
export function isValidDate(date: string): boolean {
  return /^\d{4}-\d{2}-\d{2}$/.test(date) && !Number.isNaN(Date.parse(date))
}

/**
 * Parse include param into an array of relation names.
 * e.g. `include=politician,categories` -> ['politician', 'categories']
 */
export function parseInclude<T extends string>(
  raw: string | null,
  allowed: T[]
): T[] {
  if (!raw) return []
  const requested = raw.split(',').map(v => v.trim()) as T[]
  return requested.filter(v => allowed.includes(v))
}

/**
 * Parse a severity array (comma-separated integers).
 */
export function parseSeverity(raw: string | null): number[] | null {
  if (!raw) return null
  const values = raw
    .split(',')
    .map(v => Number(v.trim()))
    .filter(v => !Number.isNaN(v) && v >= 1 && v <= 4)
  return values.length > 0 ? values : null
}
