'use client'

import { useState } from 'react'
import { ALL_WEBHOOK_EVENTS, WEBHOOK_EVENT_DESCRIPTIONS } from '@/lib/webhooks/events'
import type { WebhookEventType } from '@/lib/webhooks/types'

interface WebhookFormProps {
  initialData?: {
    id?: string
    url?: string
    description?: string
    events?: string[]
  }
  onSubmit: (data: { url: string; description: string; events: string[] }) => Promise<void>
  onCancel?: () => void
}

export default function WebhookForm({ initialData, onSubmit, onCancel }: WebhookFormProps) {
  const [url, setUrl] = useState(initialData?.url ?? '')
  const [description, setDescription] = useState(initialData?.description ?? '')
  const [selectedEvents, setSelectedEvents] = useState<Set<string>>(
    new Set(initialData?.events ?? ALL_WEBHOOK_EVENTS)
  )
  const [submitting, setSubmitting] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const isEditing = !!initialData?.id

  const toggleEvent = (event: string) => {
    setSelectedEvents(prev => {
      const next = new Set(prev)
      if (next.has(event)) {
        next.delete(event)
      } else {
        next.add(event)
      }
      return next
    })
  }

  const selectAll = () => setSelectedEvents(new Set(ALL_WEBHOOK_EVENTS))
  const selectNone = () => setSelectedEvents(new Set())

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setError(null)

    if (!url.trim()) {
      setError('URL e obrigatorio')
      return
    }

    try {
      new URL(url)
    } catch {
      setError('URL invalido')
      return
    }

    if (selectedEvents.size === 0) {
      setError('Selecione pelo menos um evento')
      return
    }

    setSubmitting(true)
    try {
      await onSubmit({
        url: url.trim(),
        description: description.trim(),
        events: Array.from(selectedEvents),
      })
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Erro ao salvar webhook')
    } finally {
      setSubmitting(false)
    }
  }

  const eventGroups = {
    'Declaracoes': ALL_WEBHOOK_EVENTS.filter(e => e.startsWith('statement.')),
    'Politicos': ALL_WEBHOOK_EVENTS.filter(e => e.startsWith('politician.')),
    'Categorias': ALL_WEBHOOK_EVENTS.filter(e => e.startsWith('category.')),
  }

  return (
    <form onSubmit={handleSubmit} className="space-y-6">
      {error && (
        <div className="rounded-lg border border-red-200 bg-red-50 p-3 text-sm text-red-700 dark:border-red-800 dark:bg-red-900/20 dark:text-red-400">
          {error}
        </div>
      )}

      <div>
        <label htmlFor="webhook-url" className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">
          URL do Endpoint
        </label>
        <input
          id="webhook-url"
          type="url"
          value={url}
          onChange={e => setUrl(e.target.value)}
          placeholder="https://exemplo.com/webhook"
          required
          className="mt-1 block w-full rounded-lg border border-zinc-300 px-3 py-2 text-sm shadow-sm focus:border-blue-500 focus:ring-1 focus:ring-blue-500 dark:border-zinc-600 dark:bg-zinc-800"
        />
      </div>

      <div>
        <label htmlFor="webhook-desc" className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">
          Descricao (opcional)
        </label>
        <input
          id="webhook-desc"
          type="text"
          value={description}
          onChange={e => setDescription(e.target.value)}
          placeholder="Descricao do webhook"
          className="mt-1 block w-full rounded-lg border border-zinc-300 px-3 py-2 text-sm shadow-sm focus:border-blue-500 focus:ring-1 focus:ring-blue-500 dark:border-zinc-600 dark:bg-zinc-800"
        />
      </div>

      <div>
        <div className="flex items-center justify-between">
          <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">
            Eventos
          </label>
          <div className="flex gap-2">
            <button type="button" onClick={selectAll} className="text-xs text-blue-600 hover:underline dark:text-blue-400">
              Todos
            </button>
            <button type="button" onClick={selectNone} className="text-xs text-blue-600 hover:underline dark:text-blue-400">
              Nenhum
            </button>
          </div>
        </div>

        <div className="mt-3 space-y-4">
          {Object.entries(eventGroups).map(([group, events]) => (
            <div key={group}>
              <h4 className="text-xs font-semibold uppercase tracking-wider text-zinc-500 dark:text-zinc-400 mb-2">
                {group}
              </h4>
              <div className="space-y-1">
                {events.map(event => (
                  <label key={event} className="flex items-start gap-2 cursor-pointer">
                    <input
                      type="checkbox"
                      checked={selectedEvents.has(event)}
                      onChange={() => toggleEvent(event)}
                      className="mt-0.5 rounded border-zinc-300 text-blue-600 focus:ring-blue-500 dark:border-zinc-600"
                    />
                    <div>
                      <span className="text-sm font-mono">{event}</span>
                      <span className="block text-xs text-zinc-500 dark:text-zinc-400">
                        {WEBHOOK_EVENT_DESCRIPTIONS[event as WebhookEventType]}
                      </span>
                    </div>
                  </label>
                ))}
              </div>
            </div>
          ))}
        </div>
      </div>

      <div className="flex items-center justify-end gap-3 pt-4 border-t border-zinc-200 dark:border-zinc-700">
        {onCancel && (
          <button
            type="button"
            onClick={onCancel}
            className="rounded-lg px-4 py-2 text-sm font-medium text-zinc-700 hover:bg-zinc-100 dark:text-zinc-300 dark:hover:bg-zinc-800"
          >
            Cancelar
          </button>
        )}
        <button
          type="submit"
          disabled={submitting}
          className="rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700 disabled:opacity-50"
        >
          {submitting ? 'Salvando...' : isEditing ? 'Atualizar' : 'Registrar Webhook'}
        </button>
      </div>
    </form>
  )
}
