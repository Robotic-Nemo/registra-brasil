/**
 * Per-row validator for bulk statement imports. Returns a normalized
 * row ready to insert or a list of human-readable errors.
 *
 * Expected columns (header case-insensitive):
 *   - politico_slug OR politico   (slug OR common_name; resolved to id)
 *   - resumo | summary            (required, 10–1000 chars)
 *   - citacao | full_quote        (optional, ≤5000)
 *   - contexto | context          (optional, ≤2000)
 *   - data | statement_date       (required, YYYY-MM-DD, not future)
 *   - local | venue               (optional, ≤300)
 *   - evento | event_name         (optional, ≤300)
 *   - fonte_url | source_url      (required, http(s), public host)
 *   - fonte_tipo | source_type    (required, enum)
 *   - status                      (optional; default 'unverified')
 *   - severidade | severity       (optional, 1–5)
 *   - categorias                  (optional, semicolon-separated slugs)
 */

export interface RawImportRow { [k: string]: string }

export interface NormalizedImportRow {
  politician_lookup: { slug: string } | { common_name: string }
  summary: string
  full_quote: string | null
  context: string | null
  statement_date: string
  venue: string | null
  event_name: string | null
  primary_source_url: string
  primary_source_type: string
  verification_status: 'verified' | 'unverified' | 'disputed'
  severity_score: number | null
  category_slugs: string[]
}

export interface RowValidation {
  lineNumber: number
  ok: boolean
  errors: string[]
  row?: NormalizedImportRow
}

const VALID_SOURCE_TYPES = new Set([
  'news_article', 'other', 'social_media_post', 'transcript_pdf',
  'youtube_video', 'diario_oficial', 'youtube_live_archive',
])
const VALID_STATUS = new Set(['verified', 'unverified', 'disputed'])

const BLOCKED_HOSTS = /^(localhost|127\.|0\.|10\.|169\.254\.|192\.168\.|172\.(1[6-9]|2\d|3[01])\.|::1|fe80:|fc00:|fd)/i

function pick(row: RawImportRow, ...keys: string[]): string {
  for (const k of keys) {
    const v = row[k]
    if (v !== undefined && v !== '') return v
  }
  return ''
}

function isoDate(s: string): boolean {
  return /^\d{4}-\d{2}-\d{2}$/.test(s) && !Number.isNaN(Date.parse(s))
}

function validUrl(u: string): boolean {
  if (!u || u.length > 2048) return false
  try {
    const p = new URL(u)
    if (p.protocol !== 'http:' && p.protocol !== 'https:') return false
    if (BLOCKED_HOSTS.test(p.hostname)) return false
    if (p.username || p.password) return false
    return true
  } catch { return false }
}

export function validateRow(row: RawImportRow, lineNumber: number): RowValidation {
  const errors: string[] = []

  const polSlug = pick(row, 'politico_slug', 'politician_slug').trim()
  const polName = pick(row, 'politico', 'politician', 'common_name').trim()
  if (!polSlug && !polName) errors.push('Falta coluna politico_slug ou politico')

  const summary = pick(row, 'resumo', 'summary')
  if (!summary) errors.push('resumo obrigatório')
  else if (summary.length < 10) errors.push('resumo muito curto (<10)')
  else if (summary.length > 1000) errors.push('resumo muito longo (>1000)')

  const full_quote = pick(row, 'citacao', 'citacao_completa', 'full_quote') || null
  if (full_quote && full_quote.length > 5000) errors.push('citação >5000 chars')
  const context = pick(row, 'contexto', 'context') || null
  if (context && context.length > 2000) errors.push('contexto >2000 chars')

  const statement_date = pick(row, 'data', 'statement_date')
  if (!statement_date) errors.push('data obrigatória (YYYY-MM-DD)')
  else if (!isoDate(statement_date)) errors.push('data inválida (esperado YYYY-MM-DD)')
  else if (new Date(statement_date) > new Date()) errors.push('data no futuro')

  const venue = pick(row, 'local', 'venue') || null
  if (venue && venue.length > 300) errors.push('local >300 chars')
  const event_name = pick(row, 'evento', 'event_name') || null
  if (event_name && event_name.length > 300) errors.push('evento >300 chars')

  const primary_source_url = pick(row, 'fonte_url', 'source_url', 'url')
  if (!primary_source_url) errors.push('fonte_url obrigatória')
  else if (!validUrl(primary_source_url)) errors.push('fonte_url inválida ou bloqueada (SSRF)')

  const primary_source_type_raw = pick(row, 'fonte_tipo', 'source_type') || 'other'
  const primary_source_type = primary_source_type_raw.toLowerCase()
  if (!VALID_SOURCE_TYPES.has(primary_source_type)) {
    errors.push(`fonte_tipo inválido (aceito: ${[...VALID_SOURCE_TYPES].join(', ')})`)
  }

  const statusRaw = (pick(row, 'status') || 'unverified').toLowerCase()
  if (!VALID_STATUS.has(statusRaw)) errors.push('status inválido')
  const verification_status = statusRaw as 'verified' | 'unverified' | 'disputed'

  const sevRaw = pick(row, 'severidade', 'severity', 'severity_score')
  let severity_score: number | null = null
  if (sevRaw) {
    const n = parseInt(sevRaw, 10)
    if (Number.isNaN(n) || n < 1 || n > 5) errors.push('severidade fora de 1–5')
    else severity_score = n
  }

  const catsRaw = pick(row, 'categorias', 'categories', 'category_slugs')
  const category_slugs = catsRaw
    ? catsRaw.split(/[;,]/).map((s) => s.trim().toLowerCase()).filter(Boolean)
    : []

  if (errors.length > 0) return { lineNumber, ok: false, errors }

  const politician_lookup: { slug: string } | { common_name: string } = polSlug
    ? { slug: polSlug }
    : { common_name: polName }

  return {
    lineNumber,
    ok: true,
    errors: [],
    row: {
      politician_lookup,
      summary,
      full_quote,
      context,
      statement_date,
      venue,
      event_name,
      primary_source_url,
      primary_source_type,
      verification_status,
      severity_score,
      category_slugs,
    },
  }
}
