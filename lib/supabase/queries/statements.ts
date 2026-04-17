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
  const page = Math.max(1, params.page ?? 1)
  const limit = Math.max(1, Math.min(params.limit ?? 20, 50))
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
      .maybeSingle()
    if (politician) {
      query = query.eq('politician_id', (politician as { id: string }).id)
    } else {
      // Requested politician doesn't exist — return empty set instead of
      // silently leaking all statements.
      return { results: [], total: 0, page, hasMore: false }
    }
  }

  // Validate date range
  if (params.de && params.ate && params.de > params.ate) {
    return { results: [], total: 0, page, hasMore: false }
  }
  if (params.de) query = query.gte('statement_date', params.de)
  if (params.ate) query = query.lte('statement_date', params.ate)

  // Category filter: resolve slugs to IDs and filter via statement_categories join
  // This must happen before the main query to keep pagination accurate
  if (params.categoria) {
    const cats = Array.isArray(params.categoria) ? params.categoria : [params.categoria]
    const { data: catRows } = await supabase
      .from('categories')
      .select('id')
      .in('slug', cats)
    if (!catRows?.length) {
      // Category slug(s) not found in DB — return empty rather than unfiltered results
      return { results: [], total: 0, page, hasMore: false }
    }
    const catIds = catRows.map((c: { id: string }) => c.id)
    const { data: scRows } = await supabase
      .from('statement_categories')
      .select('statement_id')
      .in('category_id', catIds)
    const stmtIds = [...new Set((scRows ?? []).map((r: { statement_id: string }) => r.statement_id))]
    if (stmtIds.length === 0) return { results: [], total: 0, page, hasMore: false }
    query = query.in('id', stmtIds)
  }

  // Party/state filter: pre-resolve politician IDs (dot-notation on joined tables
  // is unreliable without !inner joins — safe approach matches how politico filter works)
  if (params.partido || params.estado) {
    let polQ = supabase.from('politicians').select('id')
    if (params.partido) polQ = polQ.eq('party', params.partido)
    if (params.estado) polQ = polQ.eq('state', params.estado)
    const { data: matchingPols } = await polQ
    if (!matchingPols?.length) {
      return { results: [], total: 0, page, hasMore: false }
    }
    query = query.in('politician_id', matchingPols.map((p: { id: string }) => p.id))
  }

  const { data, count, error } = await query

  if (error) throw new Error(`Failed to search statements: ${error.message}`)

  const results = (data ?? []) as StatementWithRelations[]

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

  if (error) throw new Error(`getFeaturedStatements: ${error.message}`)
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

export async function getDisputedStatements(
  supabase: SupabaseClient,
  limit = 20
): Promise<StatementWithRelations[]> {
  const { data, error } = await supabase
    .from('statements')
    .select(STATEMENT_SELECT)
    .eq('verification_status', 'disputed')
    .order('created_at', { ascending: false })
    .limit(limit)

  if (error) throw new Error(`Failed to fetch disputed statements: ${error.message}`)
  return (data ?? []) as StatementWithRelations[]
}

export async function getUnverifiedStatements(
  supabase: SupabaseClient,
  limit = 20
): Promise<StatementWithRelations[]> {
  const { data, error } = await supabase
    .from('statements')
    .select(STATEMENT_SELECT)
    .eq('verification_status', 'unverified')
    .order('created_at', { ascending: false })
    .limit(limit)

  if (error) throw new Error(`Failed to fetch unverified statements: ${error.message}`)
  return (data ?? []) as StatementWithRelations[]
}

export async function updateStatementStatus(
  supabase: SupabaseClient,
  id: string,
  status: 'verified' | 'disputed' | 'removed'
): Promise<void> {
  const { error } = await supabase
    .from('statements')
    .update({ verification_status: status, reviewed_at: new Date().toISOString() })
    .eq('id', id)

  if (error) throw new Error(`Failed to update statement status: ${error.message}`)
}

export async function getSiteStats(supabase: SupabaseClient): Promise<{
  totalVerified: number
  totalPoliticians: number
  totalCategories: number
}> {
  const [statementsRes, politiciansRes, categoriesRes] = await Promise.all([
    supabase.from('statements').select('id', { count: 'exact', head: true }).eq('verification_status', 'verified'),
    supabase.from('politicians').select('id', { count: 'exact', head: true }).eq('is_active', true),
    supabase.from('categories').select('id', { count: 'exact', head: true }),
  ])

  return {
    totalVerified: statementsRes.count ?? 0,
    totalPoliticians: politiciansRes.count ?? 0,
    totalCategories: categoriesRes.count ?? 0,
  }
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

  // Fetch matching statement IDs for this category
  const { data: scRows } = await supabase
    .from('statement_categories')
    .select('statement_id')
    .eq('category_id', (category as { id: string }).id)

  if (!scRows?.length) return { results: [], total: 0, page, hasMore: false }
  const ids = scRows.map((r: { statement_id: string }) => r.statement_id)

  // Query statements with exact count — only verified ones, paginated
  const { data, count, error } = await supabase
    .from('statements')
    .select(STATEMENT_SELECT, { count: 'exact' })
    .in('id', ids)
    .eq('verification_status', 'verified')
    .order('statement_date', { ascending: false })
    .range(offset, offset + limit - 1)

  if (error) throw new Error(`Failed to fetch category statements: ${error.message}`)

  const results = (data ?? []) as StatementWithRelations[]
  return { results, total: count ?? 0, page, hasMore: offset + results.length < (count ?? 0) }
}

export async function getRelatedStatements(
  supabase: SupabaseClient,
  statementId: string,
  politicianId: string,
  limit = 4
): Promise<StatementWithRelations[]> {
  // Same politician, verified, exclude current statement, most recent
  const { data, error } = await supabase
    .from('statements')
    .select(STATEMENT_SELECT)
    .eq('politician_id', politicianId)
    .eq('verification_status', 'verified')
    .neq('id', statementId)
    .order('statement_date', { ascending: false })
    .limit(limit)

  if (error) return []
  return (data ?? []) as StatementWithRelations[]
}

export async function getRecentStatements(
  supabase: SupabaseClient,
  limit = 6
): Promise<StatementWithRelations[]> {
  const { data, error } = await supabase
    .from('statements')
    .select(STATEMENT_SELECT)
    .eq('verification_status', 'verified')
    .order('created_at', { ascending: false })
    .limit(limit)

  if (error) throw new Error(`getRecentStatements: ${error.message}`)
  return (data ?? []) as StatementWithRelations[]
}

export async function getAdjacentStatements(
  supabase: SupabaseClient,
  politicianId: string,
  statementDate: string,
  statementId: string
): Promise<{ prev: { slug: string | null; id: string; summary: string } | null; next: { slug: string | null; id: string; summary: string } | null }> {
  const [{ data: prevData }, { data: nextData }] = await Promise.all([
    supabase
      .from('statements')
      .select('slug, id, summary')
      .eq('politician_id', politicianId)
      .eq('verification_status', 'verified')
      .lte('statement_date', statementDate)
      .neq('id', statementId)
      .order('statement_date', { ascending: false })
      .order('created_at', { ascending: false })
      .limit(1)
      .maybeSingle(),
    supabase
      .from('statements')
      .select('slug, id, summary')
      .eq('politician_id', politicianId)
      .eq('verification_status', 'verified')
      .gte('statement_date', statementDate)
      .neq('id', statementId)
      .order('statement_date', { ascending: true })
      .order('created_at', { ascending: true })
      .limit(1)
      .maybeSingle(),
  ])

  return {
    prev: prevData as { slug: string | null; id: string; summary: string } | null,
    next: nextData as { slug: string | null; id: string; summary: string } | null,
  }
}

export async function getStatementCountByPolitician(
  supabase: SupabaseClient,
  politicianId: string
): Promise<number> {
  const { count, error } = await supabase
    .from('statements')
    .select('id', { count: 'exact', head: true })
    .eq('politician_id', politicianId)
    .eq('verification_status', 'verified')

  if (error) return 0
  return count ?? 0
}
