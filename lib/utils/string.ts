/** Capitalize first letter */
export function capitalize(str: string | null | undefined): string {
  if (!str) return ''
  return str.charAt(0).toUpperCase() + str.slice(1)
}

/** Convert to slug (URL-safe string) */
export function slugify(str: string): string {
  return str
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-|-$/g, '')
}

/** Pluralize a Brazilian Portuguese word (simple) */
export function pluralizePt(count: number, singular: string, plural: string): string {
  return count === 1 ? singular : plural
}

/** Remove HTML tags from a string */
export function stripHtml(html: string | null | undefined): string {
  if (!html) return ''
  return html
    .replace(/<[^>]*>/g, '')
    // Decode common HTML entities
    .replace(/&nbsp;/g, ' ')
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&#39;/g, "'")
    .replace(/&apos;/g, "'")
}

/** Truncate at word boundary */
export function truncateWords(str: string | null | undefined, maxWords: number): string {
  if (!str) return ''
  if (!Number.isFinite(maxWords) || maxWords <= 0) return ''
  const words = str.trim().split(/\s+/).filter(Boolean)
  if (words.length <= maxWords) return str
  return words.slice(0, maxWords).join(' ') + '…'
}
