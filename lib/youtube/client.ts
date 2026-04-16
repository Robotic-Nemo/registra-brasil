import type { YouTubeSearchResponse } from '@/types/youtube'
import type { YouTubeResult } from '@/types/search'
import { OFFICIAL_CHANNELS } from './constants'

const YOUTUBE_API_BASE = 'https://www.googleapis.com/youtube/v3'

export async function searchYouTube(
  query: string,
  maxResults = 10
): Promise<{ results: YouTubeResult[]; quotaCost: number }> {
  const apiKey = process.env.YOUTUBE_API_KEY
  if (!apiKey) {
    console.warn('[youtube] YOUTUBE_API_KEY not set, skipping search')
    return { results: [], quotaCost: 0 }
  }

  const params = new URLSearchParams({
    part: 'snippet',
    q: query,
    type: 'video',
    relevanceLanguage: 'pt',
    regionCode: 'BR',
    maxResults: String(Math.min(Math.max(maxResults, 1), 50)),
    order: 'relevance',
    key: apiKey,
  })

  const res = await fetch(`${YOUTUBE_API_BASE}/search?${params}`, {
    next: { revalidate: 0 },
    signal: AbortSignal.timeout(10000), // 10s timeout
  })

  if (!res.ok) {
    let errorMessage = res.statusText
    try {
      const err = await res.json()
      errorMessage = err?.error?.message ?? errorMessage
    } catch { /* ignore parse error */ }
    throw new Error(`YouTube API error (${res.status}): ${errorMessage}`)
  }

  const data: YouTubeSearchResponse = await res.json()

  const officialChannelIds = new Set(Object.values(OFFICIAL_CHANNELS))

  const results: YouTubeResult[] = (data.items ?? [])
    .filter((item) => item.id?.videoId && item.snippet) // Guard against malformed items
    .map((item) => ({
      videoId: item.id.videoId,
      title: item.snippet.title,
      description: item.snippet.description,
      channelId: item.snippet.channelId,
      channelTitle: item.snippet.channelTitle,
      publishedAt: item.snippet.publishedAt,
      thumbnailUrl: item.snippet.thumbnails.medium?.url ?? item.snippet.thumbnails.default?.url ?? '',
      isOfficialChannel: officialChannelIds.has(item.snippet.channelId),
      watchUrl: `https://www.youtube.com/watch?v=${item.id.videoId}`,
    }))

  return { results, quotaCost: 100 }
}

export function buildTimestampUrl(videoId: string, seconds: number): string {
  return `https://www.youtube.com/watch?v=${videoId}&t=${seconds}s`
}
