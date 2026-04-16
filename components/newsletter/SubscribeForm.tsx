'use client'

import { useState, useCallback } from 'react'

interface SubscribeFormProps {
  compact?: boolean
  className?: string
  onSuccess?: () => void
}

type FormState = 'idle' | 'loading' | 'success' | 'error'

/**
 * Newsletter subscribe form with client-side validation.
 */
export default function SubscribeForm({ compact = false, className = '', onSuccess }: SubscribeFormProps) {
  const [email, setEmail] = useState('')
  const [name, setName] = useState('')
  const [state, setState] = useState<FormState>('idle')
  const [errorMessage, setErrorMessage] = useState('')

  const isValidEmail = (e: string) => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(e)

  const handleSubmit = useCallback(
    async (e: React.FormEvent) => {
      e.preventDefault()
      setErrorMessage('')

      if (!email || !isValidEmail(email)) {
        setErrorMessage('Por favor, insira um email valido.')
        setState('error')
        return
      }

      setState('loading')

      try {
        const res = await fetch('/api/newsletter/subscribe', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ email, name: name || undefined }),
        })

        if (!res.ok) {
          const data = await res.json().catch(() => null)
          throw new Error(data?.error?.message ?? 'Erro ao se inscrever')
        }

        setState('success')
        setEmail('')
        setName('')
        onSuccess?.()
      } catch (err) {
        setState('error')
        setErrorMessage(err instanceof Error ? err.message : 'Erro ao se inscrever')
      }
    },
    [email, name, onSuccess]
  )

  if (state === 'success') {
    return (
      <div className={`rounded-lg bg-green-50 p-4 text-center text-green-800 ${className}`}>
        <p className="font-medium">Inscricao realizada com sucesso!</p>
        <p className="mt-1 text-sm">Voce recebera nossas atualizacoes por email.</p>
      </div>
    )
  }

  return (
    <form onSubmit={handleSubmit} className={`${className}`}>
      {!compact && (
        <div className="mb-4">
          <h3 className="text-lg font-semibold">Receba nossas atualizacoes</h3>
          <p className="mt-1 text-sm text-gray-600">
            Acompanhe as declaracoes dos politicos brasileiros.
          </p>
        </div>
      )}

      <div className={compact ? 'flex gap-2' : 'space-y-3'}>
        {!compact && (
          <input
            type="text"
            placeholder="Seu nome (opcional)"
            value={name}
            onChange={(e) => setName(e.target.value)}
            className="w-full rounded-md border border-gray-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500"
          />
        )}

        <input
          type="email"
          placeholder="Seu email"
          value={email}
          onChange={(e) => {
            setEmail(e.target.value)
            if (state === 'error') setState('idle')
          }}
          required
          className="w-full rounded-md border border-gray-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500"
        />

        <button
          type="submit"
          disabled={state === 'loading'}
          className="whitespace-nowrap rounded-md bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700 disabled:opacity-50"
        >
          {state === 'loading' ? 'Enviando...' : 'Inscrever-se'}
        </button>
      </div>

      {state === 'error' && errorMessage && (
        <p className="mt-2 text-sm text-red-600">{errorMessage}</p>
      )}
    </form>
  )
}
