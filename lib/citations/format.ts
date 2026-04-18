/**
 * Academic citation formatters for Registra Brasil statements.
 *
 * Four styles are supported (ABNT, APA, Chicago, MLA). All produce a
 * plain string suitable for copy-paste into LaTeX / Word / markdown.
 * Dates are rendered in pt-BR (dd 'de' MMMM 'de' yyyy) except where the
 * style demands otherwise (APA / MLA — English month names still kept
 * in pt-BR since the cited material is in Portuguese).
 */

export interface CitationInput {
  politicianName: string
  politicianPartyState?: string          // "(PT-SP)" or just "(PT)"
  statementDate: string                  // YYYY-MM-DD
  summary: string
  primarySourceUrl: string
  permalink: string                      // canonical URL at registrabrasil.com.br
  accessDate?: Date                      // defaults to today
}

const MONTHS_PT = [
  'janeiro', 'fevereiro', 'março', 'abril', 'maio', 'junho',
  'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro',
]

function parseDate(iso: string): Date {
  return new Date(`${iso}T00:00:00Z`)
}

function ptLongDate(d: Date): string {
  return `${d.getUTCDate()} de ${MONTHS_PT[d.getUTCMonth()]} de ${d.getUTCFullYear()}`
}

function ptShortDate(d: Date): string {
  return `${String(d.getUTCDate()).padStart(2, '0')}/${String(d.getUTCMonth() + 1).padStart(2, '0')}/${d.getUTCFullYear()}`
}

function splitName(name: string): { last: string; first: string } {
  const tokens = name.trim().split(/\s+/)
  if (tokens.length < 2) return { last: name.toUpperCase(), first: '' }
  const last = tokens[tokens.length - 1]
  const first = tokens.slice(0, -1).join(' ')
  return { last: last.toUpperCase(), first }
}

/**
 * ABNT (NBR 6023/2018) — the default for Brazilian academic writing.
 */
export function abnt(input: CitationInput): string {
  const { last, first } = splitName(input.politicianName)
  const date = parseDate(input.statementDate)
  const access = (input.accessDate ?? new Date())
  const trimmedSummary = input.summary.length > 160 ? input.summary.slice(0, 157) + '...' : input.summary
  return [
    `${last}, ${first}.`,
    `${trimmedSummary}. [Declaração registrada em ${ptLongDate(date)}].`,
    `Registra Brasil, ${date.getUTCFullYear()}.`,
    `Disponível em: ${input.permalink}.`,
    `Acesso em: ${ptLongDate(access)}.`,
  ].join(' ')
}

/**
 * APA 7 — common in social sciences.
 */
export function apa(input: CitationInput): string {
  const { last, first } = splitName(input.politicianName)
  const initial = first ? first.split(/\s+/).map((p) => p[0]?.toUpperCase() + '.').join(' ') : ''
  const date = parseDate(input.statementDate)
  const dateStr = `${date.getUTCFullYear()}, ${date.getUTCDate()} ${MONTHS_PT[date.getUTCMonth()]}`
  const summary = input.summary.length > 160 ? input.summary.slice(0, 157) + '...' : input.summary
  return `${last}, ${initial} (${dateStr}). ${summary} [Registro editorial]. Registra Brasil. ${input.permalink}`
}

/**
 * Chicago (Author-Date, 17th ed).
 */
export function chicago(input: CitationInput): string {
  const { last, first } = splitName(input.politicianName)
  const date = parseDate(input.statementDate)
  const summary = input.summary.length > 160 ? input.summary.slice(0, 157) + '...' : input.summary
  return `${last}, ${first}. ${date.getUTCFullYear()}. "${summary}." Registra Brasil. ${ptLongDate(date)}. ${input.permalink}.`
}

/**
 * MLA 9.
 */
export function mla(input: CitationInput): string {
  const { last, first } = splitName(input.politicianName)
  const date = parseDate(input.statementDate)
  const access = input.accessDate ?? new Date()
  const summary = input.summary.length > 160 ? input.summary.slice(0, 157) + '...' : input.summary
  return `${last}, ${first}. "${summary}." Registra Brasil, ${ptShortDate(date)}, ${input.permalink}. Acesso em ${ptShortDate(access)}.`
}

/**
 * Bare URL + access date — for inline journalistic references.
 */
export function plain(input: CitationInput): string {
  const access = input.accessDate ?? new Date()
  return `${input.politicianName}${input.politicianPartyState ? ' ' + input.politicianPartyState : ''}, declaração em ${ptShortDate(parseDate(input.statementDate))}. Registra Brasil. ${input.permalink} (acesso em ${ptShortDate(access)}).`
}

export const CITATION_STYLES = [
  { key: 'abnt', label: 'ABNT', fn: abnt },
  { key: 'apa', label: 'APA 7', fn: apa },
  { key: 'chicago', label: 'Chicago', fn: chicago },
  { key: 'mla', label: 'MLA 9', fn: mla },
  { key: 'plain', label: 'Referência simples', fn: plain },
] as const
export type CitationStyleKey = (typeof CITATION_STYLES)[number]['key']
