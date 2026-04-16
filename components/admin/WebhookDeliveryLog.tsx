'use client'

import { useState, useEffect, useCallback } from 'react'

interface DeliveryRecord {
  id: string
  webhook_id: string
  event: string
  response_status: number | null
  attempts: number
  delivered_at: string | null
  failed_at: string | null
  next_retry_at: string | null
  created_at: string
}

interface WebhookDeliveryLogProps {
  webhookId?: string
}

export default function WebhookDeliveryLog({ webhookId }: WebhookDeliveryLogProps) {
  const [deliveries, setDeliveries] = useState<DeliveryRecord[]>([])
  const [loading, setLoading] = useState(true)

  const fetchDeliveries = useCallback(async () => {
    try {
      setLoading(true)
      const params = new URLSearchParams()
      if (webhookId) params.set('webhook_id', webhookId)
      params.set('limit', '50')

      const res = await fetch(`/api/webhooks?action=deliveries&${params}`, {
        headers: { 'x-api-key': '' },
      })
      if (!res.ok) return
      const json = await res.json()
      setDeliveries(json.data ?? [])
    } catch {
      // Silent fail
    } finally {
      setLoading(false)
    }
  }, [webhookId])

  useEffect(() => {
    fetchDeliveries()
  }, [fetchDeliveries])

  const getStatusBadge = (delivery: DeliveryRecord) => {
    if (delivery.delivered_at) {
      return (
        <span className="inline-flex items-center rounded-full bg-green-100 px-2 py-0.5 text-xs font-medium text-green-700 dark:bg-green-900/20 dark:text-green-400">
          {delivery.response_status ?? 'OK'}
        </span>
      )
    }
    if (delivery.next_retry_at) {
      return (
        <span className="inline-flex items-center rounded-full bg-yellow-100 px-2 py-0.5 text-xs font-medium text-yellow-700 dark:bg-yellow-900/20 dark:text-yellow-400">
          Retry pendente
        </span>
      )
    }
    return (
      <span className="inline-flex items-center rounded-full bg-red-100 px-2 py-0.5 text-xs font-medium text-red-700 dark:bg-red-900/20 dark:text-red-400">
        {delivery.response_status ?? 'Falhou'}
      </span>
    )
  }

  if (loading) {
    return (
      <div className="animate-pulse space-y-2">
        {[1, 2, 3, 4, 5].map(i => (
          <div key={i} className="h-12 bg-zinc-100 rounded dark:bg-zinc-800" />
        ))}
      </div>
    )
  }

  if (deliveries.length === 0) {
    return (
      <div className="text-center py-8 text-zinc-500 dark:text-zinc-400">
        <p className="text-sm">Nenhuma entrega registrada.</p>
      </div>
    )
  }

  return (
    <div className="overflow-x-auto">
      <table className="w-full text-sm">
        <thead>
          <tr className="border-b border-zinc-200 dark:border-zinc-700">
            <th className="py-2 px-3 text-left font-medium text-zinc-500 dark:text-zinc-400">Evento</th>
            <th className="py-2 px-3 text-left font-medium text-zinc-500 dark:text-zinc-400">Status</th>
            <th className="py-2 px-3 text-left font-medium text-zinc-500 dark:text-zinc-400">Tentativas</th>
            <th className="py-2 px-3 text-left font-medium text-zinc-500 dark:text-zinc-400">Data</th>
          </tr>
        </thead>
        <tbody className="divide-y divide-zinc-100 dark:divide-zinc-800">
          {deliveries.map(delivery => (
            <tr key={delivery.id} className="hover:bg-zinc-50 dark:hover:bg-zinc-800/50">
              <td className="py-2 px-3">
                <code className="text-xs font-mono">{delivery.event}</code>
              </td>
              <td className="py-2 px-3">
                {getStatusBadge(delivery)}
              </td>
              <td className="py-2 px-3 text-zinc-600 dark:text-zinc-400">
                {delivery.attempts}
              </td>
              <td className="py-2 px-3 text-zinc-500 dark:text-zinc-400 text-xs">
                {new Date(delivery.created_at).toLocaleString('pt-BR')}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}
