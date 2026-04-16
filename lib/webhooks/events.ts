/**
 * Webhook event definitions and payload builders.
 */

import type { WebhookEventType, WebhookEventPayload } from './types'

/** Map of event types to human-readable descriptions */
export const WEBHOOK_EVENT_DESCRIPTIONS: Record<WebhookEventType, string> = {
  'statement.created': 'Fired when a new statement is added',
  'statement.updated': 'Fired when a statement is edited',
  'statement.verified': 'Fired when a statement is marked as verified',
  'statement.disputed': 'Fired when a statement is disputed',
  'statement.removed': 'Fired when a statement is removed',
  'politician.created': 'Fired when a new politician profile is created',
  'politician.updated': 'Fired when a politician profile is updated',
  'category.created': 'Fired when a new category is created',
  'category.updated': 'Fired when a category is updated',
}

/** All available webhook event types */
export const ALL_WEBHOOK_EVENTS: WebhookEventType[] = Object.keys(WEBHOOK_EVENT_DESCRIPTIONS) as WebhookEventType[]

/** Event categories for grouping in UI */
export const WEBHOOK_EVENT_CATEGORIES = {
  statement: ALL_WEBHOOK_EVENTS.filter(e => e.startsWith('statement.')),
  politician: ALL_WEBHOOK_EVENTS.filter(e => e.startsWith('politician.')),
  category: ALL_WEBHOOK_EVENTS.filter(e => e.startsWith('category.')),
} as const

/**
 * Build a webhook event payload.
 */
export function buildEventPayload<T>(event: WebhookEventType, data: T): WebhookEventPayload<T> {
  return {
    id: crypto.randomUUID(),
    event,
    timestamp: new Date().toISOString(),
    data,
    api_version: 'v2',
  }
}

/**
 * Check if a given string is a valid webhook event type.
 */
export function isValidWebhookEvent(event: string): event is WebhookEventType {
  return ALL_WEBHOOK_EVENTS.includes(event as WebhookEventType)
}
