'use client'

import { useEffect } from 'react'
import Link from 'next/link'
import { AlertTriangle, RotateCcw, Home, Search, Users, BookOpen } from 'lucide-react'

export default function Error({
  error,
  reset,
}: {
  error: Error & { digest?: string }
  reset: () => void
}) {
  useEffect(() => {
    console.error('[App Error]', error)
  }, [error])

  return (
    <main className="max-w-lg mx-auto px-4 py-24 text-center" role="alert" aria-live="assertive">
      <AlertTriangle className="w-12 h-12 text-red-400 mx-auto mb-4" aria-hidden="true" />
      <h1 className="text-xl font-bold text-gray-900 mb-2">Algo deu errado</h1>
      <p className="text-gray-500 text-sm mb-6">
        Ocorreu um erro inesperado. Tente recarregar a página.
      </p>
      {error.digest && (
        <p className="text-xs text-gray-400 mb-4 font-mono">Código: {error.digest}</p>
      )}
      <div className="flex items-center justify-center gap-3 flex-wrap">
        <button
          onClick={reset}
          className="flex items-center gap-1.5 px-4 py-2 rounded-lg bg-blue-600 text-white text-sm font-medium hover:bg-blue-700 transition-colors"
        >
          <RotateCcw className="w-4 h-4" />
          Tentar novamente
        </button>
        <Link href="/"
          className="flex items-center gap-1.5 px-4 py-2 rounded-lg border border-gray-200 text-gray-700 text-sm font-medium hover:bg-gray-50 transition-colors">
          <Home className="w-4 h-4" />
          Inicio
        </Link>
        <Link href="/buscar"
          className="flex items-center gap-1.5 px-4 py-2 rounded-lg border border-gray-200 text-gray-700 text-sm font-medium hover:bg-gray-50 transition-colors">
          <Search className="w-4 h-4" />
          Buscar
        </Link>
      </div>

      <div className="border-t border-gray-100 mt-10 pt-8">
        <p className="text-xs text-gray-400 uppercase tracking-wider mb-4">Navegue por</p>
        <div className="flex flex-col gap-2">
          <Link href="/politicos" className="flex items-center gap-2 text-sm text-gray-600 hover:text-blue-700 justify-center transition-colors">
            <Users className="w-4 h-4" />
            Politicos monitorados
          </Link>
          <Link href="/categorias" className="flex items-center gap-2 text-sm text-gray-600 hover:text-blue-700 justify-center transition-colors">
            <BookOpen className="w-4 h-4" />
            Categorias de declaracoes
          </Link>
        </div>
      </div>

      <div className="mt-8">
        <a
          href={`mailto:contato@registrabrasil.com.br?subject=${encodeURIComponent('Relato de problema')}&body=${encodeURIComponent(`Erro: ${error.message}\nCódigo: ${error.digest ?? 'N/A'}\nData: ${new Date().toISOString()}`)}`}
          className="text-xs text-gray-400 hover:text-gray-600 underline underline-offset-2 transition-colors"
        >
          Reportar problema
        </a>
      </div>
    </main>
  )
}
