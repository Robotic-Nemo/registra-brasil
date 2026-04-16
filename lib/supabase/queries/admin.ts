import type { SupabaseClient } from '@supabase/supabase-js'
import type { VerificationStatus } from '@/types/database'

interface AdminStatementsFilter {
  status?: VerificationStatus
  politicianId?: string
  search?: string
  dateFrom?: string
  dateTo?: string
  page?: number
  perPage?: number
}

/**
 * Fetch statements with admin-level filters, including pagination.
 */
export async function getAdminStatements(
  supabase: SupabaseClient,
  filters: AdminStatementsFilter = {}
) {
  const { status, politicianId, search, dateFrom, dateTo, page = 1, perPage = 25 } = filters

  let query = supabase
    .from('statements')
    .select(
      'id, summary, slug, statement_date, verification_status, is_featured, created_at, updated_at, reviewed_at, politicians(id, common_name, party, slug)',
      { count: 'exact' }
    )
    .order('created_at', { ascending: false })
    .range((page - 1) * perPage, page * perPage - 1)

  if (status) {
    query = query.eq('verification_status', status)
  }

  if (politicianId) {
    query = query.eq('politician_id', politicianId)
  }

  if (search) {
    // Escape SQL wildcards in user input to prevent pattern injection
    const escapedSearch = search.replace(/%/g, '\\%').replace(/_/g, '\\_')
    query = query.ilike('summary', `%${escapedSearch}%`)
  }

  if (dateFrom) {
    query = query.gte('statement_date', dateFrom)
  }

  if (dateTo) {
    query = query.lte('statement_date', dateTo)
  }

  const { data, count, error } = await query
  return { data: data ?? [], count: count ?? 0, error }
}

/**
 * Bulk update verification status for multiple statements.
 */
export async function bulkUpdateStatus(
  supabase: SupabaseClient,
  ids: string[],
  status: VerificationStatus
) {
  const now = new Date().toISOString()
  const { error } = await supabase
    .from('statements')
    .update({
      verification_status: status,
      reviewed_at: now,
      updated_at: now,
    })
    .in('id', ids)

  return { error }
}

/**
 * Get admin dashboard statistics.
 */
export async function getAdminDashboardStats(supabase: SupabaseClient) {
  const [verified, unverified, disputed, removed, recent] = await Promise.all([
    supabase.from('statements').select('id', { count: 'exact', head: true }).eq('verification_status', 'verified'),
    supabase.from('statements').select('id', { count: 'exact', head: true }).eq('verification_status', 'unverified'),
    supabase.from('statements').select('id', { count: 'exact', head: true }).eq('verification_status', 'disputed'),
    supabase.from('statements').select('id', { count: 'exact', head: true }).eq('verification_status', 'removed'),
    supabase.from('statements').select('id', { count: 'exact', head: true }).gte('created_at', new Date(Date.now() - 7 * 86_400_000).toISOString()),
  ])

  return {
    verified: verified.count ?? 0,
    unverified: unverified.count ?? 0,
    disputed: disputed.count ?? 0,
    removed: removed.count ?? 0,
    recentWeek: recent.count ?? 0,
  }
}

/**
 * Get list of politicians for admin filter dropdowns.
 */
export async function getAdminPoliticianOptions(supabase: SupabaseClient) {
  const { data } = await supabase
    .from('politicians')
    .select('id, common_name, party')
    .order('common_name')

  return data ?? []
}
