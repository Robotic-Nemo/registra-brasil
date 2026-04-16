import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { signWebhookPayload } from '@/lib/webhooks/signer'
import { buildEventPayload } from '@/lib/webhooks/events'
import type { WebhookRegistration } from '@/lib/webhooks/types'

export const runtime = 'edge'

/**
 * POST /api/webhooks/test — Send a test webhook delivery to a registered endpoint.
 * Body: { webhook_id: string }
 */
export async function POST(request: NextRequest) {
  const rateLimitKey = getRateLimitKey(request, 'webhooks-test')
  const { allowed } = checkRateLimit(rateLimitKey, { limit: 5, windowMs: 60_000 })
  if (!allowed) {
    return NextResponse.json({ error: 'Rate limit exceeded' }, { status: 429 })
  }

  const apiKey = request.headers.get('x-api-key') ?? ''
  if (!apiKey || apiKey !== process.env.ADMIN_API_KEY) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }

  let body: { webhook_id?: string }
  try {
    body = await request.json()
  } catch {
    return NextResponse.json({ error: 'Invalid JSON body' }, { status: 400 })
  }

  if (!body.webhook_id) {
    return NextResponse.json({ error: 'Missing "webhook_id" field' }, { status: 400 })
  }

  const supabase = getSupabaseServiceClient()
  const { data: webhook, error } = await supabase
    .from('webhooks')
    .select('id, url, secret, is_active, events')
    .eq('id', body.webhook_id)
    .single()

  if (error || !webhook) {
    return NextResponse.json({ error: 'Webhook not found' }, { status: 404 })
  }

  const wh = webhook as unknown as WebhookRegistration

  if (!wh.is_active) {
    return NextResponse.json({ error: 'Webhook is not active' }, { status: 400 })
  }

  // Build a test payload
  const testPayload = buildEventPayload('statement.created', {
    _test: true,
    id: 'test-' + crypto.randomUUID().slice(0, 8),
    summary: 'This is a test webhook delivery from Registra Brasil',
    statement_date: new Date().toISOString().slice(0, 10),
  })

  const payloadStr = JSON.stringify(testPayload)
  const signature = await signWebhookPayload(payloadStr, wh.secret)

  const startTime = Date.now()
  let result: { success: boolean; status: number | null; body: string | null; duration_ms: number; error?: string }

  try {
    const response = await fetch(wh.url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-Webhook-Signature': signature,
        'X-Webhook-Event': 'statement.created',
        'X-Webhook-Test': 'true',
        'User-Agent': 'RegistraBrasil-Webhook/2.0',
      },
      body: payloadStr,
      signal: AbortSignal.timeout(10_000),
    })

    const responseBody = await response.text().catch(() => '')

    result = {
      success: response.ok,
      status: response.status,
      body: responseBody.slice(0, 2000),
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

  return NextResponse.json({ data: result })
}
