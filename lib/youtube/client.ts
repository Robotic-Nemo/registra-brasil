import type { YouTubeSearchResponse } from '@/types/youtube'
import type { YouTubeResult } from '@/types/search'
import { OFFICIAL_CHANNELS } from './constants'

const YOUTUBE_API_BASE = 'https://www.googleapis.com/youtube/v3'

export async function searchYouTube(
  query: string,
  maxResults = 10
): Promise<{ results: YouTubeResult[]; quotaCost: number }> {
  const params = new URLSearchParams({
    part: 'snippet',
    q: query,
    type: 'video',
    relevanceLanguage: 'pt',
    regionCode: 'BR',
    maxResults: String(maxResults),
    order: 'relevance',
    key: process.env.YOUTUBE_API_KEY!,
  })

  const res = await fetch(`${YOUTUBE_API_BASE}/search?${params}`, {
    next: { revalidate: 0 },
  })

  if (!res.ok) {
    const err = await res.json()
    throw new Error(`YouTube API error: ${err?.error?.message ?? res.statusText}`)
  }

  const data: YouTubeSearchResponse = await res.json()

  const officialChannelIds = new Set(Object.values(OFFICIAL_CHANNELS))

  const results: YouTubeResult[] = data.items.map((item) => ({
    videoId: item.id.videoId,
    title: item.snippet.title,
    description: item.snippet.description,
    channelId: item.snippet.channelId,
    channelTitle: item.snippet.channelTitle,
    publishedAt: item.snippet.publishedAt,
    thumbnailUrl: item.snippet.thumbnails.medium?.url ?? item.snippet.thumbnails.default.url,
    isOfficialChannel: officialChannelIds.has(item.snippet.channelId),
    watchUrl: `https://www.youtube.com/watch?v=${item.id.videoId}`,
  }))

  return { results, quotaCost: 100 }
}

export function buildTimestampUrl(videoId: string, seconds: number): string {
  return `https://www.youtube.com/watch?v=${videoId}&t=${seconds}s`
}
