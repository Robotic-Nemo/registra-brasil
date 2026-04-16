import { NextRequest, NextResponse } from 'next/server'
import { subscribeEmail, isValidEmail } from '@/lib/utils/newsletter'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'edge'

const MAX_EMAIL_LENGTH = 320
const MAX_NAME_LENGTH = 200

/**
 * POST /api/newsletter/subscribe — Subscribe an email to the newsletter.
 * Rate limit: 5 attempts per 10 minutes per IP to prevent list-bombing.
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

    const result = await subscribeEmail(email, name, preferences)

    if (!result.success) {
      return NextResponse.json(
        { error: { code: 'SUBSCRIBE_FAILED', message: result.error } },
        { status: 500 }
      )
    }

    return NextResponse.json({ success: true, message: 'Subscribed successfully' })
  } catch {
    return NextResponse.json(
      { error: { code: 'INTERNAL_ERROR', message: 'An unexpected error occurred' } },
      { status: 500 }
    )
  }
}
