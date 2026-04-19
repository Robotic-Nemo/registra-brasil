import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { createLogger } from '@/lib/utils/logger'

export const runtime = 'nodejs'

const log = createLogger('api/report-issue')
const VALID_KINDS = new Set(['typo', 'broken_link', 'wrong_info', 'accessibility', 'other'])
const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
const URL_RE = /^\/[^\s]{0,1023}$/ // must be site-relative

export async function POST(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'report-issue'), {
    limit: 5,
    windowMs: 10 * 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Muitas submissões, tente em alguns minutos.' } },
      { status: 429, headers: { 'Retry-After': String(Math.ceil((rl.resetAt - Date.now()) / 1000)) } },
    )
  }

  let body: Record<string, unknown>
  try {
    body = (await request.json()) as Record<string, unknown>
  } catch {
    return NextResponse.json({ error: { code: 'BAD_JSON', message: 'JSON inválido' } }, { status: 400 })
  }

  const url = typeof body.url === 'string' ? body.url.trim() : ''
  const kind = typeof body.kind === 'string' ? body.kind : ''
  const message = typeof body.message === 'string' ? body.message.trim() : ''
  const email = typeof body.email === 'string' ? body.email.trim() : ''

  if (!URL_RE.test(url)) {
    return NextResponse.json({ error: { code: 'BAD_URL', message: 'URL deve ser relativa ao site' } }, { status: 400 })
  }
  if (!VALID_KINDS.has(kind)) {
    return NextResponse.json({ error: { code: 'BAD_KIND', message: 'Tipo inválido' } }, { status: 400 })
  }
  if (message.length < 4 || message.length > 4000) {
    return NextResponse.json({ error: { code: 'BAD_MESSAGE', message: 'Mensagem muito curta ou muito longa' } }, { status: 400 })
  }
  if (email && !EMAIL_RE.test(email)) {
    return NextResponse.json({ error: { code: 'BAD_EMAIL', message: 'Email inválido' } }, { status: 400 })
  }

  const userAgent = request.headers.get('user-agent')?.slice(0, 500) ?? null

  const supabase = getSupabaseServiceClient()
  const { error } = await (supabase.from('page_issues') as any).insert({
    url,
    kind,
    message,
    email: email || null,
    user_agent: userAgent,
  })
  if (error) {
    log.error('insert failed', { err: error.message })
    return NextResponse.json({ error: { code: 'DB_ERROR', message: 'Falha ao registrar' } }, { status: 500 })
  }

  return NextResponse.json({ ok: true })
}
