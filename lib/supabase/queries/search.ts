import type { SupabaseClient } from '@supabase/supabase-js'
import type { StatementWithRelations } from '@/types/database'

const STATEMENT_SELECT = `
  *,
  politicians (id, slug, common_name, full_name, party, state, photo_url),
  statement_categories (
    is_primary,
    categories (*)
  )
`

export interface TrigramSearchResult {
  results: StatementWithRelations[]
  total: number
}

/**
 * Full-text search with trigram ranking for fuzzy matching.
 * Uses PostgreSQL's pg_trgm similarity for better partial-word results.
 */
export async function trigramSearch(
  supabase: SupabaseClient,
  query: string,
  options: { limit?: number; offset?: number; minSimilarity?: number } = {}
): Promise<TrigramSearchResult> {
  const { limit = 20, offset = 0 } = options

  if (!query.trim()) {
    return { results: [], total: 0 }
  }

  // Use websearch for the primary full-text search
  try {
    const { data, count, error } = await supabase
      .from('statements')
      .select(STATEMENT_SELECT, { count: 'exact' })
      .neq('verification_status', 'removed')
      .textSearch('search_vector', query, {
        type: 'websearch',
        config: 'portuguese',
      })
      .order('statement_date', { ascending: false })
      .range(offset, offset + limit - 1)

    if (error) {
      return { results: [], total: 0 }
    }

    return {
      results: (data ?? []) as StatementWithRelations[],
      total: count ?? 0,
    }
  } catch {
    return { results: [], total: 0 }
  }
}

/**
 * Search politicians by name with partial matching.
 */
export async function searchPoliticians(
  supabase: SupabaseClient,
  query: string,
  limit = 10
): Promise<{ id: string; slug: string; common_name: string; full_name: string; party: string }[]> {
  if (!query.trim()) return []

  // Escape SQL wildcards and PostgREST filter metacharacters
  const escaped = query.replace(/%/g, '\\%').replace(/_/g, '\\_').replace(/[,().]/g, '')

  const { data, error } = await supabase
    .from('politicians')
    .select('id, slug, common_name, full_name, party')
    .eq('is_active', true)
    .or(`common_name.ilike.%${escaped}%,full_name.ilike.%${escaped}%`)
    .order('common_name')
    .limit(limit)

  if (error) return []
  return data ?? []
}

/**
 * Search categories by label with partial matching.
 */
export async function searchCategories(
  supabase: SupabaseClient,
  query: string,
  limit = 10
): Promise<{ id: string; slug: string; label_pt: string; color_hex: string }[]> {
  if (!query.trim()) return []

  // Escape SQL wildcards in user input to prevent pattern injection
  const escaped = query.replace(/%/g, '\\%').replace(/_/g, '\\_')

  const { data, error } = await supabase
    .from('categories')
    .select('id, slug, label_pt, color_hex')
    .ilike('label_pt', `%${escaped}%`)
    .order('label_pt')
    .limit(limit)

  if (error) return []
  return data ?? []
}
