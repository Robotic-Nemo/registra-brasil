import type { StatementWithRelations, VerificationStatus } from './database'

export interface SearchParams {
  q?: string
  categoria?: string | string[]
  partido?: string
  estado?: string
  politico?: string
  de?: string
  ate?: string
  status?: VerificationStatus
  fonte?: 'curado' | 'ao-vivo' | 'todos'
  page?: number
  limit?: number
}

export interface CuratedSearchResult {
  results: StatementWithRelations[]
  total: number
  page: number
  hasMore: boolean
}

export interface YouTubeResult {
  videoId: string
  title: string
  description: string
  channelId: string
  channelTitle: string
  publishedAt: string
  thumbnailUrl: string
  isOfficialChannel: boolean
  watchUrl: string
}

export interface NewsResult {
  title: string
  url: string
  snippet: string
  outlet: string
  publishedAt: string | null
}

export interface LiveSearchResult {
  youtube: YouTubeResult[]
  news: NewsResult[]
  quotaExhausted: boolean
  quotaRemaining: number
}

export interface UnifiedSearchResponse {
  curated: CuratedSearchResult
  live: LiveSearchResult
  meta: {
    query: string
    durationMs: number
  }
}
