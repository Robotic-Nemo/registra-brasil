import { createHash } from 'crypto'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import type { YouTubeResult } from '@/types/search'

const CACHE_TTL_HOURS = 6

export function makeCacheKey(query: string, params: Record<string, string> = {}): string {
  const raw = JSON.stringify({ query, ...params })
  return createHash('sha256').update(raw).digest('hex')
}

export async function getCachedResults(cacheKey: string): Promise<YouTubeResult[] | null> {
  const supabase = getSupabaseServiceClient()
  const { data } = await supabase
    .from('youtube_search_cache')
    .select('results')
    .eq('cache_key', cacheKey)
    .gt('expires_at', new Date().toISOString())
    .single()

  return data ? (data.results as YouTubeResult[]) : null
}

export async function setCachedResults(
  cacheKey: string,
  query: string,
  results: YouTubeResult[],
  quotaCost = 100
) {
  const supabase = getSupabaseServiceClient()
  const expiresAt = new Date(Date.now() + CACHE_TTL_HOURS * 60 * 60 * 1000).toISOString()

  await supabase.from('youtube_search_cache').upsert({
    cache_key: cacheKey,
    query,
    results,
    quota_cost: quotaCost,
    expires_at: expiresAt,
  })
}

// Cleanup expired entries (call from a scheduled function)
export async function purgeExpiredCache() {
  const supabase = getSupabaseServiceClient()
  await supabase
    .from('youtube_search_cache')
    .delete()
    .lt('expires_at', new Date().toISOString())
}
