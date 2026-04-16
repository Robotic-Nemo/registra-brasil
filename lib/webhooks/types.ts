/**
 * Webhook system types — event types, delivery status, and configuration.
 */

export type WebhookEventType =
  | 'statement.created'
  | 'statement.updated'
  | 'statement.verified'
  | 'statement.disputed'
  | 'statement.removed'
  | 'politician.created'
  | 'politician.updated'
  | 'category.created'
  | 'category.updated'

export interface WebhookRegistration {
  id: string
  url: string
  description: string | null
  events: WebhookEventType[]
  secret: string
  is_active: boolean
  created_by: string | null
  created_at: string
  updated_at: string
}

export interface WebhookDeliveryRecord {
  id: string
  webhook_id: string
  event: WebhookEventType
  payload: WebhookEventPayload
  request_headers: Record<string, string>
  response_status: number | null
  response_body: string | null
  response_headers: Record<string, string> | null
  delivered_at: string | null
  failed_at: string | null
  attempts: number
  max_attempts: number
  next_retry_at: string | null
  created_at: string
}

export interface WebhookEventPayload<T = unknown> {
  id: string
  event: WebhookEventType
  timestamp: string
  data: T
  api_version: 'v2'
}

export interface WebhookDeliveryResult {
  success: boolean
  status: number | null
  body: string | null
  duration_ms: number
  error?: string
}

export interface WebhookStats {
  total_deliveries: number
  successful: number
  failed: number
  pending: number
  avg_response_ms: number
}
