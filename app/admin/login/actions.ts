'use server'

import { cookies, headers } from 'next/headers'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '@/lib/auth/session'
import { checkRateLimit } from '@/lib/utils/rate-limit'
import { createLogger } from '@/lib/utils/logger'

const log = createLogger('admin/login')
const MAX_SECRET_LENGTH = 512

// Tight per-IP limit to slow brute-force attacks against ADMIN_SECRET.
const LOGIN_RATE_LIMIT = 8
const LOGIN_RATE_WINDOW_MS = 15 * 60 * 1000

async function getClientIp(): Promise<string> {
  const h = await headers()
  return (
    h.get('x-forwarded-for')?.split(',')[0]?.trim() ??
    h.get('x-real-ip') ??
    h.get('cf-connecting-ip') ??
    'unknown'
  )
}

export async function adminLogin(
  formData: FormData
): Promise<{ ok: boolean; message: string }> {
  const adminSecret = process.env.ADMIN_SECRET

  if (!adminSecret) {
    return { ok: false, message: 'ADMIN_SECRET não configurado.' }
  }

  const ip = await getClientIp()
  const { allowed } = checkRateLimit(`admin-login:${ip}`, {
    limit: LOGIN_RATE_LIMIT,
    windowMs: LOGIN_RATE_WINDOW_MS,
  })
  if (!allowed) {
    log.warn('login rate limited', { ip })
    return { ok: false, message: 'Muitas tentativas. Tente novamente em 15 minutos.' }
  }

  const secretRaw = formData.get('secret')
  const secret = typeof secretRaw === 'string' ? secretRaw : ''

  if (!secret || secret.length > MAX_SECRET_LENGTH) {
    return { ok: false, message: 'Senha incorreta.' }
  }

  if (!timingSafeEqual(secret, adminSecret)) {
    log.info('login failed', { ip })
    return { ok: false, message: 'Senha incorreta.' }
  }

  // Store HMAC-derived token — cookie value ≠ raw secret
  const token = await deriveSessionToken(adminSecret)

  const cookieStore = await cookies()
  cookieStore.set(SESSION_COOKIE, token, {
    httpOnly: true,
    secure: process.env.NODE_ENV === 'production',
    sameSite: 'strict',
    maxAge: 60 * 60 * 24 * 7, // 7 days
    path: '/',
  })

  log.info('login ok', { ip })
  return { ok: true, message: 'Autenticado.' }
}

export async function adminLogout(): Promise<void> {
  const cookieStore = await cookies()
  cookieStore.delete(SESSION_COOKIE)
}
