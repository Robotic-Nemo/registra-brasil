/**
 * Returns true if the string is a valid URL.
 */
export function isValidUrl(str: string): boolean {
  try {
    new URL(str)
    return true
  } catch {
    return false
  }
}

/**
 * Returns the hostname of a URL (e.g. "youtube.com"), or null if invalid.
 */
export function getDomain(url: string): string | null {
  try {
    return new URL(url).hostname
  } catch {
    return null
  }
}

/**
 * Returns true if the URL is a YouTube URL.
 */
export function isYouTubeUrl(url: string): boolean {
  try {
    const { hostname } = new URL(url)
    return hostname === 'youtube.com' || hostname === 'www.youtube.com' || hostname === 'youtu.be'
  } catch {
    return false
  }
}
