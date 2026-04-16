'use client'

import { useState, useEffect, useCallback } from 'react'

interface Webhook {
  id: string
  url: string
  description: string | null
  events: string[]
  is_active: boolean
  created_at: string
}

interface WebhookListProps {
  onEdit?: (webhook: Webhook) => void
  onTest?: (webhookId: string) => void
}

export default function WebhookList({ onEdit, onTest }: WebhookListProps) {
  const [webhooks, setWebhooks] = useState<Webhook[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const fetchWebhooks = useCallback(async () => {
    try {
      setLoading(true)
      const res = await fetch('/api/webhooks', {
        headers: { 'x-api-key': '' }, // Will be set by admin session
      })
      if (!res.ok) throw new Error('Failed to fetch webhooks')
      const json = await res.json()
      setWebhooks(json.data ?? [])
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load webhooks')
    } finally {
      setLoading(false)
    }
  }, [])

  useEffect(() => {
    fetchWebhooks()
  }, [fetchWebhooks])

  const handleDeactivate = async (id: string) => {
    try {
      const res = await fetch(`/api/webhooks?id=${id}`, {
        method: 'DELETE',
        headers: { 'x-api-key': '' },
      })
      if (res.ok) {
        setWebhooks(prev => prev.map(w => w.id === id ? { ...w, is_active: false } : w))
      }
    } catch {
      // Silently fail
    }
  }

  if (loading) {
    return (
      <div className="animate-pulse space-y-3">
        {[1, 2, 3].map(i => (
          <div key={i} className="h-20 bg-zinc-100 rounded-lg dark:bg-zinc-800" />
        ))}
      </div>
    )
  }

  if (error) {
    return (
      <div className="rounded-lg border border-red-200 bg-red-50 p-4 text-red-700 dark:border-red-800 dark:bg-red-900/20 dark:text-red-400">
        {error}
      </div>
    )
  }

  if (webhooks.length === 0) {
    return (
      <div className="text-center py-12 text-zinc-500 dark:text-zinc-400">
        <p className="text-lg font-medium">Nenhum webhook registrado</p>
        <p className="mt-1 text-sm">Registre um webhook para receber notificacoes de eventos.</p>
      </div>
    )
  }

  return (
    <div className="space-y-3">
      {webhooks.map(webhook => (
        <div
          key={webhook.id}
          className="rounded-lg border border-zinc-200 p-4 dark:border-zinc-700"
        >
          <div className="flex items-start justify-between gap-4">
            <div className="min-w-0 flex-1">
              <div className="flex items-center gap-2">
                <span
                  className={`inline-block h-2 w-2 rounded-full ${
                    webhook.is_active ? 'bg-green-500' : 'bg-zinc-400'
                  }`}
                />
                <code className="text-sm font-mono truncate block">{webhook.url}</code>
              </div>
              {webhook.description && (
                <p className="mt-1 text-sm text-zinc-500 dark:text-zinc-400">{webhook.description}</p>
              )}
              <div className="mt-2 flex flex-wrap gap-1">
                {webhook.events.slice(0, 4).map(event => (
                  <span
                    key={event}
                    className="inline-block rounded bg-zinc-100 px-2 py-0.5 text-xs text-zinc-600 dark:bg-zinc-800 dark:text-zinc-400"
                  >
                    {event}
                  </span>
                ))}
                {webhook.events.length > 4 && (
                  <span className="text-xs text-zinc-400">+{webhook.events.length - 4} mais</span>
                )}
              </div>
            </div>

            <div className="flex items-center gap-2 shrink-0">
              {onTest && webhook.is_active && (
                <button
                  onClick={() => onTest(webhook.id)}
                  className="rounded px-3 py-1 text-xs font-medium text-blue-600 hover:bg-blue-50 dark:text-blue-400 dark:hover:bg-blue-900/20"
                >
                  Testar
                </button>
              )}
              {onEdit && (
                <button
                  onClick={() => onEdit(webhook)}
                  className="rounded px-3 py-1 text-xs font-medium text-zinc-600 hover:bg-zinc-100 dark:text-zinc-400 dark:hover:bg-zinc-800"
                >
                  Editar
                </button>
              )}
              {webhook.is_active && (
                <button
                  onClick={() => handleDeactivate(webhook.id)}
                  className="rounded px-3 py-1 text-xs font-medium text-red-600 hover:bg-red-50 dark:text-red-400 dark:hover:bg-red-900/20"
                >
                  Desativar
                </button>
              )}
            </div>
          </div>

          <div className="mt-2 text-xs text-zinc-400">
            Criado em {new Date(webhook.created_at).toLocaleDateString('pt-BR')}
          </div>
        </div>
      ))}
    </div>
  )
}
