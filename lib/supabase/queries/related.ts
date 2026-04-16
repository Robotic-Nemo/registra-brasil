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

/**
 * Get related statements by shared categories.
 * Finds statements that share at least one category with the given statement,
 * excluding the statement itself.
 */
export async function getRelatedByCategory(
  supabase: SupabaseClient,
  statementId: string,
  limit = 6
): Promise<StatementWithRelations[]> {
  // Get categories of the current statement
  const { data: catRows } = await supabase
    .from('statement_categories')
    .select('category_id')
    .eq('statement_id', statementId)

  if (!catRows?.length) return []

  const catIds = (catRows as { category_id: string }[]).map((r) => r.category_id)

  // Find other statements in these categories
  const { data: relatedRows } = await supabase
    .from('statement_categories')
    .select('statement_id')
    .in('category_id', catIds)
    .neq('statement_id', statementId)

  if (!relatedRows?.length) return []

  // Deduplicate and rank by frequency
  const freq: Record<string, number> = {}
  for (const r of relatedRows as { statement_id: string }[]) {
    freq[r.statement_id] = (freq[r.statement_id] ?? 0) + 1
  }
  const topIds = Object.entries(freq)
    .sort((a, b) => b[1] - a[1])
    .slice(0, limit)
    .map(([id]) => id)

  const { data, error } = await supabase
    .from('statements')
    .select(STATEMENT_SELECT)
    .in('id', topIds)
    .eq('verification_status', 'verified')
    .order('statement_date', { ascending: false })
    .limit(limit)

  if (error) return []
  return (data ?? []) as StatementWithRelations[]
}

/**
 * Get related statements by politician overlap (same party or state).
 */
/**
 * Escape characters that have special meaning in PostgREST filter strings
 * to prevent filter injection via `.or()` string interpolation.
 */
function sanitizePostgrestFilter(value: string): string {
  return value.replace(/[,().]/g, '')
}

export async function getRelatedByPoliticianOverlap(
  supabase: SupabaseClient,
  politicianId: string,
  party: string,
  state: string | null,
  excludeStatementId: string,
  limit = 6
): Promise<StatementWithRelations[]> {
  const safeParty = sanitizePostgrestFilter(party)
  const safeState = state ? sanitizePostgrestFilter(state) : null

  // Find other politicians in the same party or state
  let query = supabase
    .from('politicians')
    .select('id')
    .neq('id', politicianId)
    .eq('is_active', true)

  if (safeState) {
    // Same party OR same state
    query = query.or(`party.eq.${safeParty},state.eq.${safeState}`)
  } else {
    query = query.eq('party', party)
  }

  const { data: pols } = await query.limit(50)
  if (!pols?.length) return []

  const polIds = (pols as { id: string }[]).map((p) => p.id)

  const { data, error } = await supabase
    .from('statements')
    .select(STATEMENT_SELECT)
    .in('politician_id', polIds)
    .eq('verification_status', 'verified')
    .neq('id', excludeStatementId)
    .order('statement_date', { ascending: false })
    .limit(limit)

  if (error) return []
  return (data ?? []) as StatementWithRelations[]
}

/**
 * Group an array of statements by a key function for efficient aggregation.
 */
export function groupStatements<K extends string>(
  statements: { politician_id: string; [key: string]: unknown }[],
  keyFn: (s: { politician_id: string; [key: string]: unknown }) => K
): Record<K, number> {
  const result = {} as Record<K, number>
  for (const s of statements) {
    const key = keyFn(s)
    result[key] = (result[key] ?? 0) + 1
  }
  return result
}
