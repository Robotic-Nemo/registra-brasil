import Link from 'next/link'
import { FileQuestion, Search, Home } from 'lucide-react'

export default function StatementNotFound() {
  return (
    <main className="max-w-lg mx-auto px-4 py-24 text-center">
      <FileQuestion className="w-12 h-12 text-gray-300 mx-auto mb-4" />
      <h1 className="text-xl font-bold text-gray-900 mb-2">Declaração não encontrada</h1>
      <p className="text-gray-500 text-sm mb-6">
        Esta declaração não existe, foi removida ou ainda não foi verificada.
      </p>
      <div className="flex items-center justify-center gap-3">
        <Link
          href="/buscar"
          className="flex items-center gap-1.5 px-4 py-2 rounded-lg bg-blue-600 text-white text-sm font-medium hover:bg-blue-700 transition-colors"
        >
          <Search className="w-4 h-4" />
          Buscar declarações
        </Link>
        <Link
          href="/"
          className="flex items-center gap-1.5 px-4 py-2 rounded-lg border border-gray-200 text-gray-700 text-sm font-medium hover:bg-gray-50 transition-colors"
        >
          <Home className="w-4 h-4" />
          Início
        </Link>
      </div>
    </main>
  )
}
