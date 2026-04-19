import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { createLogger } from '@/lib/utils/logger'

const log = createLogger('search/suggestions')

export interface PoliticianSuggestion {
  slug: string
  common_name: string
  party: string | null
  state: string | null
  photo_url: string | null
  similarity: number
}

export interface CategorySuggestion {
  slug: string
  label_pt: string
  color_hex: string | null
  similarity: number
}

export interface SearchSuggestions {
  politicians: PoliticianSuggestion[]
  categories: CategorySuggestion[]
}

const EMPTY: SearchSuggestions = { politicians: [], categories: [] }

/**
 * Fetch trigram-based fallback suggestions for an empty-results query.
 * Backed by `suggest_similar_politician` / `suggest_similar_category` RPCs
 * (migration 028). Runs both RPCs in parallel and swallows errors — this is
 * a pure UX polish, never user-visible when it fails.
 */
export async function getSearchSuggestions(
  rawQuery: string,
  limit = 3,
): Promise<SearchSuggestions> {
  const q = rawQuery.trim()
  if (q.length < 2 || q.length > 80) return EMPTY

  const supabase = getSupabaseServiceClient()

  const [polRes, catRes] = await Promise.all([
    (supabase.rpc as any)('suggest_similar_politician', {
      query_text: q,
      result_limit: limit,
    }).then(
      (r: { data: PoliticianSuggestion[] | null; error: unknown }) => r,
      (err: unknown) => ({ data: null, error: err }),
    ),
    (supabase.rpc as any)('suggest_similar_category', {
      query_text: q,
      result_limit: limit,
    }).then(
      (r: { data: CategorySuggestion[] | null; error: unknown }) => r,
      (err: unknown) => ({ data: null, error: err }),
    ),
  ])

  if (polRes.error) {
    log.warn('politician suggestion rpc failed', {
      err: polRes.error instanceof Error ? polRes.error.message : String(polRes.error),
    })
  }
  if (catRes.error) {
    log.warn('category suggestion rpc failed', {
      err: catRes.error instanceof Error ? catRes.error.message : String(catRes.error),
    })
  }

  return {
    politicians: Array.isArray(polRes.data) ? polRes.data : [],
    categories: Array.isArray(catRes.data) ? catRes.data : [],
  }
}
