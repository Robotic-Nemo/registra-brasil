/**
 * Common regex patterns for Brazilian data
 */

/** CPF pattern: 000.000.000-00 */
export const CPF_REGEX = /^\d{3}\.\d{3}\.\d{3}-\d{2}$/

/** CNPJ pattern: 00.000.000/0000-00 */
export const CNPJ_REGEX = /^\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}$/

/** Brazilian phone: (00) 00000-0000 or (00) 0000-0000 */
export const PHONE_REGEX = /^\(\d{2}\)\s?\d{4,5}-\d{4}$/

/** CEP: 00000-000 */
export const CEP_REGEX = /^\d{5}-\d{3}$/

/** Date: DD/MM/YYYY */
export const DATE_BR_REGEX = /^\d{2}\/\d{2}\/\d{4}$/

/** ISO date: YYYY-MM-DD */
export const DATE_ISO_REGEX = /^\d{4}-\d{2}-\d{2}$/

/** URL slug */
export const SLUG_REGEX = /^[a-z0-9]+(-[a-z0-9]+)*$/

/** Email */
export const EMAIL_REGEX = /^[^\s@]+@[^\s@]+\.[^\s@]+$/

/** YouTube video ID */
export const YOUTUBE_ID_REGEX = /^[a-zA-Z0-9_-]{11}$/

/** YouTube URL (various formats) */
export const YOUTUBE_URL_REGEX = /(?:youtube\.com\/(?:watch\?v=|embed\/|v\/)|youtu\.be\/)([a-zA-Z0-9_-]{11})/

/**
 * Extract YouTube video ID from a URL
 */
export function extractYouTubeId(url: string | null | undefined): string | null {
  if (!url || typeof url !== 'string') return null
  const match = url.match(YOUTUBE_URL_REGEX)
  return match?.[1] ?? null
}

/**
 * Escape special regex characters
 */
export function escapeRegex(str: string | null | undefined): string {
  if (!str) return ''
  return String(str).replace(/[.*+?^${}()|[\]\\]/g, '\\$&')
}

/**
 * Create a case-insensitive search regex with accent folding
 */
export function createSearchRegex(query: string | null | undefined): RegExp {
  const escaped = escapeRegex(query)
  // Empty pattern would match everywhere — fall back to a never-matching regex.
  if (!escaped) return /(?!)/g
  return new RegExp(escaped, 'gi')
}
