/**
 * Format a number using Brazilian locale (e.g., 1.234, 10.456)
 */
export function formatNumber(n: number): string {
  return n.toLocaleString('pt-BR')
}

/**
 * Format a percentage with Brazilian locale (e.g., 75,3%)
 */
export function formatPercentage(value: number, decimals = 1): string {
  return `${value.toFixed(decimals).replace('.', ',')}%`
}

/**
 * Format a number in compact form (e.g., 1,2k, 45k)
 */
export function formatCompact(n: number): string {
  if (n < 1000) return String(n)
  if (n < 10_000) return `${(n / 1000).toFixed(1).replace('.', ',')}k`
  if (n < 1_000_000) return `${Math.round(n / 1000)}k`
  return `${(n / 1_000_000).toFixed(1).replace('.', ',')}M`
}
