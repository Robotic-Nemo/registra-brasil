import type { AuditAction, AuditEntityType } from '@/types/audit'

interface LogAuditOptions {
  action: AuditAction
  entity_type: AuditEntityType
  entity_id: string
  details?: Record<string, unknown>
  actor_id?: string | null
  actor_label?: string | null
  ip_address?: string | null
}

/**
 * Insert an audit log entry into the audit_log table.
 * Fails silently to avoid breaking the main operation.
 */
export async function logAudit(options: LogAuditOptions): Promise<void> {
  try {
    const { getSupabaseServiceClient } = await import('@/lib/supabase/server')
    const supabase = getSupabaseServiceClient()

    await supabase.from('audit_log').insert({
      action: options.action,
      entity_type: options.entity_type,
      entity_id: options.entity_id,
      details: options.details ?? null,
      actor_id: options.actor_id ?? null,
      actor_label: options.actor_label ?? null,
      ip_address: options.ip_address ?? null,
    } as any)
  } catch (error) {
    // Log to console but don't throw — audit should never break main flows
    console.error('[audit] Failed to log audit entry:', error)
  }
}

/**
 * Shorthand to log a CREATE action.
 */
export function logCreate(
  entity_type: AuditEntityType,
  entity_id: string,
  details?: Record<string, unknown>,
  actor_label?: string
) {
  return logAudit({
    action: 'create' as AuditAction,
    entity_type,
    entity_id,
    details,
    actor_label,
  })
}

/**
 * Shorthand to log an UPDATE action.
 */
export function logUpdate(
  entity_type: AuditEntityType,
  entity_id: string,
  details?: Record<string, unknown>,
  actor_label?: string
) {
  return logAudit({
    action: 'update' as AuditAction,
    entity_type,
    entity_id,
    details,
    actor_label,
  })
}

/**
 * Shorthand to log a DELETE action.
 */
export function logDelete(
  entity_type: AuditEntityType,
  entity_id: string,
  details?: Record<string, unknown>,
  actor_label?: string
) {
  return logAudit({
    action: 'delete' as AuditAction,
    entity_type,
    entity_id,
    details,
    actor_label,
  })
}
