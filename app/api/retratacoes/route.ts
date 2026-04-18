import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'

const MAX_CLAIM = 5000
const MIN_CLAIM = 20
const MAX_NAME = 200
const MAX_EMAIL = 320
const MAX_URL = 2048

const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i
const KINDS = new Set(['correction', 'retraction', 'right_of_reply', 'clarification', 'takedown_privacy'])
const BLOCKED_HOSTS = /^(localhost|127\.|0\.|10\.|169\.254\.|192\.168\.|172\.(1[6-9]|2\d|3[01])\.|::1|fe80:|fc00:|fd)/i

function validUrl(u: string): boolean {
  if (!u || u.length > MAX_URL) return false
  try {
    const p = new URL(u)
    if (p.protocol !== 'http:' && p.protocol !== 'https:') return false
    if (BLOCKED_HOSTS.test(p.hostname)) return false
    return true
  } catch { return false }
}

async function hashIp(ip: string): Promise<string> {
  const salt = new Date().toISOString().slice(0, 10)
  const buf = await crypto.subtle.digest('SHA-256', new TextEncoder().encode(`${ip}|${salt}|retraction`))
  return Array.from(new Uint8Array(buf)).map((b) => b.toString(16).padStart(2, '0')).join('').slice(0, 32)
}

/**
 * POST /api/retratacoes — Public right-of-reply / correction petition.
 * Rate limit: 3 per hour per IP (strict; abuse here wastes editorial time).
 */
export async function POST(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'retraction'), {
    limit: 3, windowMs: 60 * 60 * 1000,
  })
  if (!rl.allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Limite horário atingido.' } },
      { status: 429, headers: { 'Retry-After': String(Math.ceil((rl.resetAt - Date.now()) / 1000)) } },
    )
  }

  let body: Record<string, unknown>
  try { body = await request.json() } catch {
    return NextResponse.json({ error: { code: 'INVALID_JSON' } }, { status: 400 })
  }

  const str = (k: string, max: number): string | undefined => {
    const v = body[k]
    if (typeof v !== 'string') return undefined
    const t = v.trim()
    if (!t || t.length > max) return undefined
    return t
  }

  // Honeypot: bots fill this, humans don't.
  if (typeof body.website === 'string' && body.website.trim().length > 0) {
    return NextResponse.json({ success: true })
  }

  const statement_id = str('statement_id', 40)
  const statement_url = str('statement_url', MAX_URL)
  if (!statement_id && !statement_url) {
    return NextResponse.json({ error: { code: 'MISSING_TARGET', message: 'Indique a declaração (ID ou URL).' } }, { status: 400 })
  }
  if (statement_id && !UUID_RE.test(statement_id)) {
    return NextResponse.json({ error: { code: 'INVALID_ID' } }, { status: 400 })
  }
  if (statement_url && !validUrl(statement_url)) {
    return NextResponse.json({ error: { code: 'INVALID_URL' } }, { status: 400 })
  }

  const kind = str('kind', 40)
  if (!kind || !KINDS.has(kind)) {
    return NextResponse.json({ error: { code: 'INVALID_KIND' } }, { status: 400 })
  }

  const petitioner_name = str('petitioner_name', MAX_NAME)
  const petitioner_email = str('petitioner_email', MAX_EMAIL)
  if (!petitioner_name || petitioner_name.length < 2) {
    return NextResponse.json({ error: { code: 'MISSING_NAME' } }, { status: 400 })
  }
  if (!petitioner_email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(petitioner_email)) {
    return NextResponse.json({ error: { code: 'INVALID_EMAIL' } }, { status: 400 })
  }

  const claim = str('claim', MAX_CLAIM)
  if (!claim || claim.length < MIN_CLAIM) {
    return NextResponse.json(
      { error: { code: 'INVALID_CLAIM', message: `Descrição deve ter ${MIN_CLAIM}–${MAX_CLAIM} caracteres.` } },
      { status: 400 },
    )
  }

  const desired_remedy = str('desired_remedy', 5000) ?? null
  const evidence_urls = str('evidence_urls', 3000) ?? null
  const petitioner_role = str('petitioner_role', 200) ?? null
  const represents_slug = str('represents_politician_slug', 200)

  const ip = (request.headers.get('x-forwarded-for') ?? '').split(',')[0]?.trim()
    || request.headers.get('x-real-ip') || 'unknown'
  const ip_hash = await hashIp(ip)

  const supabase = getSupabaseServiceClient()

  let represents_politician_id: string | null = null
  if (represents_slug) {
    const { data } = await (supabase.from('politicians') as any)
      .select('id').eq('slug', represents_slug).maybeSingle()
    if (data?.id) represents_politician_id = data.id
  }

  const { error } = await (supabase.from('retraction_requests') as any).insert({
    statement_id: statement_id ?? null,
    statement_url: statement_id ? null : statement_url,
    kind,
    status: 'pending',
    petitioner_name,
    petitioner_email: petitioner_email.toLowerCase(),
    petitioner_role,
    represents_politician_id,
    claim,
    desired_remedy,
    evidence_urls,
    submitter_ip_hash: ip_hash,
  })

  if (error) {
    console.error('[retratacoes] insert:', error)
    return NextResponse.json({ error: { code: 'INTERNAL_ERROR' } }, { status: 500 })
  }

  return NextResponse.json({
    success: true,
    message: 'Recebemos sua petição. A equipe editorial responde em até 10 dias úteis.',
  })
}
