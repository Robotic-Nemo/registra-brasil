import type { SearchParams, UnifiedSearchResponse } from '@/types/search'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { searchStatements } from '@/lib/supabase/queries/statements'
import { searchYouTube } from '@/lib/youtube/client'
import { makeCacheKey, getCachedResults, setCachedResults } from '@/lib/youtube/cache'
import { hasQuotaAvailable, logQuotaUsage, getQuotaRemaining } from '@/lib/youtube/quota'
import { searchNews } from '@/lib/search/news'

export async function unifiedSearch(params: SearchParams): Promise<UnifiedSearchResponse> {
  const start = Date.now()
  const supabase = getSupabaseServiceClient()
  const fonte = params.fonte ?? 'todos'

  // Run curated and live in parallel
  const [curatedResult, liveResult] = await Promise.all([
    fonte !== 'ao-vivo'
      ? searchStatements(supabase, params)
      : Promise.resolve({ results: [], total: 0, page: 1, hasMore: false }),

    fonte !== 'curado' && params.q
      ? fetchLiveResults(params.q)
      : Promise.resolve({ youtube: [], news: [], quotaExhausted: false, quotaRemaining: 0 }),
  ])

  return {
    curated: curatedResult,
    live: liveResult,
    meta: { query: params.q ?? '', durationMs: Date.now() - start },
  }
}

async function fetchLiveResults(query: string) {
  const [youtubeResults, newsResults, quotaRemaining] = await Promise.all([
    fetchYouTubeWithCache(query),
    searchNews(query),
    getQuotaRemaining(),
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

  const cached = await getCachedResults(cacheKey)
  if (cached) return { results: cached, exhausted: false }

  const available = await hasQuotaAvailable(100)
  if (!available) return { results: [], exhausted: true }

  try {
    const { results, quotaCost } = await searchYouTube(query)
    await Promise.all([
      setCachedResults(cacheKey, query, results, quotaCost),
      logQuotaUsage('search.list', quotaCost, query),
    ])
    return { results, exhausted: false }
  } catch {
    return { results: [], exhausted: false }
  }
}
