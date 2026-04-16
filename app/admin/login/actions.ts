'use server'

import { cookies } from 'next/headers'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '@/lib/auth/session'

export async function adminLogin(
  formData: FormData
): Promise<{ ok: boolean; message: string }> {
  const secret = formData.get('secret') as string
  const adminSecret = process.env.ADMIN_SECRET

  if (!adminSecret) {
    return { ok: false, message: 'ADMIN_SECRET não configurado.' }
  }

  if (!secret || !timingSafeEqual(secret, adminSecret)) {
    return { ok: false, message: 'Senha incorreta.' }
  }

  // Store HMAC-derived token — cookie value ≠ raw secret
  const token = await deriveSessionToken(adminSecret)

  const cookieStore = await cookies()
  cookieStore.set(SESSION_COOKIE, token, {
    httpOnly: true,
    secure: process.env.NODE_ENV === 'production',
    sameSite: 'lax',
    maxAge: 60 * 60 * 24 * 7, // 7 days
    path: '/',
  })

  return { ok: true, message: 'Autenticado.' }
}

export async function adminLogout(): Promise<void> {
  const cookieStore = await cookies()
  cookieStore.delete(SESSION_COOKIE)
}
