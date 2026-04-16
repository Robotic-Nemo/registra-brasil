/**
 * Image utility helpers
 */

/**
 * Generate a placeholder SVG data URI for blur-up loading
 */
export function placeholderDataUri(width: number, height: number, color = '#e4e4e7'): string {
  const svg = `<svg xmlns="http://www.w3.org/2000/svg" width="${width}" height="${height}" viewBox="0 0 ${width} ${height}"><rect fill="${color}" width="${width}" height="${height}"/></svg>`
  return `data:image/svg+xml;base64,${btoa(svg)}`
}

/**
 * Generate initials avatar SVG data URI
 */
export function initialsAvatar(name: string, size = 128): string {
  const initials = name
    .split(' ')
    .filter(Boolean)
    .map(w => w[0])
    .slice(0, 2)
    .join('')
    .toUpperCase()

  // Generate consistent color from name
  let hash = 0
  for (let i = 0; i < name.length; i++) {
    hash = name.charCodeAt(i) + ((hash << 5) - hash)
  }
  const hue = Math.abs(hash % 360)
  const bgColor = `hsl(${hue}, 40%, 60%)`

  const svg = `<svg xmlns="http://www.w3.org/2000/svg" width="${size}" height="${size}" viewBox="0 0 ${size} ${size}">
    <rect fill="${bgColor}" width="${size}" height="${size}" rx="${size / 2}"/>
    <text x="50%" y="50%" dominant-baseline="central" text-anchor="middle" fill="white" font-family="system-ui, sans-serif" font-size="${size * 0.4}" font-weight="600">${initials}</text>
  </svg>`

  return `data:image/svg+xml;base64,${btoa(svg)}`
}

/**
 * Check if a URL is a valid image URL
 */
export function isImageUrl(url: string): boolean {
  try {
    const parsed = new URL(url)
    const ext = parsed.pathname.split('.').pop()?.toLowerCase()
    return ['jpg', 'jpeg', 'png', 'gif', 'webp', 'avif', 'svg'].includes(ext ?? '')
  } catch {
    return false
  }
}

/**
 * Get optimized image dimensions maintaining aspect ratio
 */
export function fitDimensions(
  originalWidth: number,
  originalHeight: number,
  maxWidth: number,
  maxHeight: number
): { width: number; height: number } {
  const ratio = Math.min(maxWidth / originalWidth, maxHeight / originalHeight, 1)
  return {
    width: Math.round(originalWidth * ratio),
    height: Math.round(originalHeight * ratio),
  }
}
