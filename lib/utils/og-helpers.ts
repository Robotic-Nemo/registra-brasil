/**
 * Shared helpers for Open Graph image generation.
 * Used by opengraph-image.tsx across different routes.
 */

/** Standard OG image dimensions */
export const OG_SIZE = { width: 1200, height: 630 } as const

/** Brand gradient used in OG images */
export const OG_GRADIENT = 'linear-gradient(135deg, #1e3a8a 0%, #1d4ed8 50%, #3b82f6 100%)'

/** Shared text styles for OG images */
export const ogStyles = {
  container: {
    width: '100%',
    height: '100%',
    display: 'flex' as const,
    flexDirection: 'column' as const,
    alignItems: 'center' as const,
    justifyContent: 'center' as const,
    background: OG_GRADIENT,
  },
  title: {
    fontSize: 80,
    fontWeight: 800,
    color: '#ffffff',
    letterSpacing: '-2px',
    lineHeight: 1,
  },
  subtitle: {
    fontSize: 28,
    color: '#bfdbfe',
    fontWeight: 400,
    letterSpacing: '0.5px',
  },
  smallTitle: {
    fontSize: 48,
    fontWeight: 700,
    color: '#ffffff',
    letterSpacing: '-1px',
    lineHeight: 1.2,
    textAlign: 'center' as const,
    maxWidth: '80%',
  },
  badge: {
    fontSize: 20,
    color: '#93c5fd',
    fontWeight: 500,
    padding: '6px 16px',
    borderRadius: '9999px',
    border: '1px solid rgba(147, 197, 253, 0.3)',
  },
} as const

/** Truncate text for OG image titles */
export function ogTruncate(text: string, maxLen = 80): string {
  if (text.length <= maxLen) return text
  const truncated = text.slice(0, maxLen)
  const lastSpace = truncated.lastIndexOf(' ')
  return (lastSpace > maxLen * 0.5 ? truncated.slice(0, lastSpace) : truncated) + '...'
}
