/** Capitalize first letter */
export function capitalize(str: string): string {
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
export function stripHtml(html: string): string {
  return html.replace(/<[^>]*>/g, '')
}

/** Truncate at word boundary */
export function truncateWords(str: string, maxWords: number): string {
  const words = str.split(/\s+/)
  if (words.length <= maxWords) return str
  return words.slice(0, maxWords).join(' ') + '…'
}
