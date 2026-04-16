import { redirect } from 'next/navigation'
import { cookies } from 'next/headers'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '@/lib/auth/session'
import { AdminLoginForm } from './AdminLoginForm'
import type { Metadata } from 'next'

export const metadata: Metadata = { title: 'Admin Login — Registra Brasil' }

export default async function AdminLoginPage() {
  // Redirect if already authenticated
  const adminSecret = process.env.ADMIN_SECRET
  if (adminSecret) {
    const cookieStore = await cookies()
    const sessionCookie = cookieStore.get(SESSION_COOKIE)?.value
    if (sessionCookie) {
      const expected = await deriveSessionToken(adminSecret)
      if (timingSafeEqual(sessionCookie, expected)) {
        redirect('/admin')
      }
    }
  }

  return (
    <main className="min-h-screen flex items-center justify-center px-4">
      <div className="w-full max-w-sm">
        <h1 className="text-xl font-bold text-gray-900 mb-6 text-center">Acesso restrito</h1>
        <AdminLoginForm />
        <p className="text-xs text-gray-400 text-center mt-4">
          Apenas editores autorizados podem acessar esta área.
        </p>
      </div>
    </main>
  )
}
