/**
 * Count words in a text string.
 */
export function wordCount(text: string | null | undefined): number {
  if (!text) return 0
  return text.trim().split(/\s+/).filter(Boolean).length
}

/**
 * Estimate reading time in minutes (Portuguese average ~200 wpm).
 */
export function readingTime(text: string | null | undefined): number {
  return Math.max(1, Math.ceil(wordCount(text) / 200))
}

/**
 * Highlight search terms in text by wrapping matches in <mark> tags.
 * Escapes the source text to prevent HTML injection.
 */
export function highlightTerms(text: string | null | undefined, terms: string[]): string {
  if (!text) return ''
  const cleanTerms = (terms ?? []).filter((t) => typeof t === 'string' && t.length > 0)
  const escapedText = String(text)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
  if (cleanTerms.length === 0) return escapedText
  const escapedTerms = cleanTerms.map((t) => t.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'))
  const regex = new RegExp(`(${escapedTerms.join('|')})`, 'gi')
  return escapedText.replace(regex, '<mark>$1</mark>')
}

/**
 * Extract initials from a name (e.g., "Jair Bolsonaro" → "JB").
 */
export function getInitials(name: string | null | undefined, maxChars = 2): string {
  if (!name) return ''
  return name
    .split(/\s+/)
    .filter(Boolean)
    .slice(0, maxChars)
    .map((w) => w[0]?.toUpperCase() ?? '')
    .join('')
}
