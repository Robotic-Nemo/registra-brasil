/**
 * Wayback Machine / Archive.org integration utilities.
 */

const WAYBACK_API_BASE = 'https://archive.org/wayback/available'

export interface WaybackSnapshot {
  url: string
  timestamp: string
  status: string
}

/**
 * Check if a URL has a snapshot in the Wayback Machine.
 */
export async function getWaybackSnapshot(url: string): Promise<WaybackSnapshot | null> {
  try {
    const apiUrl = `${WAYBACK_API_BASE}?url=${encodeURIComponent(url)}`
    const response = await fetch(apiUrl, { next: { revalidate: 86400 } })
    if (!response.ok) return null

    const data = (await response.json()) as {
      archived_snapshots?: {
        closest?: { url?: string; timestamp?: string; status?: string; available?: boolean }
      }
    }

    const snapshot = data?.archived_snapshots?.closest
    if (!snapshot?.available || !snapshot.url) return null

    return {
      url: snapshot.url,
      timestamp: snapshot.timestamp ?? '',
      status: snapshot.status ?? '',
    }
  } catch {
    return null
  }
}

/**
 * Build a Wayback Machine URL for a given URL and optional timestamp.
 */
export function buildWaybackUrl(url: string, timestamp?: string): string {
  const ts = timestamp ?? '*'
  return `https://web.archive.org/web/${ts}/${url}`
}

/**
 * Request the Wayback Machine to save a snapshot of a URL.
 * Note: This is a best-effort operation and may not always succeed.
 */
export async function requestWaybackSave(url: string): Promise<{ success: boolean; archiveUrl?: string }> {
  try {
    const saveUrl = `https://web.archive.org/save/${url}`
    const response = await fetch(saveUrl, { method: 'GET', redirect: 'follow' })

    if (response.ok || response.status === 302) {
      const contentLocation = response.headers.get('content-location')
      return {
        success: true,
        archiveUrl: contentLocation
          ? `https://web.archive.org${contentLocation}`
          : buildWaybackUrl(url),
      }
    }

    return { success: false }
  } catch {
    return { success: false }
  }
}
