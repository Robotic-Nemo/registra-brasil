import type { SupabaseClient } from '@supabase/supabase-js'
import type { Politician, StatementWithRelations } from '@/types/database'

export interface PartyWithCount {
  party: string
  count: number
  politicianCount: number
}

/**
 * Get all parties with their verified statement counts and politician counts.
 */
export async function getParties(supabase: SupabaseClient): Promise<PartyWithCount[]> {
  const { data: politicians } = await supabase
    .from('politicians')
    .select('id, party')
    .eq('is_active', true)

  if (!politicians?.length) return []

  // Count politicians per party
  const partyPoliticians: Record<string, string[]> = {}
  for (const p of politicians as { id: string; party: string }[]) {
    if (!partyPoliticians[p.party]) partyPoliticians[p.party] = []
    partyPoliticians[p.party].push(p.id)
  }

  // Count verified statements per politician
  const { data: stmtRows } = await supabase
    .from('statements')
    .select('politician_id')
    .eq('verification_status', 'verified')

  const stmtCounts: Record<string, number> = {}
  for (const row of (stmtRows ?? []) as { politician_id: string }[]) {
    stmtCounts[row.politician_id] = (stmtCounts[row.politician_id] ?? 0) + 1
  }

  // Aggregate by party
  const result: PartyWithCount[] = Object.entries(partyPoliticians).map(([party, ids]) => ({
    party,
    politicianCount: ids.length,
    count: ids.reduce((sum, id) => sum + (stmtCounts[id] ?? 0), 0),
  }))

  return result.sort((a, b) => b.count - a.count)
}

/**
 * Get all politicians for a given party.
 */
export async function getPartyPoliticians(
  supabase: SupabaseClient,
  party: string
): Promise<Pick<Politician, 'id' | 'slug' | 'common_name' | 'full_name' | 'party' | 'state' | 'photo_url'>[]> {
  const { data } = await supabase
    .from('politicians')
    .select('id, slug, common_name, full_name, party, state, photo_url')
    .eq('party', party)
    .eq('is_active', true)
    .order('common_name', { ascending: true })

  return (data ?? []) as Pick<Politician, 'id' | 'slug' | 'common_name' | 'full_name' | 'party' | 'state' | 'photo_url'>[]
}

const STATEMENT_SELECT = `
  *,
  politicians (id, slug, common_name, full_name, party, state, photo_url),
  statement_categories (
    is_primary,
    categories (*)
  )
`

/**
 * Get verified statements for a given party with pagination.
 */
export async function getPartyStatements(
  supabase: SupabaseClient,
  party: string,
  page = 1,
  limit = 20
): Promise<{ results: StatementWithRelations[]; total: number; hasMore: boolean }> {
  const offset = (page - 1) * limit

  // Resolve politician IDs for this party
  const { data: pols } = await supabase
    .from('politicians')
    .select('id')
    .eq('party', party)
    .eq('is_active', true)

  if (!pols?.length) return { results: [], total: 0, hasMore: false }

  const polIds = (pols as { id: string }[]).map((p) => p.id)

  const { data, count, error } = await supabase
    .from('statements')
    .select(STATEMENT_SELECT, { count: 'exact' })
    .in('politician_id', polIds)
    .eq('verification_status', 'verified')
    .order('statement_date', { ascending: false })
    .range(offset, offset + limit - 1)

  if (error) throw new Error(`getPartyStatements: ${error.message}`)

  const results = (data ?? []) as StatementWithRelations[]
  return { results, total: count ?? 0, hasMore: offset + results.length < (count ?? 0) }
}
