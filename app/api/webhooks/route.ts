import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { generateWebhookSecret } from '@/lib/webhooks/signer'
import { isValidWebhookEvent, ALL_WEBHOOK_EVENTS } from '@/lib/webhooks/events'
import type { WebhookEventType } from '@/lib/webhooks/types'

export const runtime = 'edge'

const MAX_URL_LEN = 2048
const MAX_DESCRIPTION_LEN = 500
const UUID_PATTERN = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i
// Block private/reserved IP literals and common internal hostnames.
const BLOCKED_HOSTS = /^(localhost|127\.|0\.|10\.|169\.254\.|192\.168\.|172\.(1[6-9]|2\d|3[01])\.|::1|fe80:|fc00:|fd)/i

function timingSafeEq(a: string, b: string): boolean {
  const len = Math.max(a.length, b.length)
  let r = a.length === b.length ? 0 : 1
  for (let i = 0; i < len; i++) {
    r |= (a.charCodeAt(i) || 0) ^ (b.charCodeAt(i) || 0)
  }
  return r === 0
}

function isAuthorized(request: NextRequest): boolean {
  // Header-only; query params leak via logs.
  const apiKey = request.headers.get('x-api-key') ?? ''
  const expected = process.env.ADMIN_API_KEY
  return Boolean(apiKey) && Boolean(expected) && timingSafeEq(apiKey, expected as string)
}

function isValidWebhookUrl(url: string): boolean {
  if (url.length > MAX_URL_LEN) return false
  try {
    const parsed = new URL(url)
    if (parsed.protocol !== 'https:' && parsed.protocol !== 'http:') return false
    if (BLOCKED_HOSTS.test(parsed.hostname)) return false
    if (parsed.username || parsed.password) return false
    return true
  } catch {
    return false
  }
}

/**
 * GET /api/webhooks — List registered webhooks (admin only).
 */
export async function GET(request: NextRequest) {
  const rateLimitKey = getRateLimitKey(request, 'webhooks')
  const { allowed } = checkRateLimit(rateLimitKey, { limit: 30, windowMs: 60_000 })
  if (!allowed) {
    return NextResponse.json({ error: 'Rate limit exceeded' }, { status: 429 })
  }

  if (!isAuthorized(request)) {
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

  if (!isAuthorized(request)) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }

  let body: { url?: string; events?: string[]; description?: string }
  try {
    body = await request.json()
  } catch {
    return NextResponse.json({ error: 'Invalid JSON body' }, { status: 400 })
  }

  // Validate URL (length, protocol, public host — SSRF defense).
  if (!body.url || typeof body.url !== 'string') {
    return NextResponse.json({ error: 'Missing "url" field' }, { status: 400 })
  }

  if (!isValidWebhookUrl(body.url)) {
    return NextResponse.json(
      { error: 'Invalid URL (must be http/https, public host, under 2 KB, no credentials)' },
      { status: 400 }
    )
  }

  if (body.description !== undefined &&
      (typeof body.description !== 'string' || body.description.length > MAX_DESCRIPTION_LEN)) {
    return NextResponse.json(
      { error: `Description must be a string under ${MAX_DESCRIPTION_LEN} chars` },
      { status: 400 }
    )
  }

  if (body.events !== undefined && !Array.isArray(body.events)) {
    return NextResponse.json({ error: 'events must be an array' }, { status: 400 })
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
  const rateLimitKey = getRateLimitKey(request, 'webhooks-delete')
  const { allowed } = checkRateLimit(rateLimitKey, { limit: 10, windowMs: 60_000 })
  if (!allowed) {
    return NextResponse.json({ error: 'Rate limit exceeded' }, { status: 429 })
  }

  if (!isAuthorized(request)) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }

  const webhookId = request.nextUrl.searchParams.get('id')
  if (!webhookId || !UUID_PATTERN.test(webhookId)) {
    return NextResponse.json({ error: 'Invalid "id" parameter' }, { status: 400 })
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
