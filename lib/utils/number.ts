/** Format number with Brazilian locale (e.g., 1.234) */
export function formatBR(n: number): string {
  return n.toLocaleString('pt-BR')
}

/** Format as compact (e.g., 1,2K, 3,4M) */
export function formatCompact(n: number): string {
  return new Intl.NumberFormat('pt-BR', {
    notation: 'compact',
    maximumFractionDigits: 1,
  }).format(n)
}

/** Format as percentage */
export function formatPercent(value: number, total: number): string {
  if (total === 0) return '0%'
  return `${Math.round((value / total) * 100)}%`
}

/** Clamp a number between min and max */
export function clamp(value: number, min: number, max: number): number {
  return Math.min(max, Math.max(min, value))
}

/** Parse a page number from search params (defaults to 1, min 1) */
export function parsePage(value: string | null, fallback = 1): number {
  if (!value) return fallback
  const n = parseInt(value, 10)
  return Number.isNaN(n) || n < 1 ? fallback : n
}
