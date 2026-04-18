import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { isValidEmail } from '@/lib/utils/newsletter'
import { normalizeQuery, hashQuery, describeQuery, type SavedSearchQuery } from '@/lib/utils/saved-searches'
import { sendEmail } from '@/lib/email/sender'

export const runtime = 'nodejs'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

function newToken(): string {
  const b = new Uint8Array(32)
  crypto.getRandomValues(b)
  return Array.from(b).map((x) => x.toString(16).padStart(2, '0')).join('')
}

/**
 * POST /api/alerts/subscribe — double-opt-in: creates or refreshes a
 * pending row; returns generic confirmation regardless of existing-row
 * state to avoid leaking subscriber presence.
 *
 * Body: { email, label?, query: SavedSearchQuery }
 */
export async function POST(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'alerts-subscribe'), {
    limit: 5, windowMs: 10 * 60 * 1000,
  })
  if (!rl.allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Muitas tentativas.' } },
      { status: 429, headers: { 'Retry-After': String(Math.ceil((rl.resetAt - Date.now()) / 1000)) } },
    )
  }

  let body: { email?: string; label?: string; query?: SavedSearchQuery }
  try { body = await request.json() } catch {
    return NextResponse.json({ error: { code: 'INVALID_JSON' } }, { status: 400 })
  }

  const email = (body.email ?? '').trim().toLowerCase()
  if (!email || !isValidEmail(email) || email.length > 320) {
    return NextResponse.json({ error: { code: 'INVALID_EMAIL' } }, { status: 400 })
  }

  if (!body.query || typeof body.query !== 'object') {
    return NextResponse.json({ error: { code: 'INVALID_QUERY' } }, { status: 400 })
  }

  const normalized = normalizeQuery(body.query)
  if (Object.keys(normalized).length === 0) {
    return NextResponse.json(
      { error: { code: 'EMPTY_QUERY', message: 'Defina pelo menos um critério de busca.' } },
      { status: 400 },
    )
  }

  const query_hash = await hashQuery(normalized)
  const supabase = getSupabaseServiceClient()

  // Short-circuit if already confirmed — don't re-issue token, don't leak.
  const { data: existing } = await (supabase.from('saved_searches') as any)
    .select('is_confirmed')
    .eq('email', email)
    .eq('query_hash', query_hash)
    .maybeSingle()

  if (existing?.is_confirmed) {
    return NextResponse.json({
      success: true,
      message: 'Verifique seu e-mail para confirmar o alerta.',
    })
  }

  const token = newToken()
  const { error } = await (supabase.from('saved_searches') as any).upsert(
    {
      email,
      label: (body.label ?? '').trim().slice(0, 200) || null,
      query: normalized,
      query_hash,
      is_confirmed: false,
      confirmation_token: token,
      confirmation_sent_at: new Date().toISOString(),
      confirmed_at: null,
      unsubscribed_at: null,
      updated_at: new Date().toISOString(),
    },
    { onConflict: 'email,query_hash' },
  )

  if (error) {
    console.error('[alerts/subscribe] upsert:', error)
    return NextResponse.json({ error: { code: 'INTERNAL_ERROR' } }, { status: 500 })
  }

  const confirmUrl = `${SITE_URL}/api/alerts/confirm?email=${encodeURIComponent(email)}&token=${token}`
  const unsubUrl = `${SITE_URL}/api/alerts/unsubscribe?email=${encodeURIComponent(email)}&hash=${query_hash}`
  const desc = describeQuery(normalized)

  void sendEmail({
    to: { email },
    subject: 'Confirme seu alerta de busca — Registra Brasil',
    html: `<!doctype html><html lang="pt-BR"><body style="font-family:system-ui,sans-serif;max-width:560px;margin:0 auto;padding:24px;color:#111">
      <h1 style="font-size:20px;margin:0 0 16px">Confirme seu alerta</h1>
      <p>Você pediu para ser avisado sobre novas declarações que correspondam a:</p>
      <p style="background:#f3f4f6;padding:12px;border-radius:8px;font-family:monospace;font-size:13px">${desc}</p>
      <p style="margin:24px 0"><a href="${confirmUrl}" style="background:#1d4ed8;color:#fff;padding:12px 20px;border-radius:8px;text-decoration:none;display:inline-block">Confirmar alerta</a></p>
      <p style="font-size:12px;color:#6b7280">Se não foi você, ignore este e-mail. Nada é enviado até a confirmação.</p>
      <p style="font-size:12px;color:#6b7280">Cancelar depois: <a href="${unsubUrl}">${unsubUrl}</a></p>
    </body></html>`,
    text: `Confirme seu alerta "${desc}" em: ${confirmUrl}\n\nSe não foi você, ignore este e-mail.`,
    tags: ['alert-confirm'],
  }).catch((err) => console.error('[alerts/subscribe] send:', err))

  return NextResponse.json({
    success: true,
    message: 'Verifique seu e-mail para confirmar o alerta.',
  })
}
