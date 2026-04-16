/**
 * Strips HTML tags from a string to prevent XSS from user-submitted content.
 * Uses a simple regex replacement — no external dependencies required.
 *
 * Note: For rich-text rendering, prefer a dedicated library like DOMPurify.
 * This utility is for plain-text contexts (search inputs, display text, etc.).
 */
export function sanitizeHtml(str: string): string {
  // First pass: remove all HTML/XML tags
  let result = str.replace(/<[^>]*>/g, '')
  // Decode common HTML entities
  result = result
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&#039;/g, "'")
    .replace(/&nbsp;/g, ' ')
  // Second pass: remove any tags that were revealed by entity decoding
  // (e.g., &lt;script&gt; decoded to <script> must be stripped)
  result = result.replace(/<[^>]*>/g, '')
  return result
}
