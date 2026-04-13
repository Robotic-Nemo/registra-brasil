import type { Metadata } from 'next'
import { AdminLoginForm } from './AdminLoginForm'

export const metadata: Metadata = { title: 'Admin Login — Registra Brasil' }

export default function AdminLoginPage() {
  return (
    <main className="min-h-screen flex items-center justify-center px-4">
      <div className="w-full max-w-sm">
        <h1 className="text-xl font-bold text-gray-900 mb-6 text-center">Acesso restrito</h1>
        <AdminLoginForm />
      </div>
    </main>
  )
}
