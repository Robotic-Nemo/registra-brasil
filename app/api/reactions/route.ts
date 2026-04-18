import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'

const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i
const VALID_REACTIONS = new Set(['importante', 'contestada', 'fora_de_contexto', 'erro'])

async function hashIp(ip: string): Promise<string> {
  const salt = new Date().toISOString().slice(0, 10) // daily
  const data = new TextEncoder().encode(`${ip}|${salt}|reactions`)
  const buf = await crypto.subtle.digest('SHA-256', data)
  return Array.from(new Uint8Array(buf)).map((b) => b.toString(16).padStart(2, '0')).join('').slice(0, 32)
}

function resolveIp(req: NextRequest): string {
  const xff = req.headers.get('x-forwarded-for') ?? ''
  return xff.split(',')[0]?.trim() || req.headers.get('x-real-ip') || 'unknown'
}

/**
 * POST /api/reactions — Record one reaction.
 * Body: { statement_id, reaction }
 * Rate-limit: 30 per 10 min per IP to prevent brigading.
 */
export async function POST(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'reactions'), {
    limit: 30, windowMs: 10 * 60 * 1000,
  })
  if (!rl.allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED' } },
      { status: 429, headers: { 'Retry-After': String(Math.ceil((rl.resetAt - Date.now()) / 1000)) } },
    )
  }

  let body: { statement_id?: string; reaction?: string }
  try { body = await request.json() } catch {
    return NextResponse.json({ error: { code: 'INVALID_JSON' } }, { status: 400 })
  }

  if (!body.statement_id || !UUID_RE.test(body.statement_id)) {
    return NextResponse.json({ error: { code: 'INVALID_ID' } }, { status: 400 })
  }
  if (!body.reaction || !VALID_REACTIONS.has(body.reaction)) {
    return NextResponse.json({ error: { code: 'INVALID_REACTION' } }, { status: 400 })
  }

  const ip = resolveIp(request)
  const ip_hash = await hashIp(ip)

  const supabase = getSupabaseServiceClient()
  const { error } = await (supabase.from('statement_reactions') as any).insert({
    statement_id: body.statement_id,
    reaction: body.reaction,
    submitter_ip_hash: ip_hash,
  })

  if (error) {
    // 23505 = unique_violation → duplicate reaction from same IP. Treat as no-op success.
    if ((error as any).code === '23505') {
      return NextResponse.json({ success: true, alreadyRecorded: true })
    }
    console.error('[reactions] insert:', error)
    return NextResponse.json({ error: { code: 'INTERNAL_ERROR' } }, { status: 500 })
  }

  // Return fresh counts so the client can update without a second round-trip.
  const { data: counts } = await (supabase.from('statement_reaction_counts') as any)
    .select('*')
    .eq('statement_id', body.statement_id)
    .maybeSingle()

  return NextResponse.json({ success: true, counts: counts ?? null })
}

/**
 * GET /api/reactions?statement_id=<uuid> — Fetch counts for one statement.
 * Cheap: aggregated view backed by index scan.
 */
export async function GET(request: NextRequest) {
  const id = request.nextUrl.searchParams.get('statement_id')
  if (!id || !UUID_RE.test(id)) {
    return NextResponse.json({ error: { code: 'INVALID_ID' } }, { status: 400 })
  }
  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('statement_reaction_counts') as any)
    .select('*')
    .eq('statement_id', id)
    .maybeSingle()

  const counts = data ?? {
    statement_id: id,
    importante: 0,
    contestada: 0,
    fora_de_contexto: 0,
    erro: 0,
    total: 0,
    last_reacted_at: null,
  }
  return NextResponse.json({ counts }, {
    headers: { 'Cache-Control': 'public, s-maxage=30, stale-while-revalidate=60' },
  })
}
