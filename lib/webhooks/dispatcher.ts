/**
 * Webhook dispatch queue — delivers events to registered webhook endpoints.
 */

import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { signWebhookPayload } from './signer'
import { buildEventPayload } from './events'
import { shouldRetry, getNextRetryAt, DEFAULT_RETRY_CONFIG } from './retry'
import { safeParseUrl } from '@/lib/security/ssrf'
import type { WebhookEventType, WebhookRegistration, WebhookDeliveryResult } from './types'

const DELIVERY_TIMEOUT_MS = 10_000
const MAX_RESPONSE_BYTES = 2000

/**
 * Dispatch a webhook event to all registered endpoints that subscribe to it.
 *
 * @param event - The event type
 * @param data - The event data payload
 */
export async function dispatchEvent(event: WebhookEventType, data: unknown): Promise<void> {
  const supabase = getSupabaseServiceClient()

  // Fetch active webhooks that subscribe to this event
  const { data: webhooks, error } = await supabase
    .from('webhooks')
    .select('id, url, events, secret, is_active')
    .eq('is_active', true)

  if (error || !webhooks) {
    // Fail-silent here — surfacing webhook system errors to the trigger callsite
    // would couple feature code to infrastructure. Errors are logged downstream.
    return
  }

  const matchingWebhooks = (webhooks as unknown as WebhookRegistration[]).filter(
    wh => wh.events.includes(event)
  )

  if (matchingWebhooks.length === 0) return

  const payload = buildEventPayload(event, data)
  const body = JSON.stringify(payload)

  // Dispatch concurrently (fire-and-forget approach with logging)
  await Promise.allSettled(
    matchingWebhooks.map(wh => deliverWebhook(wh, event, body))
  )
}

/**
 * Deliver a webhook payload to a single endpoint and record the delivery.
 */
async function deliverWebhook(
  webhook: WebhookRegistration,
  event: WebhookEventType,
  body: string
): Promise<void> {
  const supabase = getSupabaseServiceClient()
  const signature = await signWebhookPayload(body, webhook.secret)
  const startTime = Date.now()

  let result: WebhookDeliveryResult

  // Validate the URL immediately before dispatching — the database value could
  // have been created before SSRF checks existed, or via a different code path.
  const parsedUrl = safeParseUrl(webhook.url, { allowHttp: false })
  if (!parsedUrl.ok || !parsedUrl.url) {
    result = {
      success: false,
      status: null,
      body: null,
      duration_ms: Date.now() - startTime,
      error: `SSRF guard: rejected URL (${parsedUrl.reason ?? 'unknown'})`,
    }
  } else {
    try {
      const response = await fetch(parsedUrl.url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-Webhook-Signature': signature,
          'X-Webhook-Event': event,
          'X-Webhook-ID': webhook.id,
          'User-Agent': 'RegistraBrasil-Webhook/2.0',
        },
        body,
        // Prevent redirects — attacker could redirect to private IPs otherwise.
        redirect: 'manual',
        signal: AbortSignal.timeout(DELIVERY_TIMEOUT_MS),
      })

      const responseBody = await response.text().catch(() => '')

      result = {
        success: response.ok,
        status: response.status,
        body: responseBody.slice(0, MAX_RESPONSE_BYTES),
        duration_ms: Date.now() - startTime,
      }
    } catch (err) {
      result = {
        success: false,
        status: null,
        body: null,
        duration_ms: Date.now() - startTime,
        error: err instanceof Error ? err.message : 'Unknown error',
      }
    }
  }

  // Record delivery
  const deliveryRecord = {
    webhook_id: webhook.id,
    event,
    payload: JSON.parse(body),
    request_headers: {
      'Content-Type': 'application/json',
      'X-Webhook-Event': event,
    },
    response_status: result.status,
    response_body: result.body,
    delivered_at: result.success ? new Date().toISOString() : null,
    failed_at: !result.success ? new Date().toISOString() : null,
    attempts: 1,
    max_attempts: DEFAULT_RETRY_CONFIG.maxAttempts + 1,
    next_retry_at: !result.success && shouldRetry(result.status)
      ? getNextRetryAt(1)
      : null,
  }

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const insertResult = await (supabase.from('webhook_deliveries') as any).insert(deliveryRecord)
  if (insertResult.error) {
    // Don't crash the dispatch pipeline on bookkeeping failure — log via logger
    // import would create a cycle, so we keep this as a silent failure and rely
    // on admin alerting / DB monitoring instead.
  }
}

/**
 * Process pending webhook retries.
 * Called by a scheduled job to retry failed deliveries.
 */
export async function processRetries(): Promise<{ processed: number; succeeded: number; failed: number }> {
  const supabase = getSupabaseServiceClient()
  const now = new Date().toISOString()

  const { data: pending } = await supabase
    .from('webhook_deliveries')
    .select('id, webhook_id, event, payload, attempts, max_attempts')
    .is('delivered_at', null)
    .lte('next_retry_at', now)
    .lt('attempts', 6) // max_attempts
    .limit(50)

  if (!pending || pending.length === 0) return { processed: 0, succeeded: 0, failed: 0 }

  let succeeded = 0
  let failed = 0

  for (const delivery of pending as unknown as { id: string; webhook_id: string; event: WebhookEventType; payload: unknown; attempts: number; max_attempts: number }[]) {
    // Get webhook config
    const { data: wh } = await supabase
      .from('webhooks')
      .select('url, secret, is_active')
      .eq('id', delivery.webhook_id)
      .single()

    if (!wh || !(wh as unknown as { is_active: boolean }).is_active) {
      failed++
      continue
    }

    const webhook = wh as unknown as { url: string; secret: string; is_active: boolean }
    const body = JSON.stringify(delivery.payload)
    const signature = await signWebhookPayload(body, webhook.secret)

    try {
      const response = await fetch(webhook.url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-Webhook-Signature': signature,
          'X-Webhook-Event': delivery.event,
          'User-Agent': 'RegistraBrasil-Webhook/2.0',
        },
        body,
        signal: AbortSignal.timeout(DELIVERY_TIMEOUT_MS),
      })

      let responseBody = ''
      try { responseBody = await response.text() } catch { /* ignore */ }

      if (response.ok) {
        await (supabase.from('webhook_deliveries') as any)
          .update({
            delivered_at: new Date().toISOString(),
            response_status: response.status,
            response_body: responseBody.slice(0, 2000),
            attempts: delivery.attempts + 1,
            next_retry_at: null,
          })
          .eq('id', delivery.id)
        succeeded++
      } else {
        const nextRetry = shouldRetry(response.status)
          ? getNextRetryAt(delivery.attempts + 1)
          : null
        await (supabase.from('webhook_deliveries') as any)
          .update({
            response_status: response.status,
            response_body: responseBody.slice(0, 2000),
            attempts: delivery.attempts + 1,
            next_retry_at: nextRetry,
          })
          .eq('id', delivery.id)
        failed++
      }
    } catch {
      const nextRetry = getNextRetryAt(delivery.attempts + 1)
      await (supabase.from('webhook_deliveries') as any)
        .update({
          attempts: delivery.attempts + 1,
          next_retry_at: nextRetry,
          failed_at: new Date().toISOString(),
        })
        .eq('id', delivery.id)
      failed++
    }
  }

  return { processed: pending.length, succeeded, failed }
}
