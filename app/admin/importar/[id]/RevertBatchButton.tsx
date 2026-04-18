'use client'

import { useState, useTransition } from 'react'
import { Loader2, AlertTriangle } from 'lucide-react'
import { revertBatch } from './actions'

interface Props {
  batchId: string
  affected: number
}

export function RevertBatchButton({ batchId, affected }: Props) {
  const [confirming, setConfirming] = useState(false)
  const [reason, setReason] = useState('')
  const [pending, start] = useTransition()
  const [err, setErr] = useState<string | null>(null)

  function onSubmit() {
    setErr(null)
    start(async () => {
      try {
        await revertBatch(batchId, reason)
      } catch (e) {
        setErr(e instanceof Error ? e.message : 'Erro')
      }
    })
  }

  if (!confirming) {
    return (
      <button
        type="button"
        onClick={() => setConfirming(true)}
        className="inline-flex items-center gap-1.5 px-3 py-2 bg-red-600 hover:bg-red-700 text-white text-sm font-medium rounded"
      >
        <AlertTriangle className="w-4 h-4" aria-hidden="true" />
        Reverter {affected} declaraç{affected === 1 ? 'ão' : 'ões'}
      </button>
    )
  }

  return (
    <div className="flex flex-col gap-2">
      <p className="text-sm text-red-900">
        Confirme a reversão. Digite um motivo (obrigatório, vai parar no log de revisões):
      </p>
      <input
        type="text"
        maxLength={300}
        required
        value={reason}
        onChange={(e) => setReason(e.target.value)}
        placeholder="Motivo da reversão"
        className="w-full px-3 py-2 border border-red-300 rounded text-sm focus:outline-none focus-visible:ring-2 focus-visible:ring-red-500"
      />
      {err && <p className="text-xs text-red-800" role="alert">{err}</p>}
      <div className="flex gap-2">
        <button
          type="button"
          disabled={pending || reason.trim().length < 3}
          onClick={onSubmit}
          className="inline-flex items-center gap-1.5 px-3 py-2 bg-red-700 hover:bg-red-800 disabled:bg-gray-400 text-white text-sm font-medium rounded"
        >
          {pending ? <Loader2 className="w-4 h-4 animate-spin" /> : <AlertTriangle className="w-4 h-4" />}
          Confirmar reversão
        </button>
        <button
          type="button"
          onClick={() => setConfirming(false)}
          disabled={pending}
          className="px-3 py-2 border border-gray-300 text-gray-700 hover:bg-gray-50 text-sm rounded"
        >
          Cancelar
        </button>
      </div>
    </div>
  )
}
