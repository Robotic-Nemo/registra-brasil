import type { SearchParams, UnifiedSearchResponse, LiveSearchResult } from '@/types/search'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { searchStatements } from '@/lib/supabase/queries/statements'
import { searchYouTube } from '@/lib/youtube/client'
import { makeCacheKey, getCachedResults, setCachedResults } from '@/lib/youtube/cache'
import { hasQuotaAvailable, logQuotaUsage, getQuotaRemaining } from '@/lib/youtube/quota'
import { searchNews } from '@/lib/search/news'

const EMPTY_LIVE: LiveSearchResult = { youtube: [], news: [], quotaExhausted: false, quotaRemaining: 0 }

export async function unifiedSearch(params: SearchParams): Promise<UnifiedSearchResponse> {
  const isDev = process.env.NODE_ENV === 'development'
  const timerLabel = `[unified] search "${params.q ?? ''}"`
  if (isDev) console.time(timerLabel)

  const start = Date.now()
  const supabase = getSupabaseServiceClient()
  const fonte = params.fonte ?? 'todos'

  // Run curated and live in parallel
  const [curatedResult, liveResult] = await Promise.all([
    fonte !== 'ao-vivo'
      ? searchStatements(supabase, params).catch((err) => {
          console.error('[unified] Curated search failed:', err)
          return { results: [], total: 0, page: params.page ?? 1, hasMore: false }
        })
      : Promise.resolve({ results: [], total: 0, page: 1, hasMore: false }),

    fonte !== 'curado' && params.q
      ? fetchLiveResults(params.q).catch((err) => {
          console.error('[unified] Live search failed:', err)
          return EMPTY_LIVE
        })
      : Promise.resolve(EMPTY_LIVE),
  ])

  const response: UnifiedSearchResponse = {
    curated: curatedResult,
    live: liveResult,
    meta: { query: params.q ?? '', durationMs: Date.now() - start },
  }

  if (isDev) console.timeEnd(timerLabel)

  return response
}

async function fetchLiveResults(query: string): Promise<LiveSearchResult> {
  const [youtubeResults, newsResults, quotaRemaining] = await Promise.all([
    fetchYouTubeWithCache(query),
    searchNews(query).catch(() => []),
    getQuotaRemaining().catch(() => 0),
  ])

  return {
    youtube: youtubeResults.results,
    news: newsResults,
    quotaExhausted: youtubeResults.exhausted,
    quotaRemaining,
  }
}

async function fetchYouTubeWithCache(query: string) {
  const cacheKey = makeCacheKey(query)

  const cached = await getCachedResults(cacheKey).catch(() => null)
  if (cached) return { results: cached, exhausted: false }

  const available = await hasQuotaAvailable(100)
  if (!available) return { results: [], exhausted: true }

  try {
    const { results, quotaCost } = await searchYouTube(query)
    // Fire-and-forget: don't let cache/quota logging failures break the response
    void Promise.all([
      setCachedResults(cacheKey, query, results, quotaCost),
      logQuotaUsage('search.list', quotaCost, query),
    ]).catch((err) => console.error('[unified] Cache/quota log failed:', err))
    return { results, exhausted: false }
  } catch (err) {
    console.error('[unified] YouTube search failed:', err)
    return { results: [], exhausted: false }
  }
}
