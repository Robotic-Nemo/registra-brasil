/**
 * Count words in a text string.
 */
export function wordCount(text: string): number {
  return text.trim().split(/\s+/).filter(Boolean).length
}

/**
 * Estimate reading time in minutes (Portuguese average ~200 wpm).
 */
export function readingTime(text: string): number {
  return Math.max(1, Math.ceil(wordCount(text) / 200))
}

/**
 * Highlight search terms in text by wrapping matches in <mark> tags.
 * Returns an array of React-renderable parts.
 */
export function highlightTerms(text: string, terms: string[]): string {
  if (!terms.length) return text
  const escaped = terms.map((t) => t.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'))
  const regex = new RegExp(`(${escaped.join('|')})`, 'gi')
  return text.replace(regex, '<mark>$1</mark>')
}

/**
 * Extract initials from a name (e.g., "Jair Bolsonaro" → "JB").
 */
export function getInitials(name: string, maxChars = 2): string {
  return name
    .split(/\s+/)
    .filter(Boolean)
    .slice(0, maxChars)
    .map((w) => w[0]?.toUpperCase() ?? '')
    .join('')
}
