/**
 * Similarity helpers backed by pg_trgm. DB-side scanning means these
 * scale to the full corpus (a GIN index over `summary`) instead of the
 * 500-row in-memory window the old detector used.
 */

import type { SupabaseClient } from '@supabase/supabase-js'

export interface SimilarStatement {
  id: string
  slug: string | null
  summary: string
  politician_id: string
  statement_date: string
  verification_status: string
  similarity: number
}

export interface SimilarPair {
  id_a: string
  id_b: string
  summary_a: string
  summary_b: string
  politician_id_a: string
  politician_id_b: string
  date_a: string
  date_b: string
  similarity: number
}

export async function findSimilarStatements(
  supabase: SupabaseClient,
  queryText: string,
  opts: { minSimilarity?: number; limit?: number; politicianId?: string } = {},
): Promise<SimilarStatement[]> {
  const { minSimilarity = 0.4, limit = 10, politicianId } = opts
  // Guard against too-short inputs that would explode the index scan
  // (trigram matching on "ok" matches half the corpus).
  if (queryText.trim().length < 10) return []

  const { data, error } = await (supabase as any).rpc('find_similar_statements', {
    query_text: queryText,
    min_similarity: minSimilarity,
    result_limit: limit,
    filter_politician_id: politicianId ?? null,
  })
  if (error) {
    console.error('[similar-statements] rpc error:', error)
    return []
  }
  return (data ?? []) as SimilarStatement[]
}

export async function findAllSimilarPairs(
  supabase: SupabaseClient,
  opts: { minSimilarity?: number; sinceDate?: string; limit?: number } = {},
): Promise<SimilarPair[]> {
  const { minSimilarity = 0.6, sinceDate, limit = 200 } = opts
  const { data, error } = await (supabase as any).rpc('find_all_similar_pairs', {
    min_similarity: minSimilarity,
    since_date: sinceDate ?? null,
    result_limit: limit,
  })
  if (error) {
    console.error('[similar-statements] pair rpc error:', error)
    return []
  }
  return (data ?? []) as SimilarPair[]
}
