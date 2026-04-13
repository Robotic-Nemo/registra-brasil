'use server'

import { cookies } from 'next/headers'

export async function adminLogin(
  formData: FormData
): Promise<{ ok: boolean; message: string }> {
  const secret = formData.get('secret') as string
  const adminSecret = process.env.ADMIN_SECRET

  if (!adminSecret) {
    return { ok: false, message: 'ADMIN_SECRET não configurado.' }
  }

  if (secret !== adminSecret) {
    return { ok: false, message: 'Senha incorreta.' }
  }

  const cookieStore = await cookies()
  cookieStore.set('admin_session', adminSecret, {
    httpOnly: true,
    secure: process.env.NODE_ENV === 'production',
    sameSite: 'lax',
    maxAge: 60 * 60 * 24 * 7, // 7 days
    path: '/',
  })

  return { ok: true, message: 'Autenticado.' }
}
