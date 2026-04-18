import type { SupabaseClient } from '@supabase/supabase-js'
import type { Politician } from '@/types/database'

export async function getPoliticianBySlug(
  supabase: SupabaseClient,
  slug: string
): Promise<Politician | null> {
  const { data, error } = await supabase
    .from('politicians')
    .select('id, slug, full_name, common_name, party, party_history, state, role, role_history, photo_url, photo_source_url, photo_license, tse_id, camara_id, senado_id, wikipedia_url, is_active, created_at, updated_at')
    .eq('slug', slug)
    .single()

  if (error) return null
  return data as Politician
}

export async function getAllPoliticianSlugs(supabase: SupabaseClient): Promise<string[]> {
  const { data } = await supabase.from('politicians').select('slug')
  return (data ?? []).map((p: { slug: string }) => p.slug)
}

export async function getPoliticianCategoryStats(
  supabase: SupabaseClient,
  politicianId: string
): Promise<{ slug: string; label_pt: string; color_hex: string; count: number }[]> {
  // Single query: join statement_categories → statements (filtered) → categories
  const { data, error } = await supabase
    .from('statement_categories')
    .select(`
      categories (slug, label_pt, color_hex),
      statements!inner (politician_id, verification_status)
    `)
    .eq('statements.politician_id', politicianId)
    .eq('statements.verification_status', 'verified')

  if (error || !data) return []

  const counts: Record<string, { slug: string; label_pt: string; color_hex: string; count: number }> = {}
  for (const row of data as unknown as { categories: { slug: string; label_pt: string; color_hex: string } }[]) {
    const c = row.categories
    if (!c) continue
    if (!counts[c.slug]) counts[c.slug] = { ...c, count: 0 }
    counts[c.slug].count++
  }

  return Object.values(counts).sort((a, b) => b.count - a.count)
}

/**
 * Escape characters that have special meaning in PostgREST filter strings
 * to prevent filter injection via `.or()` string interpolation.
 */
function sanitizePostgrestFilter(value: string): string {
  return value.replace(/[,().]/g, '')
}

export async function getRelatedPoliticians(
  supabase: SupabaseClient,
  currentSlug: string,
  party: string,
  state: string | null,
  limit = 4
): Promise<Pick<Politician, 'slug' | 'common_name' | 'full_name' | 'party' | 'state' | 'photo_url'>[]> {
  const safeParty = sanitizePostgrestFilter(party)
  const safeState = state ? sanitizePostgrestFilter(state) : null
  const orFilter = safeState
    ? `party.eq.${safeParty},state.eq.${safeState}`
    : `party.eq.${safeParty}`

  const { data } = await supabase
    .from('politicians')
    .select('slug, common_name, full_name, party, state, photo_url')
    .neq('slug', currentSlug)
    .or(orFilter)
    .eq('is_active', true)
    .limit(limit)

  return (data ?? []) as Pick<Politician, 'slug' | 'common_name' | 'full_name' | 'party' | 'state' | 'photo_url'>[]
}

export async function getPoliticianActivityByMonth(
  supabase: SupabaseClient,
  politicianId: string,
  months = 12
): Promise<{ month: string; count: number }[]> {
  const since = new Date()
  since.setMonth(since.getMonth() - months)
  const sinceStr = since.toISOString().slice(0, 10)

  const { data } = await supabase
    .from('statements')
    .select('statement_date')
    .eq('politician_id', politicianId)
    .eq('verification_status', 'verified')
    .gte('statement_date', sinceStr)
    .order('statement_date', { ascending: true })

  if (!data) return []

  const counts: Record<string, number> = {}
  for (const row of data as { statement_date: string }[]) {
    const month = row.statement_date.slice(0, 7) // YYYY-MM
    counts[month] = (counts[month] ?? 0) + 1
  }

  return Object.entries(counts)
    .map(([month, count]) => ({ month, count }))
    .sort((a, b) => a.month.localeCompare(b.month))
}

export async function getPoliticianActivityByDay(
  supabase: SupabaseClient,
  politicianId: string,
  weeks = 52,
): Promise<{ date: string; count: number }[]> {
  const since = new Date()
  since.setDate(since.getDate() - weeks * 7)
  const sinceStr = since.toISOString().slice(0, 10)

  const { data } = await supabase
    .from('statements')
    .select('statement_date')
    .eq('politician_id', politicianId)
    .neq('verification_status', 'removed')
    .gte('statement_date', sinceStr)

  if (!data) return []
  const counts = new Map<string, number>()
  for (const row of data as { statement_date: string }[]) {
    counts.set(row.statement_date, (counts.get(row.statement_date) ?? 0) + 1)
  }
  return [...counts.entries()].map(([date, count]) => ({ date, count }))
}

export async function searchPoliticians(
  supabase: SupabaseClient,
  query: string,
  limit = 10
): Promise<Pick<Politician, 'id' | 'slug' | 'common_name' | 'party' | 'state'>[]> {
  // Escape SQL wildcards in user input to prevent pattern injection
  const escaped = query.replace(/%/g, '\\%').replace(/_/g, '\\_')
  const { data } = await supabase
    .from('politicians')
    .select('id, slug, common_name, party, state')
    .ilike('common_name', `%${escaped}%`)
    .limit(limit)

  return (data ?? []) as Pick<Politician, 'id' | 'slug' | 'common_name' | 'party' | 'state'>[]
}
