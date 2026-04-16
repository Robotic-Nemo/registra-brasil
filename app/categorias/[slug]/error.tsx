'use client'

import { useEffect } from 'react'
import Link from 'next/link'
import { AlertTriangle, RotateCcw, Tag } from 'lucide-react'

export default function CategoryError({
  error,
  reset,
}: {
  error: Error & { digest?: string }
  reset: () => void
}) {
  useEffect(() => {
    console.error('[Category Error]', error)
  }, [error])

  return (
    <main className="max-w-lg mx-auto px-4 py-24 text-center">
      <AlertTriangle className="w-12 h-12 text-red-400 mx-auto mb-4" />
      <h1 className="text-xl font-bold text-gray-900 mb-2">
        Erro ao carregar categoria
      </h1>
      <p className="text-gray-500 text-sm mb-6">
        Nao foi possivel carregar esta categoria. Tente novamente.
      </p>
      {error.digest && (
        <p className="text-xs text-gray-400 mb-4 font-mono">
          Codigo: {error.digest}
        </p>
      )}
      <div className="flex items-center justify-center gap-3">
        <button
          onClick={reset}
          className="flex items-center gap-1.5 px-4 py-2 rounded-lg bg-blue-600 text-white text-sm font-medium hover:bg-blue-700 transition-colors"
        >
          <RotateCcw className="w-4 h-4" />
          Tentar novamente
        </button>
        <Link
          href="/categorias"
          className="flex items-center gap-1.5 px-4 py-2 rounded-lg border border-gray-200 text-gray-700 text-sm font-medium hover:bg-gray-50 transition-colors"
        >
          <Tag className="w-4 h-4" />
          Todas as categorias
        </Link>
      </div>
      <div className="mt-8">
        <a
          href={`mailto:contato@registrabrasil.com.br?subject=${encodeURIComponent('Erro na categoria')}&body=${encodeURIComponent(`Erro: ${error.message}\nCódigo: ${error.digest ?? 'N/A'}\nData: ${new Date().toISOString()}`)}`}
          className="text-xs text-gray-400 hover:text-gray-600 underline underline-offset-2 transition-colors"
        >
          Reportar problema
        </a>
      </div>
    </main>
  )
}
