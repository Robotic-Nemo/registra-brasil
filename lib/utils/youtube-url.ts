const YOUTUBE_HOSTNAMES = new Set([
  'youtube.com', 'www.youtube.com', 'm.youtube.com', 'music.youtube.com',
])

const VALID_VIDEO_ID = /^[a-zA-Z0-9_-]{11}$/

function validateVideoId(id: string | null): string | null {
  if (!id || !VALID_VIDEO_ID.test(id)) return null
  return id
}

export function parseYouTubeVideoId(url: string): string | null {
  try {
    const u = new URL(url)
    if (u.hostname === 'youtu.be') {
      const id = u.pathname.slice(1).split('/')[0]
      return validateVideoId(id)
    }
    if (YOUTUBE_HOSTNAMES.has(u.hostname)) {
      return validateVideoId(u.searchParams.get('v'))
    }
    return null
  } catch {
    return null
  }
}

export function buildWatchUrl(videoId: string, timestampSec?: number | null): string {
  const url = `https://www.youtube.com/watch?v=${encodeURIComponent(videoId)}`
  return timestampSec ? `${url}&t=${Math.max(0, Math.floor(timestampSec))}s` : url
}

export function buildEmbedUrl(videoId: string, timestampSec?: number | null): string {
  const url = `https://www.youtube.com/embed/${encodeURIComponent(videoId)}?rel=0`
  return timestampSec ? `${url}&start=${Math.max(0, Math.floor(timestampSec))}` : url
}

export function formatTimestamp(seconds: number): string {
  if (!Number.isFinite(seconds) || seconds < 0) return '0:00'
  const s = Math.floor(seconds)
  const h = Math.floor(s / 3600)
  const m = Math.floor((s % 3600) / 60)
  const sec = s % 60
  if (h > 0) return `${h}:${String(m).padStart(2, '0')}:${String(sec).padStart(2, '0')}`
  return `${m}:${String(sec).padStart(2, '0')}`
}

/** Parse HH:MM:SS or MM:SS string into total seconds */
export function parseTimestamp(input: string | null | undefined): number | null {
  if (!input || typeof input !== 'string') return null
  const parts = input.trim().split(':').map(Number)
  if (parts.length === 0 || parts.some((p) => !Number.isFinite(p) || p < 0)) return null

  if (parts.length === 3) return parts[0] * 3600 + parts[1] * 60 + parts[2]
  if (parts.length === 2) return parts[0] * 60 + parts[1]
  if (parts.length === 1 && Number.isFinite(parts[0])) return parts[0]
  return null
}
