export type WebhookEvent =
  | 'statement.created'
  | 'statement.verified'
  | 'statement.disputed'
  | 'statement.removed'
  | 'politician.created'
  | 'politician.updated'

export interface WebhookPayload<T = unknown> {
  event: WebhookEvent
  timestamp: string
  data: T
}

export interface WebhookConfig {
  id: string
  url: string
  events: WebhookEvent[]
  secret: string
  is_active: boolean
  created_at: string
}

export interface WebhookDelivery {
  id: string
  webhook_id: string
  event: WebhookEvent
  payload: WebhookPayload
  response_status: number | null
  response_body: string | null
  delivered_at: string | null
  attempts: number
  last_attempt_at: string
}
