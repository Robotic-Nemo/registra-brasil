/**
 * Input sanitization pipeline — cleans user input before validation/storage.
 */

/** Remove HTML tags */
function stripTags(str: string): string {
  return str.replace(/<[^>]*>/g, '')
}

/** Decode common HTML entities */
function decodeEntities(str: string): string {
  return str
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&#039;/g, "'")
    .replace(/&nbsp;/g, ' ')
}

/** Normalize whitespace */
function normalizeWhitespace(str: string): string {
  return str.replace(/\s+/g, ' ').trim()
}

/** Remove null bytes and other control characters */
function removeControlChars(str: string): string {
  // eslint-disable-next-line no-control-regex
  return str.replace(/[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]/g, '')
}

/** Remove zero-width characters (common in copy-paste attacks) */
function removeZeroWidth(str: string): string {
  return str.replace(/[\u200B-\u200F\u2028-\u202F\uFEFF]/g, '')
}

/**
 * Full sanitization pipeline for text input.
 * Strips HTML, decodes entities, strips again, removes control chars,
 * normalizes whitespace.
 */
export function sanitizeInput(input: string): string {
  let result = input
  result = removeControlChars(result)
  result = removeZeroWidth(result)
  result = stripTags(result)
  result = decodeEntities(result)
  result = stripTags(result) // second pass for encoded tags
  result = normalizeWhitespace(result)
  return result
}

/**
 * Sanitize a URL input — trims whitespace, validates protocol.
 * Returns the sanitized URL or null if invalid.
 */
export function sanitizeUrl(input: string): string | null {
  const trimmed = input.trim()
  try {
    const url = new URL(trimmed)
    if (url.protocol !== 'http:' && url.protocol !== 'https:') return null
    // Rebuild to normalize
    return url.href
  } catch {
    return null
  }
}

/**
 * Sanitize all string values in a FormData-like record.
 */
export function sanitizeFormData(data: Record<string, string>): Record<string, string> {
  const result: Record<string, string> = {}
  for (const [key, value] of Object.entries(data)) {
    result[key] = sanitizeInput(value)
  }
  return result
}

/**
 * Sanitize a slug — lowercase, remove dangerous characters, normalize hyphens.
 */
export function sanitizeSlug(input: string): string {
  return input
    .toLowerCase()
    .replace(/[^a-z0-9-]/g, '')
    .replace(/-+/g, '-')
    .replace(/^-|-$/g, '')
}
