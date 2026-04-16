'use client'

import { useState } from 'react'
import { CheckCircle, XCircle, Loader2, ExternalLink, RefreshCw } from 'lucide-react'

interface SourceToVerify {
  id: string
  url: string
}

interface VerificationResult {
  id: string
  url: string
  status: 'ok' | 'error' | 'pending'
  statusCode?: number
  error?: string
}

interface SourceVerifierProps {
  sources: SourceToVerify[]
}

export function SourceVerifier({ sources }: SourceVerifierProps) {
  const [results, setResults] = useState<VerificationResult[]>([])
  const [isRunning, setIsRunning] = useState(false)
  const [progress, setProgress] = useState(0)

  async function verifyAll() {
    setIsRunning(true)
    setResults([])
    setProgress(0)

    const batch: VerificationResult[] = []
    for (let i = 0; i < sources.length; i++) {
      const source = sources[i]
      try {
        const res = await fetch('/api/admin/verify-url', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ url: source.url }),
        })
        const data = await res.json()
        batch.push({
          id: source.id,
          url: source.url,
          status: data.ok ? 'ok' : 'error',
          statusCode: data.statusCode,
          error: data.error,
        })
      } catch {
        batch.push({
          id: source.id,
          url: source.url,
          status: 'error',
          error: 'Falha na requisicao',
        })
      }
      setProgress(i + 1)
      setResults([...batch])
    }

    setIsRunning(false)
  }

  const okCount = results.filter((r) => r.status === 'ok').length
  const errorCount = results.filter((r) => r.status === 'error').length

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      <div className="flex items-center justify-between mb-4">
        <div>
          <h3 className="text-sm font-semibold text-gray-700">Verificador de fontes</h3>
          <p className="text-xs text-gray-500 mt-0.5">
            Verifica se as URLs das fontes primarias estao acessiveis
          </p>
        </div>
        <button
          onClick={verifyAll}
          disabled={isRunning || sources.length === 0}
          className="inline-flex items-center gap-2 px-3 py-1.5 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
        >
          {isRunning ? (
            <>
              <Loader2 className="w-4 h-4 animate-spin" />
              Verificando...
            </>
          ) : (
            <>
              <RefreshCw className="w-4 h-4" />
              Verificar ({sources.length})
            </>
          )}
        </button>
      </div>

      {/* Progress bar */}
      {isRunning && (
        <div className="mb-4">
          <div className="flex items-center justify-between text-xs text-gray-500 mb-1">
            <span>{progress} de {sources.length}</span>
            <span>{Math.round((progress / sources.length) * 100)}%</span>
          </div>
          <div className="h-1.5 bg-gray-100 rounded-full overflow-hidden">
            <div
              className="h-full bg-blue-500 rounded-full transition-all"
              style={{ width: `${(progress / sources.length) * 100}%` }}
            />
          </div>
        </div>
      )}

      {/* Summary */}
      {results.length > 0 && !isRunning && (
        <div className="flex gap-4 mb-4 text-sm">
          <span className="text-green-600 font-medium">{okCount} OK</span>
          <span className="text-red-600 font-medium">{errorCount} com erro</span>
        </div>
      )}

      {/* Results */}
      {results.length > 0 && (
        <ul className="space-y-1.5 max-h-72 overflow-y-auto">
          {results
            .filter((r) => r.status === 'error')
            .concat(results.filter((r) => r.status === 'ok'))
            .map((r) => (
              <li key={r.id} className="flex items-center gap-2 text-sm px-2 py-1.5 rounded-lg hover:bg-gray-50">
                {r.status === 'ok' ? (
                  <CheckCircle className="w-4 h-4 text-green-500 shrink-0" />
                ) : (
                  <XCircle className="w-4 h-4 text-red-500 shrink-0" />
                )}
                <a
                  href={r.url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="text-gray-700 hover:text-blue-700 truncate flex-1 inline-flex items-center gap-1"
                >
                  <span className="truncate">{r.url}</span>
                  <ExternalLink className="w-3 h-3 shrink-0 text-gray-400" />
                </a>
                {r.statusCode && (
                  <span className="text-xs text-gray-400 tabular-nums">{r.statusCode}</span>
                )}
                {r.error && (
                  <span className="text-xs text-red-500">{r.error}</span>
                )}
              </li>
            ))}
        </ul>
      )}
    </div>
  )
}
