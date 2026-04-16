import { NextRequest, NextResponse } from 'next/server'
import { subscribeEmail, isValidEmail } from '@/lib/utils/newsletter'

export const runtime = 'edge'

/**
 * POST /api/newsletter/subscribe — Subscribe an email to the newsletter.
 */
export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const { email, name, preferences } = body as {
      email?: string
      name?: string
      preferences?: { weeklyDigest?: boolean; newStatements?: boolean; verificationUpdates?: boolean }
    }

    if (!email || typeof email !== 'string') {
      return NextResponse.json(
        { error: { code: 'INVALID_INPUT', message: 'Email is required' } },
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
