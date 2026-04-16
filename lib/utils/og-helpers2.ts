/**
 * Additional OG image generation helpers.
 * Complements og-helpers.ts with more specialized utilities.
 */

export interface OgTextStyle {
  fontSize: number
  fontWeight: number
  color: string
  lineHeight: number
}

/**
 * Truncate text to fit within a max width (approximate character count).
 */
export function truncateForOg(text: string, maxChars: number = 120): string {
  if (text.length <= maxChars) return text
  return text.slice(0, maxChars - 3).trimEnd() + '...'
}

/**
 * Generate a gradient background CSS value for OG images.
 */
export function generateOgGradient(
  from: string = '#1e3a8a',
  to: string = '#1d4ed8',
  angle: number = 135
): string {
  return `linear-gradient(${angle}deg, ${from}, ${to})`
}

/**
 * Generate a verification status badge config for OG images.
 */
export function getStatusBadgeConfig(status: string): {
  label: string
  bgColor: string
  textColor: string
} {
  switch (status) {
    case 'verified':
      return { label: 'Verificado', bgColor: '#dcfce7', textColor: '#166534' }
    case 'unverified':
      return { label: 'Nao verificado', bgColor: '#fef9c3', textColor: '#854d0e' }
    case 'disputed':
      return { label: 'Disputado', bgColor: '#fee2e2', textColor: '#991b1b' }
    case 'removed':
      return { label: 'Removido', bgColor: '#f3f4f6', textColor: '#374151' }
    default:
      return { label: status, bgColor: '#f3f4f6', textColor: '#374151' }
  }
}

/**
 * Format a date for display on OG images (compact format).
 */
export function formatDateForOg(dateStr: string): string {
  try {
    const date = new Date(dateStr)
    return date.toLocaleDateString('pt-BR', {
      day: '2-digit',
      month: 'short',
      year: 'numeric',
    })
  } catch {
    return dateStr
  }
}

/**
 * Calculate optimal text layout for OG images.
 * Returns recommended font size and line count.
 */
export function calculateOgTextLayout(
  text: string,
  maxWidth: number = 1000,
  options?: { minFontSize?: number; maxFontSize?: number }
): { fontSize: number; lines: number; truncatedText: string } {
  const minFont = options?.minFontSize ?? 24
  const maxFont = options?.maxFontSize ?? 48
  const avgCharWidth = 0.55

  const charCount = text.length
  const charsPerLine = Math.floor(maxWidth / (maxFont * avgCharWidth))
  const estimatedLines = Math.ceil(charCount / charsPerLine)

  let fontSize = maxFont
  let lines = estimatedLines

  if (estimatedLines > 3) {
    fontSize = Math.max(minFont, Math.floor(maxFont * (3 / estimatedLines)))
    const newCharsPerLine = Math.floor(maxWidth / (fontSize * avgCharWidth))
    lines = Math.min(4, Math.ceil(charCount / newCharsPerLine))
  }

  const maxChars = Math.floor(maxWidth / (fontSize * avgCharWidth)) * 4
  const truncatedText = truncateForOg(text, maxChars)

  return { fontSize, lines, truncatedText }
}

/**
 * Generate a simple hash color from a string (useful for avatars).
 */
export function stringToColor(str: string): string {
  let hash = 0
  for (let i = 0; i < str.length; i++) {
    hash = str.charCodeAt(i) + ((hash << 5) - hash)
  }
  const hue = Math.abs(hash) % 360
  return `hsl(${hue}, 55%, 45%)`
}
