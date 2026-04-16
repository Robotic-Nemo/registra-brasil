/**
 * Truncates a string at word boundaries and appends "..." if truncated.
 * Does not split in the middle of a word.
 */
export function truncate(str: string, maxLen: number): string {
  if (str.length <= maxLen) return str

  // Try to find a word boundary to break at
  const sub = str.slice(0, maxLen)
  const lastSpace = sub.lastIndexOf(' ')

  const cut = lastSpace > 0 ? sub.slice(0, lastSpace) : sub
  return cut.trimEnd() + '...'
}
