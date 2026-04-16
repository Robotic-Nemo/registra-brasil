'use client'

import { useState } from 'react'
import { Webhook, Plus, Trash2, Check, X, RefreshCw, ExternalLink } from 'lucide-react'
import type { WebhookEndpoint } from '@/types/settings'

interface WebhookManagerProps {
  webhooks: WebhookEndpoint[]
}

export function WebhookManager({ webhooks: initialWebhooks }: WebhookManagerProps) {
  const [webhooks, setWebhooks] = useState(initialWebhooks)
  const [showAdd, setShowAdd] = useState(false)
  const [newUrl, setNewUrl] = useState('')
  const [newEvents, setNewEvents] = useState<string[]>([])

  const allEvents = [
    'statement.created',
    'statement.verified',
    'statement.disputed',
    'statement.removed',
    'politician.created',
    'politician.updated',
  ]

  function toggleEvent(event: string) {
    setNewEvents((prev) =>
      prev.includes(event) ? prev.filter((e) => e !== event) : [...prev, event]
    )
  }

  async function addWebhook() {
    if (!newUrl || newEvents.length === 0) return
    // Mock add - in real app, call API
    const newHook: WebhookEndpoint = {
      id: crypto.randomUUID(),
      url: newUrl,
      events: newEvents,
      isActive: true,
      secret: 'whsec_' + Math.random().toString(36).slice(2, 14),
      lastDelivery: null,
      failureCount: 0,
      createdAt: new Date().toISOString(),
    }
    setWebhooks((prev) => [...prev, newHook])
    setNewUrl('')
    setNewEvents([])
    setShowAdd(false)
  }

  function removeWebhook(id: string) {
    setWebhooks((prev) => prev.filter((w) => w.id !== id))
  }

  function toggleActive(id: string) {
    setWebhooks((prev) =>
      prev.map((w) => (w.id === id ? { ...w, isActive: !w.isActive } : w))
    )
  }

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-2">
          <Webhook className="w-4 h-4 text-gray-500" />
          <h3 className="text-sm font-semibold text-gray-700">Webhooks</h3>
        </div>
        <button
          onClick={() => setShowAdd(!showAdd)}
          className="inline-flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium text-blue-600 bg-blue-50 rounded-lg hover:bg-blue-100 transition-colors"
        >
          <Plus className="w-3.5 h-3.5" />
          Adicionar
        </button>
      </div>

      {/* Add form */}
      {showAdd && (
        <div className="bg-gray-50 border border-gray-200 rounded-lg p-4 space-y-3">
          <input
            type="url"
            value={newUrl}
            onChange={(e) => setNewUrl(e.target.value)}
            placeholder="https://example.com/webhook"
            className="w-full px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
          <div>
            <p className="text-xs font-medium text-gray-600 mb-1.5">Eventos:</p>
            <div className="flex flex-wrap gap-1.5">
              {allEvents.map((event) => (
                <button
                  key={event}
                  onClick={() => toggleEvent(event)}
                  className={`px-2 py-1 text-[10px] rounded-full border transition-colors ${
                    newEvents.includes(event)
                      ? 'bg-blue-100 border-blue-300 text-blue-700'
                      : 'bg-white border-gray-200 text-gray-500 hover:bg-gray-50'
                  }`}
                >
                  {event}
                </button>
              ))}
            </div>
          </div>
          <div className="flex gap-2">
            <button
              onClick={addWebhook}
              disabled={!newUrl || newEvents.length === 0}
              className="inline-flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 disabled:opacity-50"
            >
              <Check className="w-3 h-3" />
              Salvar
            </button>
            <button
              onClick={() => setShowAdd(false)}
              className="inline-flex items-center gap-1.5 px-3 py-1.5 text-xs text-gray-600 border border-gray-200 rounded-lg hover:bg-white"
            >
              <X className="w-3 h-3" />
              Cancelar
            </button>
          </div>
        </div>
      )}

      {/* Webhook list */}
      {webhooks.length === 0 ? (
        <p className="text-sm text-gray-500">Nenhum webhook configurado.</p>
      ) : (
        <ul className="space-y-2">
          {webhooks.map((wh) => (
            <li key={wh.id} className="bg-white border border-gray-200 rounded-lg p-3">
              <div className="flex items-start justify-between gap-2">
                <div className="min-w-0 flex-1">
                  <div className="flex items-center gap-2 mb-1">
                    <span className={`w-2 h-2 rounded-full ${wh.isActive ? 'bg-green-500' : 'bg-gray-300'}`} />
                    <a
                      href={wh.url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-sm font-medium text-gray-900 hover:text-blue-700 truncate inline-flex items-center gap-1"
                    >
                      {wh.url}
                      <ExternalLink className="w-3 h-3 shrink-0" />
                    </a>
                  </div>
                  <div className="flex flex-wrap gap-1 mb-1">
                    {wh.events.map((ev) => (
                      <span key={ev} className="px-1.5 py-0.5 text-[9px] bg-gray-100 text-gray-600 rounded">
                        {ev}
                      </span>
                    ))}
                  </div>
                  <p className="text-[10px] text-gray-400">
                    Criado em {new Date(wh.createdAt).toLocaleDateString('pt-BR')}
                    {wh.failureCount > 0 && (
                      <span className="text-red-500 ml-2">{wh.failureCount} falha(s)</span>
                    )}
                  </p>
                </div>
                <div className="flex items-center gap-1 shrink-0">
                  <button
                    onClick={() => toggleActive(wh.id)}
                    className={`p-1.5 rounded transition-colors ${wh.isActive ? 'text-green-600 hover:bg-green-50' : 'text-gray-400 hover:bg-gray-50'}`}
                    title={wh.isActive ? 'Desativar' : 'Ativar'}
                  >
                    <RefreshCw className="w-3.5 h-3.5" />
                  </button>
                  <button
                    onClick={() => removeWebhook(wh.id)}
                    className="p-1.5 rounded text-red-400 hover:bg-red-50 transition-colors"
                    title="Remover"
                  >
                    <Trash2 className="w-3.5 h-3.5" />
                  </button>
                </div>
              </div>
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}
