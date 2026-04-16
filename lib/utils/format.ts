/**
 * Format a number using Brazilian locale (e.g., 1.234, 10.456)
 */
export function formatNumber(n: number | null | undefined): string {
  if (n == null || !Number.isFinite(n)) return '0'
  return n.toLocaleString('pt-BR')
}

/**
 * Format a percentage with Brazilian locale (e.g., 75,3%)
 */
export function formatPercentage(value: number | null | undefined, decimals = 1): string {
  if (value == null || !Number.isFinite(value)) return '0%'
  return `${value.toFixed(decimals).replace('.', ',')}%`
}

/**
 * Format a number in compact form (e.g., 1,2k, 45k)
 */
export function formatCompact(n: number | null | undefined): string {
  if (n == null || !Number.isFinite(n)) return '0'
  // Handle negatives to avoid odd output like "-1500" → "-1500"
  if (n < 0) return `-${formatCompact(-n)}`
  if (n < 1000) return String(n)
  if (n < 10_000) return `${(n / 1000).toFixed(1).replace('.', ',')}k`
  if (n < 1_000_000) return `${Math.round(n / 1000)}k`
  if (n < 1_000_000_000) return `${(n / 1_000_000).toFixed(1).replace('.', ',')}M`
  return `${(n / 1_000_000_000).toFixed(1).replace('.', ',')}B`
}
