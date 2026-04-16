/**
 * Statement validation before database write.
 * Combines sanitization + schema validation.
 */
import { sanitizeInput, sanitizeUrl } from './sanitize'
import { isValidDate, isDateNotFuture } from '@/lib/utils/validators'

const VALID_SOURCE_TYPES = new Set([
  'youtube_video', 'youtube_live_archive', 'camara_tv', 'senado_tv',
  'diario_oficial', 'transcript_pdf', 'news_article', 'social_media_post', 'other',
])

export interface StatementInput {
  politician_slug: string
  summary: string
  full_quote?: string | null
  context?: string | null
  statement_date: string
  statement_date_approx?: boolean
  primary_source_url: string
  primary_source_type: string
  youtube_timestamp_sec?: number | null
  transcript_excerpt?: string | null
  venue?: string | null
  event_name?: string | null
  editor_notes?: string | null
  submitted_by?: string | null
  categories: string[]
}

export interface ValidatedStatement {
  politician_slug: string
  summary: string
  full_quote: string | null
  context: string | null
  statement_date: string
  statement_date_approx: boolean
  primary_source_url: string
  primary_source_type: string
  youtube_timestamp_sec: number | null
  transcript_excerpt: string | null
  venue: string | null
  event_name: string | null
  editor_notes: string | null
  submitted_by: string | null
  categories: string[]
}

export type StatementValidationResult =
  | { ok: true; data: ValidatedStatement }
  | { ok: false; message: string }

/**
 * Validate and sanitize a statement before writing to the database.
 */
export function validateStatement(input: StatementInput): StatementValidationResult {
  // Sanitize text fields
  const summary = sanitizeInput(input.summary).trim()
  const fullQuote = input.full_quote ? sanitizeInput(input.full_quote).trim() || null : null
  const context = input.context ? sanitizeInput(input.context).trim() || null : null
  const transcriptExcerpt = input.transcript_excerpt ? sanitizeInput(input.transcript_excerpt).trim() || null : null
  const venue = input.venue ? sanitizeInput(input.venue).trim() || null : null
  const eventName = input.event_name ? sanitizeInput(input.event_name).trim() || null : null
  const editorNotes = input.editor_notes ? sanitizeInput(input.editor_notes).trim() || null : null
  const submittedBy = input.submitted_by ? sanitizeInput(input.submitted_by).trim() || null : null
  const politicianSlug = input.politician_slug.trim()
  const categories = input.categories.filter(c => c.trim().length > 0)

  // Required fields
  if (!politicianSlug) return { ok: false, message: 'Político é obrigatório.' }
  if (!summary || summary.length < 10) return { ok: false, message: 'Resumo deve ter pelo menos 10 caracteres.' }
  if (summary.length > 500) return { ok: false, message: 'Resumo deve ter no máximo 500 caracteres.' }
  if (categories.length === 0) return { ok: false, message: 'Selecione pelo menos uma categoria.' }

  // Date validation
  if (!isValidDate(input.statement_date)) {
    return { ok: false, message: 'Data inválida. Use o formato AAAA-MM-DD.' }
  }

  // URL validation
  const sanitizedUrl = sanitizeUrl(input.primary_source_url)
  if (!sanitizedUrl) return { ok: false, message: 'URL da fonte primária inválida.' }

  // Source type validation
  if (!VALID_SOURCE_TYPES.has(input.primary_source_type)) {
    return { ok: false, message: 'Tipo de fonte inválido.' }
  }

  // Timestamp validation
  const timestampSec = input.youtube_timestamp_sec ?? null
  if (timestampSec !== null) {
    if (!Number.isInteger(timestampSec) || timestampSec < 0 || timestampSec > 86400) {
      return { ok: false, message: 'Timestamp inválido (deve ser entre 0 e 86400 segundos).' }
    }
  }

  // Length constraints on optional fields
  if (fullQuote && fullQuote.length > 5000) return { ok: false, message: 'Citação completa deve ter no máximo 5000 caracteres.' }
  if (context && context.length > 2000) return { ok: false, message: 'Contexto deve ter no máximo 2000 caracteres.' }

  return {
    ok: true,
    data: {
      politician_slug: politicianSlug,
      summary,
      full_quote: fullQuote,
      context,
      statement_date: input.statement_date,
      statement_date_approx: input.statement_date_approx ?? false,
      primary_source_url: sanitizedUrl,
      primary_source_type: input.primary_source_type,
      youtube_timestamp_sec: timestampSec,
      transcript_excerpt: transcriptExcerpt,
      venue,
      event_name: eventName,
      editor_notes: editorNotes,
      submitted_by: submittedBy,
      categories,
    },
  }
}
