'use client'

import Link from 'next/link'
import { useEffect } from 'react'
import { AlertTriangle, RotateCcw, Home } from 'lucide-react'

interface PageErrorProps {
  error: Error & { digest?: string }
  reset: () => void
  /** Page-specific title shown above the retry controls. */
  title?: string
  /** Pre-filled GitHub issue label / title suffix. */
  topic?: string
}

/**
 * Shared error boundary body. Individual route error.tsx files wrap this
 * to avoid repeating the same JSX + logging + GitHub-report link pattern.
 */
export function PageError({
  error,
  reset,
  title = 'Algo deu errado nesta página',
  topic = 'Erro genérico',
}: PageErrorProps) {
  useEffect(() => {
    // eslint-disable-next-line no-console
    if (process.env.NODE_ENV !== 'production') {
      console.error(`[${topic}]`, error)
    }
  }, [error, topic])

  const reportUrl = `https://github.com/Robotic-Nemo/registra-brasil/issues/new?labels=bug&title=${encodeURIComponent(topic)}&body=${encodeURIComponent(
    `**Erro:** ${error.message}\n**Código:** ${error.digest ?? 'N/A'}\n**URL:** (preencha)\n**Passos para reproduzir:**`,
  )}`

  return (
    <main role="alert" aria-live="assertive" className="max-w-lg mx-auto px-4 py-24 text-center">
      <AlertTriangle className="w-10 h-10 text-amber-400 mx-auto mb-4" aria-hidden="true" />
      <h1 className="text-lg font-bold text-gray-900 mb-2">{title}</h1>
      <p className="text-gray-500 text-sm mb-6">
        Tente novamente em alguns instantes. Se o problema persistir, reporte pelo GitHub para
        nossa equipe investigar.
      </p>
      <div className="flex items-center justify-center gap-3">
        <button
          type="button"
          onClick={reset}
          className="flex items-center gap-1.5 px-4 py-2 rounded-lg bg-blue-600 text-white text-sm font-medium hover:bg-blue-700 transition-colors focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-1 focus-visible:ring-blue-500"
        >
          <RotateCcw className="w-4 h-4" aria-hidden="true" />
          Tentar novamente
        </button>
        <Link
          href="/"
          className="flex items-center gap-1.5 px-4 py-2 rounded-lg border border-gray-200 text-gray-700 text-sm font-medium hover:bg-gray-50 transition-colors focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-1 focus-visible:ring-blue-500"
        >
          <Home className="w-4 h-4" aria-hidden="true" />
          Início
        </Link>
      </div>
      <div className="mt-8">
        <a
          href={reportUrl}
          rel="noopener noreferrer"
          target="_blank"
          className="text-xs text-gray-400 hover:text-gray-600 underline underline-offset-2 transition-colors focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500 rounded"
        >
          Reportar no GitHub
        </a>
      </div>
    </main>
  )
}
