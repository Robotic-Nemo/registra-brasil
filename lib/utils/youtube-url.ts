export function parseYouTubeVideoId(url: string): string | null {
  try {
    const u = new URL(url)
    if (u.hostname === 'youtu.be') return u.pathname.slice(1)
    if (u.hostname.includes('youtube.com')) return u.searchParams.get('v')
    return null
  } catch {
    return null
  }
}

export function buildWatchUrl(videoId: string, timestampSec?: number | null): string {
  const url = `https://www.youtube.com/watch?v=${videoId}`
  return timestampSec ? `${url}&t=${timestampSec}s` : url
}

export function buildEmbedUrl(videoId: string, timestampSec?: number | null): string {
  const url = `https://www.youtube.com/embed/${videoId}?rel=0`
  return timestampSec ? `${url}&start=${timestampSec}` : url
}

export function formatTimestamp(seconds: number): string {
  const h = Math.floor(seconds / 3600)
  const m = Math.floor((seconds % 3600) / 60)
  const s = seconds % 60
  if (h > 0) return `${h}:${String(m).padStart(2, '0')}:${String(s).padStart(2, '0')}`
  return `${m}:${String(s).padStart(2, '0')}`
}
