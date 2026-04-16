/**
 * Brazilian currency formatting utilities
 */

/**
 * Format a number as BRL currency
 */
export function formatBRL(value: number): string {
  return new Intl.NumberFormat('pt-BR', {
    style: 'currency',
    currency: 'BRL',
  }).format(value)
}

/**
 * Format compact BRL (e.g., R$ 1,2M)
 */
export function formatBRLCompact(value: number): string {
  if (!Number.isFinite(value)) return formatBRL(value)
  if (value >= 1_000_000_000) return `R$ ${(value / 1_000_000_000).toFixed(1)}B`
  if (value >= 1_000_000) return `R$ ${(value / 1_000_000).toFixed(1)}M`
  if (value >= 1_000) return `R$ ${(value / 1_000).toFixed(1)}K`
  return formatBRL(value)
}

/**
 * Parse a Brazilian currency string back to a number
 */
export function parseBRL(str: string): number {
  const cleaned = str
    .replace(/R\$\s?/, '')
    .replace(/\./g, '')
    .replace(',', '.')
    .trim()
  return parseFloat(cleaned) || 0
}
