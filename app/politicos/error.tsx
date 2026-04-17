'use client'

import { useEffect } from 'react'
import Link from 'next/link'
import { AlertTriangle, RotateCcw, Home } from 'lucide-react'

export default function PoliticosError({
  error,
  reset,
}: {
  error: Error & { digest?: string }
  reset: () => void
}) {
  useEffect(() => {
    console.error('[Politicos Error]', error)
  }, [error])

  return (
    <main className="max-w-lg mx-auto px-4 py-24 text-center">
      <AlertTriangle className="w-10 h-10 text-amber-400 mx-auto mb-4" />
      <h1 className="text-lg font-bold text-gray-900 mb-2">Erro ao carregar políticos</h1>
      <p className="text-gray-500 text-sm mb-6">Tente novamente em alguns instantes.</p>
      <div className="flex items-center justify-center gap-3">
        <button
          onClick={reset}
          className="flex items-center gap-1.5 px-4 py-2 rounded-lg bg-blue-600 text-white text-sm font-medium hover:bg-blue-700 transition-colors"
        >
          <RotateCcw className="w-4 h-4" />
          Tentar novamente
        </button>
        <Link href="/" className="flex items-center gap-1.5 px-4 py-2 rounded-lg border border-gray-200 text-gray-700 text-sm font-medium hover:bg-gray-50 transition-colors">
          <Home className="w-4 h-4" />
          Início
        </Link>
      </div>
      <div className="mt-8">
        <a
          href="https://github.com/Robotic-Nemo/registra-brasil/issues/new"
          rel="noopener noreferrer"
          target="_blank"
          className="text-xs text-gray-400 hover:text-gray-600 underline underline-offset-2 transition-colors"
        >
          Reportar problema
        </a>
      </div>
    </main>
  )
}
