/**
 * Internet Archive "Wayback Machine" availability lookup.
 *
 * https://archive.org/help/wayback_api.php
 *
 * We use the free availability API, which returns the single
 * closest-in-time snapshot. No API key needed; ~1s typical latency.
 * 5s timeout keeps the link-checker batch bounded.
 */

const USER_AGENT = 'RegistraBrasilLinkChecker/1.0 (+https://registrabrasil.com.br)'
const TIMEOUT_MS = 5000

export interface WaybackSnapshot {
  url: string
  timestamp: string // YYYYMMDDHHMMSS from Archive
  status: number | null
}

interface AvailabilityResponse {
  archived_snapshots?: {
    closest?: {
      available?: boolean
      url?: string
      timestamp?: string
      status?: string
    }
  }
}

/**
 * Fire-and-forget Save Page Now submission. Internet Archive accepts
 * unauthenticated GET to /save/<url> and triggers an async crawl.
 * We don't wait for completion — the next scheduled availability
 * query picks up the fresh snapshot.
 */
export async function submitSavePageNow(sourceUrl: string): Promise<boolean> {
  if (!/^https?:\/\//.test(sourceUrl)) return false
  const api = `https://web.archive.org/save/${sourceUrl}`
  try {
    const res = await fetch(api, {
      method: 'GET',
      headers: { 'User-Agent': USER_AGENT, Accept: 'text/html' },
      redirect: 'manual',
      signal: AbortSignal.timeout(TIMEOUT_MS),
    })
    // 200/302 accepted. 429 = rate-limited; 5xx = transient.
    return res.status < 500 && res.status !== 429
  } catch {
    return false
  }
}

export async function getClosestSnapshot(sourceUrl: string): Promise<WaybackSnapshot | null> {
  if (!/^https?:\/\//.test(sourceUrl)) return null
  const api = `https://archive.org/wayback/available?url=${encodeURIComponent(sourceUrl)}`
  try {
    const res = await fetch(api, {
      headers: { 'User-Agent': USER_AGENT, Accept: 'application/json' },
      signal: AbortSignal.timeout(TIMEOUT_MS),
    })
    if (!res.ok) return null
    const json = (await res.json()) as AvailabilityResponse
    const closest = json.archived_snapshots?.closest
    if (!closest?.available || !closest.url) return null
    return {
      url: closest.url,
      timestamp: closest.timestamp ?? '',
      status: closest.status ? parseInt(closest.status, 10) : null,
    }
  } catch {
    return null
  }
}

/**
 * Parse a YYYYMMDDHHMMSS timestamp into ISO. Returns null if malformed.
 */
export function waybackTimestampToIso(ts: string): string | null {
  if (!/^\d{14}$/.test(ts)) return null
  const y = ts.slice(0, 4)
  const m = ts.slice(4, 6)
  const d = ts.slice(6, 8)
  const hh = ts.slice(8, 10)
  const mm = ts.slice(10, 12)
  const ss = ts.slice(12, 14)
  return `${y}-${m}-${d}T${hh}:${mm}:${ss}Z`
}
