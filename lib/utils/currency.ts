/**
 * Brazilian currency formatting utilities
 */

/**
 * Format a number as BRL currency.
 * Accepts null/undefined for DB-null safety; returns the native Intl output for NaN/Infinity.
 */
export function formatBRL(value: number | null | undefined): string {
  if (value == null) return 'R$ 0,00'
  return new Intl.NumberFormat('pt-BR', {
    style: 'currency',
    currency: 'BRL',
  }).format(value)
}

/**
 * Format compact BRL (e.g., R$ 1.2M).
 * Accepts null/undefined for DB-null safety. Non-finite falls through to the Intl formatter.
 */
export function formatBRLCompact(value: number | null | undefined): string {
  if (value == null) return 'R$ 0,00'
  if (!Number.isFinite(value)) return formatBRL(value)
  if (value >= 1_000_000_000) return `R$ ${(value / 1_000_000_000).toFixed(1)}B`
  if (value >= 1_000_000) return `R$ ${(value / 1_000_000).toFixed(1)}M`
  if (value >= 1_000) return `R$ ${(value / 1_000).toFixed(1)}K`
  return formatBRL(value)
}

/**
 * Parse a Brazilian currency string back to a number
 */
export function parseBRL(str: string | null | undefined): number {
  if (!str) return 0
  const cleaned = String(str)
    .replace(/R\$\s*/g, '')
    .replace(/\./g, '')
    .replace(',', '.')
    .trim()
  const n = parseFloat(cleaned)
  return Number.isFinite(n) ? n : 0
}
