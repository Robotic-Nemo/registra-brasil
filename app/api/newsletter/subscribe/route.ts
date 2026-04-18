import { NextRequest, NextResponse } from 'next/server'
import { beginSubscription, isValidEmail } from '@/lib/utils/newsletter'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { sendEmail } from '@/lib/email/sender'

// sendEmail hits the Resend API via fetch; runs on Node, not Edge.
export const runtime = 'nodejs'

const MAX_EMAIL_LENGTH = 320
const MAX_NAME_LENGTH = 200

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * POST /api/newsletter/subscribe — Begin double-opt-in subscription.
 * Rate limit: 5 attempts per 10 minutes per IP to prevent list-bombing.
 *
 * Response is always "check your inbox" — never confirm whether the
 * address already exists, to avoid leaking subscriber presence.
 */
export async function POST(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'newsletter-subscribe'), {
    limit: 5,
    windowMs: 10 * 60 * 1000,
  })
  if (!rl.allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Too many subscription attempts' } },
      {
        status: 429,
        headers: { 'Retry-After': String(Math.ceil((rl.resetAt - Date.now()) / 1000)) },
      }
    )
  }

  try {
    const body = await request.json()
    const { email, name, preferences } = body as {
      email?: string
      name?: string
      preferences?: { weeklyDigest?: boolean; newStatements?: boolean; verificationUpdates?: boolean }
    }

    if (!email || typeof email !== 'string' || email.length > MAX_EMAIL_LENGTH) {
      return NextResponse.json(
        { error: { code: 'INVALID_INPUT', message: 'Email is required' } },
        { status: 400 }
      )
    }

    if (name !== undefined && (typeof name !== 'string' || name.length > MAX_NAME_LENGTH)) {
      return NextResponse.json(
        { error: { code: 'INVALID_INPUT', message: 'Invalid name' } },
        { status: 400 }
      )
    }

    if (!isValidEmail(email)) {
      return NextResponse.json(
        { error: { code: 'INVALID_EMAIL', message: 'Invalid email format' } },
        { status: 400 }
      )
    }

    const result = await beginSubscription(email, name, preferences)

    if (!result.success) {
      return NextResponse.json(
        { error: { code: 'SUBSCRIBE_FAILED', message: result.error } },
        { status: 500 }
      )
    }

    // Short-circuit: already confirmed — no email needed.
    if (result.alreadyActive || !result.token) {
      return NextResponse.json({
        success: true,
        message: 'Verifique seu e-mail para confirmar a inscrição.',
      })
    }

    const confirmUrl = `${SITE_URL}/api/newsletter/confirm?email=${encodeURIComponent(email)}&token=${result.token}`

    // Fire-and-forget: we don't block the response on email delivery.
    // If email fails, user can request a resend via the subscribe form.
    void sendEmail({
      to: { email },
      subject: 'Confirme sua inscrição — Registra Brasil',
      html: `<!doctype html><html lang="pt-BR"><body style="font-family:system-ui,sans-serif;max-width:560px;margin:0 auto;padding:24px;color:#111">
        <h1 style="font-size:20px;margin:0 0 16px">Confirme sua inscrição</h1>
        <p>Para começar a receber o boletim do Registra Brasil, confirme seu e-mail clicando no link abaixo:</p>
        <p style="margin:24px 0"><a href="${confirmUrl}" style="background:#1d4ed8;color:#fff;padding:12px 20px;border-radius:8px;text-decoration:none;display:inline-block">Confirmar inscrição</a></p>
        <p style="font-size:12px;color:#6b7280">Se você não solicitou esta inscrição, ignore este e-mail — nenhuma ação é necessária. O link expira automaticamente quando substituído por uma nova solicitação.</p>
        <p style="font-size:12px;color:#6b7280">URL direta: <code>${confirmUrl}</code></p>
      </body></html>`,
      text: `Confirme sua inscrição no Registra Brasil clicando em: ${confirmUrl}\n\nSe você não solicitou, ignore este e-mail.`,
      tags: ['newsletter-confirm'],
    }).catch((err) => console.error('[newsletter/subscribe] sendEmail failed:', err))

    return NextResponse.json({
      success: true,
      message: 'Verifique seu e-mail para confirmar a inscrição.',
    })
  } catch {
    return NextResponse.json(
      { error: { code: 'INTERNAL_ERROR', message: 'An unexpected error occurred' } },
      { status: 500 }
    )
  }
}
