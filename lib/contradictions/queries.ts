import { getSupabaseServiceClient } from '@/lib/supabase/server'

export interface ContradictionPairRow {
  id: string
  politician_id: string
  statement_low_id: string
  statement_high_id: string
  headline: string
  editor_note: string
  severity: 1 | 2 | 3 | 4
  is_published: boolean
  created_at: string
  updated_at: string
}

export interface ContradictionStatementSlice {
  id: string
  slug: string | null
  summary: string
  statement_date: string
  primary_source_url: string
}

export interface ContradictionPairFull extends ContradictionPairRow {
  politician: {
    id: string
    slug: string
    common_name: string
    party: string | null
    state: string | null
    photo_url: string | null
  }
  statement_low: ContradictionStatementSlice
  statement_high: ContradictionStatementSlice
}

type Raw = ContradictionPairRow & {
  politicians: ContradictionPairFull['politician'] | null
  low: ContradictionStatementSlice | null
  high: ContradictionStatementSlice | null
}

const SELECT = `
  *,
  politicians!contradiction_pairs_politician_id_fkey ( id, slug, common_name, party, state, photo_url ),
  low:statements!contradiction_pairs_statement_low_id_fkey ( id, slug, summary, statement_date, primary_source_url ),
  high:statements!contradiction_pairs_statement_high_id_fkey ( id, slug, summary, statement_date, primary_source_url )
`

function shape(r: Raw): ContradictionPairFull | null {
  if (!r.politicians || !r.low || !r.high) return null
  return { ...r, politician: r.politicians, statement_low: r.low, statement_high: r.high }
}

export async function listPublishedContradictions(
  limit = 50,
): Promise<ContradictionPairFull[]> {
  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('contradiction_pairs') as any)
    .select(SELECT)
    .eq('is_published', true)
    .order('created_at', { ascending: false })
    .limit(limit)
  if (error) throw error
  return ((data ?? []) as Raw[]).map(shape).filter((x): x is ContradictionPairFull => x !== null)
}

export async function getContradictionById(
  id: string,
  includeDrafts = false,
): Promise<ContradictionPairFull | null> {
  const supabase = getSupabaseServiceClient()
  let q = (supabase.from('contradiction_pairs') as any).select(SELECT).eq('id', id)
  if (!includeDrafts) q = q.eq('is_published', true)
  const { data, error } = await q.maybeSingle()
  if (error || !data) return null
  return shape(data as Raw)
}

export async function listContradictionsForPolitician(
  politicianId: string,
  limit = 20,
): Promise<ContradictionPairFull[]> {
  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('contradiction_pairs') as any)
    .select(SELECT)
    .eq('politician_id', politicianId)
    .eq('is_published', true)
    .order('created_at', { ascending: false })
    .limit(limit)
  if (error) throw error
  return ((data ?? []) as Raw[]).map(shape).filter((x): x is ContradictionPairFull => x !== null)
}

export async function getContradictionCountForStatement(statementId: string): Promise<number> {
  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.rpc as any)('contradiction_count_for_statement', {
    sid: statementId,
  })
  if (error) return 0
  return Number(data ?? 0)
}

export async function listContradictionsMentioningStatement(
  statementId: string,
): Promise<ContradictionPairFull[]> {
  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('contradiction_pairs') as any)
    .select(SELECT)
    .eq('is_published', true)
    .or(`statement_low_id.eq.${statementId},statement_high_id.eq.${statementId}`)
    .order('created_at', { ascending: false })
  if (error) throw error
  return ((data ?? []) as Raw[]).map(shape).filter((x): x is ContradictionPairFull => x !== null)
}

/**
 * Orders two statement UUIDs so the lower string value is first —
 * matches the DB CHECK constraint so editors can pick them in any
 * order and the insert still succeeds.
 */
export function orderPair(a: string, b: string): { low: string; high: string } {
  return a < b ? { low: a, high: b } : { low: b, high: a }
}
