import type { WebhookEvent, WebhookPayload } from '@/types/webhook'

/**
 * Sign a webhook payload with HMAC-SHA256
 */
export async function signPayload(payload: string, secret: string): Promise<string> {
  const encoder = new TextEncoder()
  const key = await crypto.subtle.importKey(
    'raw',
    encoder.encode(secret),
    { name: 'HMAC', hash: 'SHA-256' },
    false,
    ['sign']
  )
  const signature = await crypto.subtle.sign('HMAC', key, encoder.encode(payload))
  return Array.from(new Uint8Array(signature))
    .map(b => b.toString(16).padStart(2, '0'))
    .join('')
}

/**
 * Dispatch a webhook event to a URL
 */
export async function dispatchWebhook(
  url: string,
  event: WebhookEvent,
  data: unknown,
  secret: string
): Promise<{ status: number; body: string }> {
  const payload: WebhookPayload = {
    event,
    timestamp: new Date().toISOString(),
    data,
  }

  const body = JSON.stringify(payload)
  const signature = await signPayload(body, secret)

  const response = await fetch(url, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-Webhook-Signature': `sha256=${signature}`,
      'X-Webhook-Event': event,
      'User-Agent': 'RegistraBrasil-Webhook/1.0',
    },
    body,
    signal: AbortSignal.timeout(10_000),
  })

  const responseBody = await response.text().catch(() => '')

  return {
    status: response.status,
    body: responseBody.slice(0, 1000),
  }
}

/**
 * Verify a webhook signature
 */
export async function verifyWebhookSignature(
  payload: string,
  signature: string,
  secret: string
): Promise<boolean> {
  const expected = await signPayload(payload, secret)
  const received = signature.replace('sha256=', '')

  // Constant-time comparison
  if (expected.length !== received.length) return false

  let result = 0
  for (let i = 0; i < expected.length; i++) {
    result |= expected.charCodeAt(i) ^ received.charCodeAt(i)
  }
  return result === 0
}
