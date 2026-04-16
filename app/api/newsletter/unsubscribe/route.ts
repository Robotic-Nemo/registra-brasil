import { NextRequest, NextResponse } from 'next/server'
import { unsubscribeEmail, verifyUnsubscribeToken, isValidEmail } from '@/lib/utils/newsletter'

export const runtime = 'edge'

/**
 * POST /api/newsletter/unsubscribe — Unsubscribe an email from the newsletter.
 * Requires email + token for security.
 */
export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const { email, token } = body as { email?: string; token?: string }

    if (!email || typeof email !== 'string' || !isValidEmail(email)) {
      return NextResponse.json(
        { error: { code: 'INVALID_INPUT', message: 'Valid email is required' } },
        { status: 400 }
      )
    }

    if (!token || typeof token !== 'string') {
      return NextResponse.json(
        { error: { code: 'INVALID_INPUT', message: 'Unsubscribe token is required' } },
        { status: 400 }
      )
    }

    const valid = await verifyUnsubscribeToken(email, token)
    if (!valid) {
      return NextResponse.json(
        { error: { code: 'INVALID_TOKEN', message: 'Invalid unsubscribe token' } },
        { status: 403 }
      )
    }

    const result = await unsubscribeEmail(email)

    if (!result.success) {
      return NextResponse.json(
        { error: { code: 'UNSUBSCRIBE_FAILED', message: result.error } },
        { status: 500 }
      )
    }

    return NextResponse.json({ success: true, message: 'Unsubscribed successfully' })
  } catch {
    return NextResponse.json(
      { error: { code: 'INTERNAL_ERROR', message: 'An unexpected error occurred' } },
      { status: 500 }
    )
  }
}

/**
 * GET /api/newsletter/unsubscribe — One-click unsubscribe via link.
 */
export async function GET(request: NextRequest) {
  const { searchParams } = new URL(request.url)
  const email = searchParams.get('email')
  const token = searchParams.get('token')

  if (!email || !token || !isValidEmail(email)) {
    return new NextResponse('Invalid unsubscribe link.', { status: 400 })
  }

  const valid = await verifyUnsubscribeToken(email, token)
  if (!valid) {
    return new NextResponse('Invalid unsubscribe link.', { status: 403 })
  }

  await unsubscribeEmail(email)

  return new NextResponse(
    `<!DOCTYPE html><html lang="pt-BR"><head><meta charset="utf-8"><title>Cancelar inscricao</title></head>
    <body style="font-family:sans-serif;text-align:center;padding:60px 20px">
    <h1>Inscricao cancelada</h1>
    <p>Voce foi removido da nossa lista de emails.</p>
    </body></html>`,
    { headers: { 'Content-Type': 'text/html; charset=utf-8' } }
  )
}
