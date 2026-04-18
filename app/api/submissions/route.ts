import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'

const MAX_SUMMARY = 1000
const MIN_SUMMARY = 10
const MAX_QUOTE = 5000
const MAX_URL = 2048
const MAX_NAME = 200
const MAX_EMAIL = 320

const BLOCKED_HOSTS = /^(localhost|127\.|0\.|10\.|169\.254\.|192\.168\.|172\.(1[6-9]|2\d|3[01])\.|::1|fe80:|fc00:|fd)/i

function isValidUrl(url: string): boolean {
  if (typeof url !== 'string' || url.length > MAX_URL) return false
  try {
    const u = new URL(url)
    if (u.protocol !== 'http:' && u.protocol !== 'https:') return false
    if (BLOCKED_HOSTS.test(u.hostname)) return false
    if (u.username || u.password) return false
    return true
  } catch {
    return false
  }
}

async function hashIp(ip: string): Promise<string> {
  // Daily salt means yesterday's hashes can't be joined with today's.
  const salt = new Date().toISOString().slice(0, 10)
  const enc = new TextEncoder()
  const data = enc.encode(`${ip}|${salt}`)
  const buf = await crypto.subtle.digest('SHA-256', data)
  return Array.from(new Uint8Array(buf))
    .map((b) => b.toString(16).padStart(2, '0'))
    .join('')
    .slice(0, 32)
}

/**
 * POST /api/submissions — Receive a public statement submission.
 *
 * Three-tier rate limit:
 *   5 per 10 min per IP  (burst)
 *   20 per hour per IP   (sustained)
 *
 * Auto-rejects suspicious patterns (duplicate within 24h by ip hash).
 */
export async function POST(request: NextRequest) {
  const rlBurst = checkRateLimit(getRateLimitKey(request, 'submissions-burst'), {
    limit: 5,
    windowMs: 10 * 60 * 1000,
  })
  if (!rlBurst.allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Muitas submissões. Tente novamente em alguns minutos.' } },
      { status: 429, headers: { 'Retry-After': String(Math.ceil((rlBurst.resetAt - Date.now()) / 1000)) } },
    )
  }
  const rlHour = checkRateLimit(getRateLimitKey(request, 'submissions-hour'), {
    limit: 20,
    windowMs: 60 * 60 * 1000,
  })
  if (!rlHour.allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Limite horário atingido.' } },
      { status: 429 },
    )
  }

  let body: Record<string, unknown>
  try {
    body = await request.json()
  } catch {
    return NextResponse.json({ error: { code: 'INVALID_JSON', message: 'Corpo inválido.' } }, { status: 400 })
  }

  const str = (k: string, max: number): string | undefined => {
    const v = body[k]
    if (typeof v !== 'string') return undefined
    const t = v.trim()
    if (!t || t.length > max) return undefined
    return t
  }

  const summary = str('summary', MAX_SUMMARY)
  const primary_source_url = str('primary_source_url', MAX_URL)
  const politician_slug = str('politician_slug', 200)
  const politician_name_raw = str('politician_name_raw', MAX_NAME)

  if (!summary || summary.length < MIN_SUMMARY) {
    return NextResponse.json(
      { error: { code: 'INVALID_SUMMARY', message: `Resumo deve ter entre ${MIN_SUMMARY} e ${MAX_SUMMARY} caracteres.` } },
      { status: 400 },
    )
  }
  if (!primary_source_url || !isValidUrl(primary_source_url)) {
    return NextResponse.json(
      { error: { code: 'INVALID_URL', message: 'URL da fonte primária é obrigatória e deve ser http(s) público.' } },
      { status: 400 },
    )
  }
  if (!politician_slug && !politician_name_raw) {
    return NextResponse.json(
      { error: { code: 'MISSING_POLITICIAN', message: 'Indique o político (seleção ou nome).' } },
      { status: 400 },
    )
  }

  const full_quote = str('full_quote', MAX_QUOTE) ?? null
  const context = str('context', 2000) ?? null
  const venue = str('venue', 300) ?? null
  const submitter_email = str('submitter_email', MAX_EMAIL) ?? null
  const submitter_name = str('submitter_name', MAX_NAME) ?? null
  const submitter_notes = str('submitter_notes', 2000) ?? null
  const statement_date_raw = str('statement_date', 10) ?? null
  const statement_date = statement_date_raw && /^\d{4}-\d{2}-\d{2}$/.test(statement_date_raw) ? statement_date_raw : null

  if (submitter_email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(submitter_email)) {
    return NextResponse.json(
      { error: { code: 'INVALID_EMAIL', message: 'E-mail do remetente inválido.' } },
      { status: 400 },
    )
  }

  // Honeypot: form has a hidden `website` field; bots fill it, humans don't.
  if (typeof body.website === 'string' && body.website.trim().length > 0) {
    // Accept silently to avoid giving feedback to bots.
    return NextResponse.json({ success: true })
  }

  const supabase = getSupabaseServiceClient()

  let politician_id: string | null = null
  if (politician_slug) {
    const { data } = await (supabase.from('politicians') as any)
      .select('id')
      .eq('slug', politician_slug)
      .maybeSingle()
    if (data?.id) politician_id = data.id
  }

  const forwardedFor = request.headers.get('x-forwarded-for') ?? ''
  const ip = forwardedFor.split(',')[0]?.trim() || request.headers.get('x-real-ip') || 'unknown'
  const ip_hash = await hashIp(ip)

  // Dedupe: same ip_hash + same source URL in the last 24h = likely an
  // accidental resubmit; short-circuit with a friendly message instead of
  // filling the queue.
  const { data: dupe } = await (supabase.from('statement_submissions') as any)
    .select('id')
    .eq('submitter_ip_hash', ip_hash)
    .eq('primary_source_url', primary_source_url)
    .gt('created_at', new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString())
    .maybeSingle()
  if (dupe?.id) {
    return NextResponse.json({
      success: true,
      message: 'Recebemos sua submissão anteriormente — obrigado!',
    })
  }

  const { error } = await (supabase.from('statement_submissions') as any).insert({
    politician_id,
    politician_name_raw: politician_id ? null : politician_name_raw,
    summary,
    full_quote,
    statement_date,
    venue,
    primary_source_url,
    context,
    submitter_email,
    submitter_name,
    submitter_notes,
    submitter_ip_hash: ip_hash,
    status: 'pending',
  })

  if (error) {
    console.error('[api/submissions] insert error:', error)
    return NextResponse.json(
      { error: { code: 'INTERNAL_ERROR', message: 'Não foi possível registrar a submissão.' } },
      { status: 500 },
    )
  }

  return NextResponse.json({
    success: true,
    message: 'Obrigado! Nossa equipe editorial revisará em breve.',
  })
}
