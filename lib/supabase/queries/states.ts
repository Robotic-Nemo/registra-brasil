import type { SupabaseClient } from '@supabase/supabase-js'
import type { Politician, StatementWithRelations } from '@/types/database'

export interface StateWithCount {
  state: string
  count: number
  politicianCount: number
}

/** Brazilian states ordered by code. */
export const BRAZILIAN_STATES: Record<string, string> = {
  AC: 'Acre', AL: 'Alagoas', AM: 'Amazonas', AP: 'Amapa',
  BA: 'Bahia', CE: 'Ceara', DF: 'Distrito Federal', ES: 'Espirito Santo',
  GO: 'Goias', MA: 'Maranhao', MG: 'Minas Gerais', MS: 'Mato Grosso do Sul',
  MT: 'Mato Grosso', PA: 'Para', PB: 'Paraiba', PE: 'Pernambuco',
  PI: 'Piaui', PR: 'Parana', RJ: 'Rio de Janeiro', RN: 'Rio Grande do Norte',
  RO: 'Rondonia', RR: 'Roraima', RS: 'Rio Grande do Sul', SC: 'Santa Catarina',
  SE: 'Sergipe', SP: 'Sao Paulo', TO: 'Tocantins',
}

/**
 * Get all states with their verified statement counts and politician counts.
 */
export async function getStates(supabase: SupabaseClient): Promise<StateWithCount[]> {
  const { data: politicians } = await supabase
    .from('politicians')
    .select('id, state')
    .eq('is_active', true)

  if (!politicians?.length) return []

  const statePoliticians: Record<string, string[]> = {}
  for (const p of politicians as { id: string; state: string | null }[]) {
    const st = p.state ?? 'N/A'
    if (!statePoliticians[st]) statePoliticians[st] = []
    statePoliticians[st].push(p.id)
  }

  const { data: stmtRows } = await supabase
    .from('statements')
    .select('politician_id')
    .eq('verification_status', 'verified')

  const stmtCounts: Record<string, number> = {}
  for (const row of (stmtRows ?? []) as { politician_id: string }[]) {
    stmtCounts[row.politician_id] = (stmtCounts[row.politician_id] ?? 0) + 1
  }

  const result: StateWithCount[] = Object.entries(statePoliticians)
    .filter(([st]) => st !== 'N/A')
    .map(([state, ids]) => ({
      state,
      politicianCount: ids.length,
      count: ids.reduce((sum, id) => sum + (stmtCounts[id] ?? 0), 0),
    }))

  return result.sort((a, b) => b.count - a.count)
}

/**
 * Get all politicians for a given state.
 */
export async function getStatePoliticians(
  supabase: SupabaseClient,
  state: string
): Promise<Pick<Politician, 'id' | 'slug' | 'common_name' | 'full_name' | 'party' | 'state' | 'photo_url'>[]> {
  const { data } = await supabase
    .from('politicians')
    .select('id, slug, common_name, full_name, party, state, photo_url')
    .eq('state', state.toUpperCase())
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
 * Get verified statements for a given state with pagination.
 */
export async function getStateStatements(
  supabase: SupabaseClient,
  state: string,
  page = 1,
  limit = 20
): Promise<{ results: StatementWithRelations[]; total: number; hasMore: boolean }> {
  const offset = (page - 1) * limit

  const { data: pols } = await supabase
    .from('politicians')
    .select('id')
    .eq('state', state.toUpperCase())
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

  if (error) throw new Error(`getStateStatements: ${error.message}`)

  const results = (data ?? []) as StatementWithRelations[]
  return { results, total: count ?? 0, hasMore: offset + results.length < (count ?? 0) }
}
