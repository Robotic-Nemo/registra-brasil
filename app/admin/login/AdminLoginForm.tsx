'use client'

import { useState, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import { adminLogin } from './actions'

export function AdminLoginForm() {
  const router = useRouter()
  const [isPending, startTransition] = useTransition()
  const [error, setError] = useState<string | null>(null)

  function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault()
    setError(null)
    const data = new FormData(e.currentTarget)

    startTransition(async () => {
      const res = await adminLogin(data)
      if (res.ok) {
        router.push('/admin')
        router.refresh()
      } else {
        setError(res.message)
      }
    })
  }

  return (
    <form onSubmit={handleSubmit} className="flex flex-col gap-4">
      {error && (
        <p className="text-sm text-red-600 bg-red-50 border border-red-200 px-3 py-2 rounded-lg">
          {error}
        </p>
      )}
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">Senha</label>
        <input
          type="password"
          name="secret"
          required
          autoFocus
          autoComplete="current-password"
          className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>
      <button
        type="submit"
        disabled={isPending}
        className="bg-blue-700 hover:bg-blue-800 disabled:opacity-60 text-white font-medium px-4 py-2.5 rounded-lg text-sm transition-colors"
      >
        {isPending ? 'Verificando...' : 'Entrar'}
      </button>
    </form>
  )
}
