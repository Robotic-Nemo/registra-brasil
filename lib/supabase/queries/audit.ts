import type { AuditEntry, AuditLogFilters } from '@/types/audit'
import { createLogger } from '@/lib/utils/logger'

const log = createLogger('supabase/audit')
const DEFAULT_PER_PAGE = 25
const MAX_PER_PAGE = 200

/**
 * Fetch paginated audit log entries with optional filters.
 */
export async function getAuditLog(
  filters: AuditLogFilters = {}
): Promise<{ data: AuditEntry[]; count: number }> {
  const { getSupabaseServiceClient } = await import('@/lib/supabase/server')
  const supabase = getSupabaseServiceClient()

  const page = Math.max(1, Number.isFinite(filters.page as number) ? (filters.page as number) : 1)
  const perPage = Math.min(
    MAX_PER_PAGE,
    Math.max(1, Number.isFinite(filters.per_page as number) ? (filters.per_page as number) : DEFAULT_PER_PAGE),
  )
  const from = (page - 1) * perPage
  const to = from + perPage - 1

  let query = supabase
    .from('audit_log')
    .select('*', { count: 'exact' })
    .order('created_at', { ascending: false })
    .range(from, to)

  if (filters.action) {
    query = query.eq('action', filters.action)
  }
  if (filters.entity_type) {
    query = query.eq('entity_type', filters.entity_type)
  }
  if (filters.entity_id) {
    query = query.eq('entity_id', filters.entity_id)
  }
  if (filters.actor_id) {
    query = query.eq('actor_id', filters.actor_id)
  }
  if (filters.from) {
    query = query.gte('created_at', filters.from)
  }
  if (filters.to) {
    query = query.lte('created_at', filters.to)
  }

  const { data, count, error } = await query

  if (error) {
    log.error('fetch audit log failed', { err: error.message })
    return { data: [], count: 0 }
  }

  return { data: (data as AuditEntry[]) ?? [], count: count ?? 0 }
}

/**
 * Fetch audit log entries for a specific entity.
 */
export async function getAuditLogByEntity(
  entityType: string,
  entityId: string,
  limit = 50
): Promise<AuditEntry[]> {
  const { getSupabaseServiceClient } = await import('@/lib/supabase/server')
  const supabase = getSupabaseServiceClient()

  const { data, error } = await supabase
    .from('audit_log')
    .select('*')
    .eq('entity_type', entityType)
    .eq('entity_id', entityId)
    .order('created_at', { ascending: false })
    .limit(limit)

  if (error) {
    log.error('fetch entity audit log failed', { err: error.message, entityType, entityId })
    return []
  }

  return (data as AuditEntry[]) ?? []
}
