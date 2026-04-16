import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { generateWebhookSecret } from '@/lib/webhooks/signer'
import { isValidWebhookEvent, ALL_WEBHOOK_EVENTS } from '@/lib/webhooks/events'
import type { WebhookEventType } from '@/lib/webhooks/types'

export const runtime = 'edge'

/**
 * GET /api/webhooks — List registered webhooks (admin only).
 */
export async function GET(request: NextRequest) {
  const rateLimitKey = getRateLimitKey(request, 'webhooks')
  const { allowed } = checkRateLimit(rateLimitKey, { limit: 30, windowMs: 60_000 })
  if (!allowed) {
    return NextResponse.json({ error: 'Rate limit exceeded' }, { status: 429 })
  }

  // Simple API key auth check
  const apiKey = request.headers.get('x-api-key') ?? request.nextUrl.searchParams.get('api_key')
  if (!apiKey || apiKey !== process.env.ADMIN_API_KEY) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }

  const supabase = getSupabaseServiceClient()
  const { data, error } = await supabase
    .from('webhooks')
    .select('id, url, description, events, is_active, created_at, updated_at')
    .order('created_at', { ascending: false })

  if (error) {
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }

  return NextResponse.json({ data: data ?? [] })
}

/**
 * POST /api/webhooks — Register a new webhook endpoint.
 */
export async function POST(request: NextRequest) {
  const rateLimitKey = getRateLimitKey(request, 'webhooks-create')
  const { allowed } = checkRateLimit(rateLimitKey, { limit: 10, windowMs: 60_000 })
  if (!allowed) {
    return NextResponse.json({ error: 'Rate limit exceeded' }, { status: 429 })
  }

  const apiKey = request.headers.get('x-api-key') ?? ''
  if (!apiKey || apiKey !== process.env.ADMIN_API_KEY) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }

  let body: { url?: string; events?: string[]; description?: string }
  try {
    body = await request.json()
  } catch {
    return NextResponse.json({ error: 'Invalid JSON body' }, { status: 400 })
  }

  // Validate URL
  if (!body.url || typeof body.url !== 'string') {
    return NextResponse.json({ error: 'Missing "url" field' }, { status: 400 })
  }

  try {
    new URL(body.url)
  } catch {
    return NextResponse.json({ error: 'Invalid URL' }, { status: 400 })
  }

  // Validate events
  const events = body.events ?? ALL_WEBHOOK_EVENTS
  const invalidEvents = events.filter(e => !isValidWebhookEvent(e))
  if (invalidEvents.length > 0) {
    return NextResponse.json(
      { error: `Invalid events: ${invalidEvents.join(', ')}` },
      { status: 400 }
    )
  }

  const secret = generateWebhookSecret()

  const supabase = getSupabaseServiceClient()
  const { data, error } = await supabase
    .from('webhooks')
    .insert({
      url: body.url,
      description: body.description ?? null,
      events: events as WebhookEventType[],
      secret,
      is_active: true,
    } as any)
    .select('id, url, description, events, secret, is_active, created_at')
    .single()

  if (error) {
    console.error('[api/webhooks] Insert error:', error)
    return NextResponse.json({ error: 'Failed to create webhook' }, { status: 500 })
  }

  return NextResponse.json({ data }, { status: 201 })
}

/**
 * DELETE /api/webhooks — Deactivate a webhook by ID.
 */
export async function DELETE(request: NextRequest) {
  const apiKey = request.headers.get('x-api-key') ?? ''
  if (!apiKey || apiKey !== process.env.ADMIN_API_KEY) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }

  const webhookId = request.nextUrl.searchParams.get('id')
  if (!webhookId) {
    return NextResponse.json({ error: 'Missing "id" parameter' }, { status: 400 })
  }

  const supabase = getSupabaseServiceClient()
  const { error } = await (supabase.from('webhooks') as any)
    .update({ is_active: false })
    .eq('id', webhookId)

  if (error) {
    return NextResponse.json({ error: 'Failed to deactivate webhook' }, { status: 500 })
  }

  return NextResponse.json({ success: true })
}
