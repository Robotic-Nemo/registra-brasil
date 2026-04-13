import type { SupabaseClient } from '@supabase/supabase-js'
import type { SearchParams, CuratedSearchResult } from '@/types/search'
import type { StatementWithRelations } from '@/types/database'

const STATEMENT_SELECT = `
  *,
  politicians (id, slug, common_name, full_name, party, state, photo_url),
  statement_categories (
    is_primary,
    categories (*)
  )
`

export async function searchStatements(
  supabase: SupabaseClient,
  params: SearchParams
): Promise<CuratedSearchResult> {
  const page = params.page ?? 1
  const limit = Math.min(params.limit ?? 20, 50)
  const offset = (page - 1) * limit

  let query = supabase
    .from('statements')
    .select(STATEMENT_SELECT, { count: 'exact' })
    .neq('verification_status', 'removed')
    .order('statement_date', { ascending: false })
    .range(offset, offset + limit - 1)

  if (params.q) {
    query = query.textSearch('search_vector', params.q, {
      type: 'websearch',
      config: 'portuguese',
    })
  }

  if (params.status) {
    query = query.eq('verification_status', params.status)
  } else if (!params.q) {
    // Default: verified only on browse, all on search
    query = query.eq('verification_status', 'verified')
  }

  if (params.politico) {
    const { data: politician } = await supabase
      .from('politicians')
      .select('id')
      .eq('slug', params.politico)
      .single()
    if (politician) query = query.eq('politician_id', politician.id)
  }

  if (params.de) query = query.gte('statement_date', params.de)
  if (params.ate) query = query.lte('statement_date', params.ate)

  const { data, count, error } = await query

  if (error) throw error

  // Filter by category if needed (post-query — join makes SQL filter complex)
  let results = (data ?? []) as StatementWithRelations[]
  if (params.categoria) {
    const cats = Array.isArray(params.categoria) ? params.categoria : [params.categoria]
    results = results.filter((s) =>
      s.statement_categories.some((sc) => cats.includes(sc.categories.slug))
    )
  }

  // Filter by party/state via joined politician
  if (params.partido) {
    results = results.filter((s) => s.politicians.party === params.partido)
  }
  if (params.estado) {
    results = results.filter((s) => s.politicians.state === params.estado)
  }

  return {
    results,
    total: count ?? 0,
    page,
    hasMore: offset + results.length < (count ?? 0),
  }
}

export async function getFeaturedStatements(
  supabase: SupabaseClient,
  limit = 6
): Promise<StatementWithRelations[]> {
  const { data, error } = await supabase
    .from('statements')
    .select(STATEMENT_SELECT)
    .eq('is_featured', true)
    .eq('verification_status', 'verified')
    .order('statement_date', { ascending: false })
    .limit(limit)

  if (error) throw error
  return (data ?? []) as StatementWithRelations[]
}

export async function getStatementBySlug(
  supabase: SupabaseClient,
  slug: string
): Promise<StatementWithRelations | null> {
  const { data, error } = await supabase
    .from('statements')
    .select(STATEMENT_SELECT)
    .eq('slug', slug)
    .neq('verification_status', 'removed')
    .single()

  if (error) return null
  return data as StatementWithRelations
}

export async function getStatementById(
  supabase: SupabaseClient,
  id: string
): Promise<StatementWithRelations | null> {
  const { data, error } = await supabase
    .from('statements')
    .select(STATEMENT_SELECT)
    .eq('id', id)
    .neq('verification_status', 'removed')
    .single()

  if (error) return null
  return data as StatementWithRelations
}

export async function getStatementsByCategory(
  supabase: SupabaseClient,
  categorySlug: string,
  page = 1,
  limit = 20
): Promise<CuratedSearchResult> {
  const offset = (page - 1) * limit

  const { data: category } = await supabase
    .from('categories')
    .select('id')
    .eq('slug', categorySlug)
    .single()

  if (!category) return { results: [], total: 0, page, hasMore: false }

  const { data: scRows, count } = await supabase
    .from('statement_categories')
    .select('statement_id', { count: 'exact' })
    .eq('category_id', category.id)
    .range(offset, offset + limit - 1)

  if (!scRows?.length) return { results: [], total: count ?? 0, page, hasMore: false }

  const ids = scRows.map((r: { statement_id: string }) => r.statement_id)

  const { data, error } = await supabase
    .from('statements')
    .select(STATEMENT_SELECT)
    .in('id', ids)
    .eq('verification_status', 'verified')
    .order('statement_date', { ascending: false })

  if (error) throw error

  const results = (data ?? []) as StatementWithRelations[]
  return { results, total: count ?? 0, page, hasMore: offset + results.length < (count ?? 0) }
}
