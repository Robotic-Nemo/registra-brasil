export interface YouTubeSearchResponse {
  kind: string
  etag: string
  nextPageToken?: string
  regionCode: string
  pageInfo: { totalResults: number; resultsPerPage: number }
  items: YouTubeSearchItem[]
}

export interface YouTubeSearchItem {
  kind: string
  etag: string
  id: { kind: string; videoId: string }
  snippet: {
    publishedAt: string
    channelId: string
    title: string
    description: string
    thumbnails: {
      default: YouTubeThumbnail
      medium: YouTubeThumbnail
      high: YouTubeThumbnail
    }
    channelTitle: string
    liveBroadcastContent: string
  }
}

export interface YouTubeThumbnail {
  url: string
  width: number
  height: number
}
