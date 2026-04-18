import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { isValidEmail } from '@/lib/utils/newsletter'
import { issueAlertAccessToken } from '@/lib/utils/alert-access'
import { sendEmail } from '@/lib/email/sender'

export const runtime = 'nodejs'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * POST /api/alerts/request-access — Given an email, emails a tokenized
 * management link. Response is generic (never leaks whether the address
 * has alerts) to avoid enumerating subscribers.
 */
export async function POST(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'alerts-access'), {
    limit: 3, windowMs: 10 * 60 * 1000,
  })
  if (!rl.allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Muitas tentativas.' } },
      { status: 429, headers: { 'Retry-After': String(Math.ceil((rl.resetAt - Date.now()) / 1000)) } },
    )
  }

  let body: { email?: string }
  try { body = await request.json() } catch {
    return NextResponse.json({ error: { code: 'INVALID_JSON' } }, { status: 400 })
  }

  const email = (body.email ?? '').trim().toLowerCase()
  if (!email || !isValidEmail(email) || email.length > 320) {
    return NextResponse.json({ error: { code: 'INVALID_EMAIL' } }, { status: 400 })
  }

  const supabase = getSupabaseServiceClient()
  const { data: hasAny } = await (supabase.from('saved_searches') as any)
    .select('id')
    .eq('email', email)
    .is('unsubscribed_at', null)
    .limit(1)
    .maybeSingle()

  // Only actually dispatch an email if the address has at least one
  // active alert. Response stays generic regardless.
  if (hasAny?.id) {
    const token = await issueAlertAccessToken(email)
    const url = `${SITE_URL}/meus-alertas?email=${encodeURIComponent(email)}&token=${encodeURIComponent(token)}`
    void sendEmail({
      to: { email },
      subject: 'Gerenciar seus alertas — Registra Brasil',
      html: `<!doctype html><html lang="pt-BR"><body style="font-family:system-ui,sans-serif;max-width:560px;margin:0 auto;padding:24px;color:#111">
        <h1 style="font-size:20px;margin:0 0 16px">Link de gestão dos seus alertas</h1>
        <p>Use o link abaixo para ver e cancelar seus alertas. Ele expira em 7 dias.</p>
        <p style="margin:24px 0"><a href="${url}" style="background:#1d4ed8;color:#fff;padding:12px 20px;border-radius:8px;text-decoration:none;display:inline-block">Abrir portal de alertas</a></p>
        <p style="font-size:12px;color:#6b7280">Se não foi você, ignore este e-mail. O link só funciona quando aberto por você.</p>
      </body></html>`,
      text: `Abra o portal dos seus alertas: ${url}\n\nLink válido por 7 dias. Se não foi você, ignore.`,
      tags: ['alerts-access'],
    }).catch((e) => console.error('[alerts/request-access] send:', e))
  }

  return NextResponse.json({
    success: true,
    message: 'Se houver alertas cadastrados para este e-mail, você receberá o link de gerenciamento em instantes.',
  })
}
