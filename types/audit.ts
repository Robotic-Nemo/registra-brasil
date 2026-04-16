export enum AuditAction {
  CREATE = 'create',
  UPDATE = 'update',
  DELETE = 'delete',
  VERIFY = 'verify',
  DISPUTE = 'dispute',
  APPROVE = 'approve',
  REJECT = 'reject',
  LOGIN = 'login',
  LOGOUT = 'logout',
  EXPORT = 'export',
  IMPORT = 'import',
  MERGE = 'merge',
  RESTORE = 'restore',
}

export type AuditEntityType =
  | 'statement'
  | 'politician'
  | 'category'
  | 'source'
  | 'user'
  | 'setting'

export interface AuditEntry {
  id: string
  action: AuditAction
  entity_type: AuditEntityType
  entity_id: string
  details: Record<string, unknown> | null
  actor_id: string | null
  actor_label: string | null
  ip_address: string | null
  created_at: string
}

export interface AuditLogFilters {
  action?: AuditAction
  entity_type?: AuditEntityType
  entity_id?: string
  actor_id?: string
  from?: string
  to?: string
  page?: number
  per_page?: number
}
