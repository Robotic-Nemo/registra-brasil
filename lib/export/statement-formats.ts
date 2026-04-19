/**
 * Shared CSV / BibTeX helpers for the statement-archive export routes.
 * Deduplicates the logic that was copy-pasted across the collection,
 * politician, and category export endpoints so new scopes (party,
 * state, future ones) only need to supply the SELECT query.
 */

const FORMULA_PREFIX = /^[=+\-@\t\r]/

export function csvEscape(v: unknown): string {
  if (v === null || v === undefined) return ''
  let s = String(v)
  if (FORMULA_PREFIX.test(s)) s = "'" + s
  if (/[",\n\r]/.test(s)) s = `"${s.replace(/"/g, '""')}"`
  return s
}

export function bibtexEscape(s: string): string {
  return s
    .replace(/\\/g, '\\textbackslash ')
    .replace(/&/g, '\\&')
    .replace(/%/g, '\\%')
    .replace(/#/g, '\\#')
    .replace(/_/g, '\\_')
    .replace(/\{/g, '\\{')
    .replace(/\}/g, '\\}')
    .replace(/\$/g, '\\$')
    .replace(/~/g, '\\textasciitilde ')
    .replace(/\^/g, '\\^')
}

export function bibtexCitekey(politicianSlug: string, date: string, id: string): string {
  const year = date.slice(0, 4)
  const slug = politicianSlug.replace(/-/g, '').slice(0, 24)
  return `rb-${slug}-${year}-${id.slice(0, 6)}`
}
