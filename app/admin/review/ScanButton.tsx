'use client'

import { useState, useTransition } from 'react'
import { Radar, Loader2, CheckCircle, AlertCircle } from 'lucide-react'
import { triggerScan } from './actions'

interface ScanResult {
  ok: boolean
  inserted?: number
  skipped?: number
  errors?: number
  elapsed_ms?: number
  error?: string
}

export function ScanButton() {
  const [pending, startTransition] = useTransition()
  const [result, setResult] = useState<ScanResult | null>(null)
  const [dryRun, setDryRun] = useState(true)

  function handleScan() {
    setResult(null)
    startTransition(async () => {
      try {
        const data = await triggerScan(dryRun)
        setResult(data)
      } catch (err) {
        setResult({ ok: false, error: err instanceof Error ? err.message : 'Erro desconhecido' })
      }
    })
  }

  return (
    <div className="border border-gray-200 rounded-xl p-5 bg-white">
      <div className="flex items-center gap-2 mb-3">
        <Radar className="w-5 h-5 text-purple-600" />
        <h3 className="font-semibold text-gray-900">Scanner de declarações</h3>
      </div>
      <p className="text-sm text-gray-500 mb-4">
        Busca automática de novas declarações usando IA. Requer ANTHROPIC_API_KEY configurada.
      </p>

      <div className="flex items-center gap-3 mb-4">
        <label className="flex items-center gap-2 text-sm text-gray-700 cursor-pointer">
          <input
            type="checkbox"
            checked={dryRun}
            onChange={(e) => setDryRun(e.target.checked)}
            className="rounded border-gray-300"
          />
          Modo teste (não insere no banco)
        </label>
      </div>

      <button
        onClick={handleScan}
        disabled={pending}
        className="flex items-center gap-2 px-4 py-2 bg-purple-600 hover:bg-purple-700 disabled:opacity-50 text-white text-sm font-medium rounded-lg transition-colors"
      >
        {pending ? (
          <>
            <Loader2 className="w-4 h-4 animate-spin" />
            Escaneando...
          </>
        ) : (
          <>
            <Radar className="w-4 h-4" />
            {dryRun ? 'Testar scanner' : 'Executar scanner'}
          </>
        )}
      </button>

      {result && (
        <div className={`mt-4 p-3 rounded-lg text-sm ${result.ok ? 'bg-green-50 border border-green-200' : 'bg-red-50 border border-red-200'}`}>
          {result.ok ? (
            <div className="flex items-start gap-2">
              <CheckCircle className="w-4 h-4 text-green-600 mt-0.5 flex-shrink-0" />
              <div>
                <p className="font-medium text-green-800">
                  {result.inserted} inserida{result.inserted !== 1 ? 's' : ''}, {result.skipped} ignorada{result.skipped !== 1 ? 's' : ''}, {result.errors} erro{result.errors !== 1 ? 's' : ''}
                </p>
                {result.elapsed_ms && (
                  <p className="text-green-700 text-xs mt-1">Tempo: {(result.elapsed_ms / 1000).toFixed(1)}s</p>
                )}
              </div>
            </div>
          ) : (
            <div className="flex items-start gap-2">
              <AlertCircle className="w-4 h-4 text-red-600 mt-0.5 flex-shrink-0" />
              <p className="text-red-800">{result.error ?? 'Erro desconhecido'}</p>
            </div>
          )}
        </div>
      )}
    </div>
  )
}
