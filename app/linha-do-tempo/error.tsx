'use client'

import Link from 'next/link'

export default function TimelineError({ error, reset }: { error: Error & { digest?: string }; reset: () => void }) {
  return (
    <main className="max-w-3xl mx-auto px-4 py-16 text-center">
      <h1 className="text-2xl font-bold text-zinc-900 mb-2">Erro ao carregar linha do tempo</h1>
      <p className="text-zinc-600 mb-6">
        Não foi possível carregar os dados da linha do tempo. Tente novamente.
      </p>
      <div className="flex items-center justify-center gap-4">
        <button
          onClick={reset}
          className="px-4 py-2 bg-blue-600 text-white text-sm rounded-lg hover:bg-blue-700"
        >
          Tentar novamente
        </button>
        <Link href="/" className="text-sm text-blue-600 hover:underline">
          Voltar ao início
        </Link>
      </div>
      <div className="mt-8">
        <a
          href={`mailto:contato@registrabrasil.com.br?subject=${encodeURIComponent('Erro na linha do tempo')}&body=${encodeURIComponent(`Erro: ${error.message}\nCódigo: ${error.digest ?? 'N/A'}\nData: ${new Date().toISOString()}`)}`}
          className="text-xs text-gray-400 hover:text-gray-600 underline underline-offset-2 transition-colors"
        >
          Reportar problema
        </a>
      </div>
    </main>
  )
}
