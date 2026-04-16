/**
 * Basic internationalization helpers for PT-BR.
 */

/** Pluralize with PT-BR rules: count === 1 is singular. */
export function plural(count: number, singular: string, pluralForm: string): string {
  return count === 1 ? `1 ${singular}` : `${count} ${pluralForm}`
}

/** Format a number with Brazilian locale (dot as thousands separator, comma as decimal). */
export function formatNumberPtBR(n: number): string {
  return n.toLocaleString('pt-BR')
}

/** Format a percentage with Brazilian locale. */
export function formatPercentPtBR(value: number, decimals = 1): string {
  return `${value.toFixed(decimals).replace('.', ',')}%`
}

/** Common labels used across the app. */
export const LABELS = {
  statements: { singular: 'declaração', plural: 'declarações' },
  politicians: { singular: 'político', plural: 'políticos' },
  categories: { singular: 'categoria', plural: 'categorias' },
  sources: { singular: 'fonte', plural: 'fontes' },
  results: { singular: 'resultado', plural: 'resultados' },
} as const

/** Convenience: pluralize common nouns. e.g. pluralLabel('statements', 5) => "5 declarações" */
export function pluralLabel(key: keyof typeof LABELS, count: number): string {
  const { singular, plural: p } = LABELS[key]
  return plural(count, singular, p)
}

/** Format a Brazilian date range label. */
export function dateRangeLabel(from: string | undefined, to: string | undefined): string {
  if (from && to) return `de ${from} até ${to}`
  if (from) return `a partir de ${from}`
  if (to) return `até ${to}`
  return 'todo o período'
}
