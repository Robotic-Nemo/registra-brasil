import type { Metadata } from 'next'
import Link from 'next/link'
import { WifiOff, RotateCcw } from 'lucide-react'

export const dynamic = 'force-static'

export const metadata: Metadata = {
  title: 'Sem conexão — Registra Brasil',
  description: 'Você está offline. As páginas visitadas recentemente podem estar disponíveis no cache do navegador.',
  robots: { index: false, follow: false },
  alternates: { canonical: '/offline' },
}

export default function OfflinePage() {
  return (
    <main className="max-w-xl mx-auto px-4 py-16 text-center">
      <WifiOff className="w-12 h-12 text-gray-400 mx-auto mb-4" aria-hidden="true" />
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Sem conexão</h1>
      <p className="text-sm text-gray-600 mb-6 leading-relaxed">
        Não conseguimos alcançar o servidor. Se você já esteve em uma página antes, ela pode
        abrir a partir do cache do navegador. Reconecte e tente de novo.
      </p>

      <div className="flex flex-col sm:flex-row gap-2 items-center justify-center">
        <a
          href="/"
          className="inline-flex items-center gap-1.5 px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium rounded-lg"
        >
          <RotateCcw className="w-4 h-4" aria-hidden="true" />
          Tentar novamente
        </a>
        <Link href="/" className="text-sm text-gray-600 hover:text-gray-900 underline">
          Voltar ao início
        </Link>
      </div>

      <div className="mt-10 text-xs text-gray-500 border-t border-gray-200 pt-4">
        <p className="mb-1">O Registra Brasil funciona como aplicativo web progressivo.</p>
        <p>
          Se instalado (&ldquo;Adicionar à tela inicial&rdquo;), abre sem abrir o navegador e
          mantém cache do conteúdo visitado.
        </p>
      </div>
    </main>
  )
}
